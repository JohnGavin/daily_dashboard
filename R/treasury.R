#' Fetch Treasury data
#'
#' @return A list containing various treasury rates
#' @export

fetch_treasury_data <- function() {
  # Define the base URL for Treasury API
  base_url <- "https://home.treasury.gov/resource-center/data-chart-center/interest-rates/json/yield"
  
  # Fetch data for the current year (or adapt as needed)
  # For simplicity, let's fetch for a recent full year
  current_year <- as.integer(format(Sys.Date(), "%Y"))
  url <- paste0(base_url, "?queryType=DailyArchive&month=all&year=", current_year)
  
  message("Fetching Treasury data directly from: ", url)
  
  response <- tryCatch({
    httr2::request(url) %>%
      httr2::req_timeout(30) %>% # Set a 30-second timeout
      httr2::req_error(is_error = ~ FALSE) %>% # Don't error on bad status, check later
      httr2::req_perform()
  }, error = function(e) {
    warning("HTTP request failed: ", e$message)
    return(NULL)
  })
  
  if (is.null(response) || httr2::resp_is_error(response)) {
    warning("Failed to fetch Treasury data. Status: ", httr2::resp_status(response))
    return(NULL)
  }
  
  data_list <- httr2::resp_body_json(response)
  
  # The API returns a list of dictionaries, where "data" key holds the actual list
  # We need to extract the "data" part and convert it to a data frame
  if (!is.null(data_list$data) && length(data_list$data) > 0) {
    treasury_df <- bind_rows(data_list$data) %>%
      janitor::clean_names() # Clean names for easier access
    
    # Convert date strings to Date objects
    # Assuming the date field is 'new_date' from janitor::clean_names
    treasury_df <- treasury_df %>%
      mutate(new_date = as.Date(new_date))
    
    message("Successfully fetched ", nrow(treasury_df), " rows of Treasury data.")
    return(treasury_df)
    
  } else {
    message("No data found in Treasury API response.")
    return(NULL)
  }
}

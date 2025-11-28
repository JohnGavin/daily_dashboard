#' Fetch Treasury data
#'
#' @return A list containing various treasury rates
#' @export
library(dplyr) # For mutate, bind_rows, %>%, etc.
library(janitor) # For clean_names()
library(rvest) # For HTML scraping
library(xml2) # For HTML parsing

# Dummy comment to force new commit
#' Fetch Treasury data

fetch_treasury_data <- function() {
  message("Starting fetch_treasury_data() with HTML scraping.")

  # Base URL for the Treasury yield curve data HTML table
  # This matches the pattern the 'treasury' package uses
  url <- paste0(
    "https://home.treasury.gov/resource-center/data-chart-center/interest-rates/",
    "TextView?type=daily_treasury_yield_curve&field_tdr_date_value=all"
  )
  
  message("Fetching Treasury data from: ", url)
  
  response <- tryCatch({
    httr2::request(url) %>%
      httr2::req_timeout(60) %>% # Extend timeout for HTML scraping
      httr2::req_error(is_error = ~ FALSE) %>%
      httr2::req_perform()
  }, error = function(e) {
    warning("HTTP request failed during HTML fetch: ", e$message)
    return(NULL)
  })
  
  if (is.null(response) || httr2::resp_is_error(response)) {
    warning("Failed to fetch Treasury HTML. Status: ", httr2::resp_status(response))
    return(NULL)
  }
  
  # Parse HTML and extract the table
  page_content <- httr2::resp_body_html(response)
  
  # The 'treasury' package often targets tables with specific attributes
  # A common pattern is to look for tables with class 'views-table' or similar
  # Based on quick inspection of Treasury website, it's often the first table with data.
  # Let's try to extract the main data table
  
  tables <- page_content %>% rvest::html_table()
  
  if (length(tables) > 0) {
    # Assume the first table is the one with the daily rates
    treasury_df <- tables[[1]] %>%
      janitor::clean_names() %>%
      mutate(date = as.Date(date)) # Convert date column

    message("Successfully scraped ", nrow(treasury_df), " rows of Treasury data.")
    return(treasury_df)
  } else {
    message("No tables found in the fetched HTML.")
    return(NULL)
  }
}

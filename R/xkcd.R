#' Fetch latest xkcd comic
#'
#' @return A list containing comic details
#' @export
fetch_xkcd <- function() {
  url <- "https://xkcd.com/info.0.json"
  resp <- httr2::request(url) |>
    httr2::req_perform() |>
    httr2::resp_body_json()
  
  # Construct explainxkcd URL
  explain_url <- paste0("https://www.explainxkcd.com/wiki/index.php/", resp$num)
  
  list(
    num = resp$num,
    title = resp$title,
    img = resp$img,
    alt = resp$alt,
    explain_url = explain_url
  )
}

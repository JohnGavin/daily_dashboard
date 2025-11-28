#' Fetch Treasury data
#'
#' @return A list containing various treasury rates
#' @export
library(logger) # Load logger package

fetch_treasury_data <- function() {
  log_info("Starting fetch_treasury_data()")

  log_info("Fetching yield curve...")
  yield_curve <- treasury::tr_yield_curve()
  log_info("Yield curve fetched.")

  log_info("Fetching bill rates...")
  bill_rates <- treasury::tr_bill_rate()
  log_info("Bill rates fetched.")

  log_info("Fetching long term rates...")
  long_term <- treasury::tr_long_term_rate()
  log_info("Long term rates fetched.")

  log_info("Fetching real yield...")
  real_yield <- treasury::tr_real_yield_curve()
  log_info("Real yield fetched.")
  
  log_info("Completed fetch_treasury_data()")
  list(
    yield_curve = yield_curve,
    bill_rates = bill_rates,
    long_term = long_term,
    real_yield = real_yield
  )
}

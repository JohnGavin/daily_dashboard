#' Fetch Treasury data
#'
#' @return A list containing various treasury rates
#' @export
fetch_treasury_data <- function() {
  # Fetch latest data (defaults to current year/month usually, or we can specify)
  # The functions return tibbles.
  
  # yield_curve <- treasury::tr_yield_curve()
  # bill_rates <- treasury::tr_bill_rate()
  # long_term <- treasury::tr_long_term_rate()
  # real_yield <- treasury::tr_real_yield_curve()
  
  list(
    # yield_curve = yield_curve,
    # bill_rates = bill_rates,
    # long_term = long_term,
    # real_yield = real_yield
  )
}

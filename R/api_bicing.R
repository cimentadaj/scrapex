##' REST API for Bicycle usage in Barcelona
##'
##' Bicing is a Bicycle-sharing system in the city of Barcelona, Spain, which was implemented in March 2007, promoted by the City Council.
##'
##' This API wraps a manually downloaded set of bicycle stations from the city. Every time the API is invoked, a random number of bicycles are assigned as 'being used' and the timestamp in the returning dataset is updated with the current time.
##'
##' The API has no parameters
##'
##' This function launches a plumber API in a new R process using `callr` and return the `callr` process.
##'
##' @return callr result of the individual R process
##' @author Jorge Cimentada
##' @export
##'
##' @examples
##'
##' \dontrun{
##'   live_api <- api_bicing()
##'   live_api$kill()
##' }
##'
api_bicing <- function() {
  launch_api("api_bicing")
}

serve_api_bicing_slots <- function() {
  bicing$current_time <- Sys.time()
  bicing$in_use <- sapply(bicing$slots, function(x) sample(0:x, 1))
  bicing
}

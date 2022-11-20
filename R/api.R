##' Launches an API in a new R process
##'
##' @param function_name the folder name where the plumber API is located. This should be in inst/plumber/
##'
##' @return callr result of the individual R process
##' @author Jorge Cimentada
##'
##' @examples
##'
##' \dontrun{
##'   live_api <- launch_api("api_coveragedb")
##'   live_api$kill()
##' }
##'
launch_api <- function(function_name) {
  random_port <- httpuv::randomPort()

  rp <- callr::r_bg(function(random_port) {
    api <- plumber::plumb_api("scrapex", function_name)
    plumber::pr_run(api, port = random_port)
  }, args = list(random_port = random_port))

  print(paste0("Visit your REST API at http://localhost:", random_port))
  print(paste0("Documentation is at http://localhost:", random_port, "/__docs__/"))

  rp
}

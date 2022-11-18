##' Custom rest API for examples
##' @return Whatever
##' @author Jorge Cimentada
##' @export
##'
##' @examples
##'
##' \dontrun{
##'   live_api <- api_coveragedb()
##'   live_api$kill()
##' }
##'
api_coveragedb <- function() {
  random_port <- httpuv::randomPort()

  rp <- callr::r_bg(function(random_port) {
    api <- plumber::plumb_api("scrapex", "api_coveragedb")
    plumber::pr_run(api, port = random_port)
  }, args = list(random_port = random_port))

  print(paste0("Visit your REST API at http://localhost:", random_port))
  print(paste0("Documentation is at http://localhost:", random_port, "/__docs__/"))

  rp
}

serve_api_coveragedb <- function(region, sex) {
  tmp <- api_coveragedb_data[1:2, ]
  tmp
}

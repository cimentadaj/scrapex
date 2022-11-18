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
    pkg_dir <- system.file(package = "scrapex")
    dir_data <- file.path(pkg_dir, "extdata", "api_coveragedb", "plumber.R")
    plumber::pr_run(plumber::pr(dir_data), port = random_port)
  }, args = list(random_port = random_port))

  print(paste0("Visit your REST API at http://localhost:", random_port))
  print(paste0("Documentation is at http://localhost:", random_port, "/__docs__/"))

  rp
}

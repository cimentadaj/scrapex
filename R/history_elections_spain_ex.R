##' This example hosts data from the website https://en.wikipedia.org/wiki/Elections_in_Spain
##' which documents and collects data on all elections in Spain. This function returns the
##' full HTML links to the local HTML files that can be used as exercises for scraping
##' the data as if this was the online hosted version.
##'
##' Please note that this website are not meant
##' to be used to reliably explore their hyperlinks or other features, as
##' these will change inevitably when the website changes some of it's
##' structures. This is because some of the links still point to the
##' real website or other platforms.
##'
##' @title Return the paths to the complete HTML website of the history of elections in Spain
##' @return A character vector with with 1 local HTML link
##' @author Jorge Cimentada
##' @export
##'
##' @examples
##'
##' library(xml2)
##' library(scrapex)
##'
##' one_link <- history_elections_spain_ex()
##'
##' read_html(one_link)
##'
##' \dontrun{
##' # If you want to look at the website in your browser
##' # just wrap it in prep_browser and pass it to browseURL
##' browseURL(prep_browser(one_link))
##' }
##'
history_elections_spain_ex <- function() {
  pkg_dir <- system.file(package = "scrapex")
  dir_data <- file.path(pkg_dir, "extdata", "history_elections_spain/")

  html_files <-
    list.files(dir_data,
               pattern = "Elections_.+\\.html$",
               recursive = TRUE,
               full.names = TRUE)

  html_files
}

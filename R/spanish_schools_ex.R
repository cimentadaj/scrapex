##' This example hosts data from the website https://www.buscocolegio.com/
##' which tries to aggregate data on all schools in Spain. To build reliable
##' and self-standing scraping examples, this package downloaded data on 27
##' randomly sampled schools from this website. This function returns the full
##' HTML links to the local HTML files that can be used as exercises for
##' scraping some data.
##'
##' All images should work well out of the box except the Google maps on the
##' right. Please note that these websites are not meant
##' to be used to reliably explore their hyperlink or other features, as
##' these will change inevitably when the website changes some of it's
##' structures. This is because some of the links still point to the
##' real website. 
##' 
##' @title Return the paths to the complete HTML website of a sample of Spanish Schools
##' @return A character vector with 27 local HTML links
##' @author Jorge Cimentada
##' @export
##'
##' @examples
##'
##' library(xml2)
##' library(scrapex)
##'
##' one_link <- spanish_schools_ex()[5]
##'
##' read_html(one_link)
##'
##' \dontrun{
##' # If you want to look at the website in your browser
##' # just wrap it in prep_browser and pass it to browseURL
##' browseURL(prep_browser(one_link))
##' }
##'
spanish_schools_ex <- function() {
  pkg_dir <- system.file(package = "scrapex")
  dir_data <- file.path(pkg_dir, "extdata", "spanish_schools_ex")
               
  html_files <-
    list.files(dir_data,
               pattern = "detalles-colegio\\.action.+\\.html$",
               recursive = TRUE,
               full.names = TRUE)

  html_files
}

##' @title Prepare local HTML links to open with your browser
##' @param x a character vector of HTML files
##' @return the same character vector but with "file://" appended to it
##' @author Jorge Cimentada
##' @export
##' @examples
##'
##' library(xml2)
##' library(scrapex)
##'
##' one_link <- spanish_schools_ex()[5]
##' prep_browser(one_link)
##'
##' \dontrun{
##' # You can open it with your browser with browseURL
##' browseURL(prep_browser(one_link))
##' }
##' 
prep_browser <- function(x) {
  ready_html <- paste0("file://", x)
  ready_html
}

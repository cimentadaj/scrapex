##' This example hosts data from the website https://www.buscocolegio.com/
##' which tries to aggregate data on all schools in Spain. To build reliable
##' and self-standing scraping examples, this package downloaded data on 27
##' randomly sampled schools from this website. This function returns the full
##' HTML links to the local HTML files that can be used as exercises for
##' scraping some data.
##'
##' Some images should not work well out of the box including the Google maps on the
##' right. Please note that these websites are not meant
##' to be used to reliably explore their hyperlinks or other features, as
##' these will change inevitably when the website changes some of it's
##' structures. This is because some of the links still point to the
##' real website or other platforms. 
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
##' one_link <- spanish_schools_ex()[1]
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
               pattern = "school_.+\\.html$",
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
##' one_link <- spanish_schools_ex()[1]
##' prep_browser(one_link)
##'
##' \dontrun{
##' # You can open it with your browser with browseURL
##' browseURL(prep_browser(one_link))
##' }
##'
##' # There have been failed attempts with Windows explorer and other browsers
##' # from time to time. In case you want to try it out with other browsers,
##' # just paste the example link of the html website from
##' # prep_browser(one_link) to your browser and it should open locally.
##' 
prep_browser <- function(x) {
  ready_html <- paste0("file://", x)
  ready_html
}

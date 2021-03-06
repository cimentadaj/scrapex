% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spanish_schools_ex.R
\name{prep_browser}
\alias{prep_browser}
\title{Prepare local HTML links to open with your browser}
\usage{
prep_browser(x)
}
\arguments{
\item{x}{a character vector of HTML files}
}
\value{
the same character vector but with "file://" appended to it
}
\description{
Prepare local HTML links to open with your browser
}
\examples{

library(xml2)
library(scrapex)

one_link <- spanish_schools_ex()[1]
prep_browser(one_link)

\dontrun{
# You can open it with your browser with browseURL
browseURL(prep_browser(one_link))
}

# There have been failed attempts with Windows explorer and other browsers
# from time to time. In case you want to try it out with other browsers,
# just paste the example link of the html website from
# prep_browser(one_link) to your browser and it should open locally.

}
\author{
Jorge Cimentada
}

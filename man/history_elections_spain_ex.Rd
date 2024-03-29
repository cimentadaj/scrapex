% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/history_elections_spain_ex.R
\name{history_elections_spain_ex}
\alias{history_elections_spain_ex}
\title{Return the paths to the complete HTML website of the history of elections in Spain}
\usage{
history_elections_spain_ex()
}
\value{
A character vector with with 1 local HTML link
}
\description{
This example hosts data from the website https://en.wikipedia.org/wiki/Elections_in_Spain
which documents and collects data on all elections in Spain. This function returns the
full HTML links to the local HTML files that can be used as exercises for scraping
the data as if this was the online hosted version.
}
\details{
Please note that this website are not meant
to be used to reliably explore their hyperlinks or other features, as
these will change inevitably when the website changes some of it's
structures. This is because some of the links still point to the
real website or other platforms.
}
\examples{

library(xml2)
library(scrapex)

one_link <- history_elections_spain_ex()

read_html(one_link)

\dontrun{
# If you want to look at the website in your browser
# just wrap it in prep_browser and pass it to browseURL
browseURL(prep_browser(one_link))
}

}
\author{
Jorge Cimentada
}

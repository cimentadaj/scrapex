##' REST API for the COVerAGE-DB database
##'
##' COVerAGE-DB is an open-access database that includes cumulative counts of confirmed COVID-19 cases, deaths, tests, and vaccines by age and sex. The main goal of COVerAGE-DB is to provide a centralized, standardized, age-harmonized, and fully reproducible database of COVID-19 data. For more information, visit
##'
##' This API wraps a custom download performed locally of the database and filters only 'California', 'Utah' and 'New York State' for both sexes (`m` and `f` in the database).
##'
##' The API has two parameters which can be filtered:
##'
##' * region: 'California', 'Utah' and 'New York State'
##' * sex: `m` and `f`
##'
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
##'   live_api <- api_coveragedb()
##'   live_api$kill()
##' }
##'
api_coveragedb <- function() {
  launch_api("api_coveragedb")
}

filter_cases <- function(df) df[df$Measure == "Cases", ]
filter_vaccine <- function(df) df[df$Measure %in% c("Vaccination1", "Vaccination2", "Vaccination3"), ]

serve_api_coveragedb <- function(df, region, sex) {
  region_filter <- df$Region == region
  sex_filter <- df$Sex == sex
  tmp <- df[region_filter & sex_filter, ]
  tmp
}


serve_api_coveragedb_cases <- function(region, sex, req, res) {

  if (!req$args$region %in% c("California", "Utah", "New York State")) {
    res$status <- 400
    return(list(error = "Only regions 'California', 'Utah' and 'New York State' are permitted."))
  }

  if (!req$args$sex %in% c("m", "f")) {
    res$status <- 400
    return(list(error = "Only values m and f are permitted"))
  }


  df <- filter_cases(api_coveragedb_data)
  serve_api_coveragedb(df, region, sex)
}

serve_api_coveragedb_vaccine <- function(region, sex, req, res) {

  if (!req$args$region %in% c("California", "Utah", "New York State")) {
    res$status <- 400
    return(list(error = "Only regions 'California', 'Utah' and 'New York State' are permitted."))
  }

  if (!req$args$sex %in% c("m", "f")) {
    res$status <- 400
    return(list(error = "Only values m and f are permitted"))
  }


  df <- filter_vaccine(api_coveragedb_data)
  serve_api_coveragedb(df, region, sex)
}

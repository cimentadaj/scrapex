## code to prepare `api_coveragedb` dataset goes here
library(covidAgeData)
library(lubridate)
library(dplyr)

inputDB <- download_covid("inputDB", progress = FALSE)

raw_api_coveragedb <-
  inputDB %>%
  subset_covid(Country = "USA") %>%
  as_tibble()

api_coveragedb_data <-
  raw_api_coveragedb %>%
  as_tibble() %>%
  mutate(Date = dmy(Date)) %>%
  filter(
    Measure == "Cases",
    between(Date, ymd("2020-01-01"), ymd("2021-12-31")),
    Region %in% c("California", "New York State", "Utah"),
    Metric == "Count",
    AgeInt == 10,
    Sex %in% c("m", "f")
  )


## library(ggplot2)
## api_coveragedb %>%
##   ggplot(aes(Date, Value, group = Age, color = Age)) +
##   geom_line() +
##   facet_wrap(Sex ~ Region) +
##   theme_bw()

usethis::use_data(api_coveragedb_data, overwrite = TRUE, internal = TRUE)

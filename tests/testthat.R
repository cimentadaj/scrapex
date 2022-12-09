library(testthat)
library(scrapex)

main_test <- function(html_links, name, len = 1) {
  test_that(paste0(name, " returns correct examples"), {
    expect_length(html_links, n = len)
    expect_true(class(html_links) == "character")
  })

  test_that("prep_browser appends correctly", {
    new_link <- prep_browser(html_links[1])
    expect_true(class(new_link) == "character")
    expect_true(grepl("^file://", new_link))
  })

}

test_api_is_alive <- function(api) {
  # Is alive for about 10 seconds
  is_alive <- c()
  for (i in 1:15) {
    Sys.sleep(0.5)
    is_alive <- c(is_alive, api$process$is_alive())
  }

  expect_true(all(is_alive))
}


test_check("scrapex")


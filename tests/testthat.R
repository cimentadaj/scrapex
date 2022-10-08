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

test_check("scrapex")

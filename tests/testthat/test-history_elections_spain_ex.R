html_links <- history_elections_spain_ex()

test_that("spanish_schools_ex returns correct examples", {
  expect_length(html_links, n = 1)
  expect_true(class(html_links) == "character")
})

test_that("prep_browser appends correctly", {
  new_link <- prep_browser(html_links[1])

  expect_length(new_link, n = 1)
  expect_true(class(new_link) == "character")
  expect_true(grepl("^file://", new_link))
})

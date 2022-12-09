coveragedb_test <- function(res, type, region, sex) {
  expect_s3_class(res, "tbl_df")
  expect_gt(nrow(res), 0)
  expect_gt(ncol(res), 0)
  expect_true(unique(res$Region) == region)
  expect_true(unique(res$Sex) == sex)
  expect_true(all(unique(res$Measure) %in% type))
}

test_that("api_coveragedb is alive and works", {
  test_api_is_alive(api_coveragedb())
})

for (state in c("California", "Utah", "New York State")) {
  for (sex in c("m", "f")) {

    req <- list(args = list(region = state, sex = sex))
    res <- list()

    text <- paste0(
      "serve_api_coveragedb_cases for ",
      state,
      " - ",
      sex,
      " returns correct results"
    )

    test_that(text, {
      res <- serve_api_coveragedb_cases(state, sex, req, res)
      coveragedb_test(res, "Cases", state, sex)
    })


    test_that(text, {
      res <- serve_api_coveragedb_cases(state, sex, req, res)
      coveragedb_test(res, "Cases", state, sex)
    })


    text <- paste0(
      "serve_api_coveragedb_vaccine for ",
      state,
      " - ",
      sex,
      " returns correct results"
    )

    test_that(text, {
      res <- serve_api_coveragedb_vaccine(state, sex, req, res)
      coveragedb_test(res, c("Vaccination1", "Vaccination2", "Vaccination3"), state, sex)
    })
  }
}

test_that("serve_api_coveragedb_* returns error on wrong region", {
    req <- list(args = list(region = "Penn", sex = "m"))
    res <- list()

    error_cases <- serve_api_coveragedb_cases(state, sex, req, res)
    expect_identical(
      error_cases$error,
      "Only regions 'California', 'Utah' and 'New York State' are permitted."
    )

    error_vaccine <- serve_api_coveragedb_vaccine(state, sex, req, res)
    expect_identical(
      error_vaccine$error,
      "Only regions 'California', 'Utah' and 'New York State' are permitted."
    )
})

test_that("serve_api_coveragedb_* returns error on wrong sex", {
  req <- list(args = list(region = "California", sex = "p"))
  res <- list()

  error_cases <- serve_api_coveragedb_cases(state, sex, req, res)
  expect_identical(
    error_cases$error,
    "Only values m and f are permitted"
  )

  error_vaccine <- serve_api_coveragedb_vaccine(state, sex, req, res)
  expect_identical(
    error_vaccine$error,
    "Only values m and f are permitted"
  )
})

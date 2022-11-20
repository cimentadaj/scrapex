coveragedb_test <- function(res, type, region, sex) {
  expect_s3_class(res, "tbl_df")
  expect_gt(nrow(res), 0)
  expect_gt(ncol(res), 0)
  expect_true(unique(res$Region) == region)
  expect_true(unique(res$Sex) == sex)
  expect_true(all(unique(res$Measure) %in% type))
}

for (state in c("California", "Utah", "New York State")) {
  for (sex in c("m", "f")) {

    text <- paste0(
      "serve_api_coveragedb_cases for ",
      state,
      " - ",
      sex,
      " returns correct results"
    )

    test_that(text, {
      res <- serve_api_coveragedb_cases(state, sex)
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
      res <- serve_api_coveragedb_vaccine(state, sex)
      coveragedb_test(res, c("Vaccination1", "Vaccination2", "Vaccination3"), state, sex)
    })
  }
}

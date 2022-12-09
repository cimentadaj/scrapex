# TODO: Add tests for each function in the bicing API. Adapt the code below to Bicing.

test_that("api_bicing is alive and works", {
  test_api_is_alive(api_bicing())
})


## coveragedb_test <- function(res, type, region, sex) {
##   expect_s3_class(res, "tbl_df")
##   expect_gt(nrow(res), 0)
##   expect_gt(ncol(res), 0)
##   expect_true(unique(res$Region) == region)
##   expect_true(unique(res$Sex) == sex)
##   expect_true(all(unique(res$Measure) %in% type))
## }

## test_that(text, {
##   res <- serve_api_coveragedb_vaccine(state, sex, req, res)
##   coveragedb_test(res, c("Vaccination1", "Vaccination2", "Vaccination3"), state, sex)
## })

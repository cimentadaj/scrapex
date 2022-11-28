# TODO: Add tests for each function in the amazon API. Adapt the code below to Amazon.

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


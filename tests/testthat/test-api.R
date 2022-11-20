quiet <- function(x) {
  sink(tempfile())
  on.exit(sink())
  invisible(force(x))
}


test_that("launch_api returns `rcall` process", {
  new_api <- quiet(launch_api("coveragedb"))
  expect_s3_class(new_api, c("r_process", "process", "R6"))
  new_api$kill()
})

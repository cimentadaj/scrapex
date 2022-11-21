quiet <- function(x) {
  sink(tempfile())
  on.exit(sink())
  invisible(force(x))
}


test_that("launch_api returns correct output", {
  new_api <- quiet(launch_api("coveragedb"))
  expect_true(class(new_api) == "list")
  expect_s3_class(new_api$process, c("r_process", "process", "R6"))
  expect_true(class(new_api$api_web) == "character")
  new_api$process$kill()
})

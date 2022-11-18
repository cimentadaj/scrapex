# api_coveragedb

#* Access number of COVID cases for the American states California, Utah and New York.
#* @param region The region to subset. Available only 'California', 'Utah' and 'New York'
#* @param sex The sex to subset. Available only 'm' and 'f'
#* @serialize json
#* @get /api/v1/covid_cases
function(region, sex) {
  tmp <- api_coveragedb_data[1:2, ]
  jsonlite::toJSON(tmp)
  list(msg = paste0("The message is: '", msg, "'"))
}

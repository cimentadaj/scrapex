# api_coveragedb

#* Access number of COVID cases for the American states California, Utah and New York State.
#* @param region The region to subset. Available only 'California', 'Utah' and 'New York State'
#* @param sex The sex to subset. Available only 'm' and 'f'
#* @serialize json
#* @get /api/v1/covid_cases
scrapex:::serve_api_coveragedb_cases

#* Access number of vaccinated COVID people for the American states California, Utah and New York State.
#* @param region The region to subset. Available only 'California', 'Utah' and 'New York State'
#* @param sex The sex to subset. Available only 'm' and 'f'
#* @serialize json
#* @get /api/v1/covid_vaccines
scrapex:::serve_api_coveragedb_vaccine

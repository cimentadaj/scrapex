# api_coveragedb

#* Validate token
#* @filter validate_token
function(req, res) {
  ## TODO: move this function to `api_amazon.R` and add test
  ## check that if auth is not supplied, it returns all
  ## expected errors

  # If the incoming website is any doc related website, skip authorization.
  docs_website <- any(
    stringr::str_detect(
      req$PATH_INFO,
      "__docs__|__swagger__|openapi\\.json")
  )

  if (!docs_website) {
    supplied_token <- req$HEADERS["authorization"]

    if (is.na(supplied_token)) {
      res$status <- 401 # Unauthorized
      return(list(error = "No authorization bearer provided"))
    }

    if (!supplied_token %in% paste0("Bearer ", scrapex:::all_tokens())) {
      res$status <- 498 # Unauthorized
      return(list(error = "Authorization bearer not valid"))
    }

  }

  plumber::forward()
}


#* Access Amazon authors with their genre
#* @serialize json
#* @get /api/v1/amazon/authors
scrapex:::serve_api_amazon_unique_author

#* Access Amazon books
#* @param author:str The author from which to access all books
#* @param genre:str The genre from which to access all books
#* @get /api/v1/amazon/books
scrapex:::serve_api_amazon_books_db

#* Access Amazon Texts
#* @param author:str The author from which to access all books
#* @serialize json
#* @get /api/v1/amazon/texts
scrapex:::serve_api_amazon_text_db

#* Access countries available in the User Database
#* @serialize json
#* @get /api/v1/amazon/countries
scrapex:::serve_api_amazon_unique_country

#* Access Amazon's User database
#* @param user_id:int The ID of the user to inspect
#* @param country:str The country from which to access all users living there.
#* @serialize json
#* @get /api/v1/amazon/users
scrapex:::serve_api_amazon_user_db

#* Access Amazon's Products/Users database
#* @param user_id:int The ID of the user to inspect
#* @serialize json
#* @get /api/v1/amazon/products_users
scrapex:::serve_api_amazon_products_user_db

#* Access Amazon's Products database
#* @param product_id:int The ID of the user to inspect
#* @serialize json
#* @get /api/v1/amazon/products
scrapex:::serve_api_amazon_products_db


# api_coveragedb

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
#* @get /api/v1/amazon/products
scrapex:::serve_api_amazon_products_user_db

#* Access Amazon's Products database
#* @param user_id:int The ID of the user to inspect
#* @serialize json
#* @get /api/v1/amazon/products
scrapex:::serve_api_amazon_products_db

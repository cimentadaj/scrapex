##' REST API for the Books/Products of Amazon Website
##'
##' Using the Faker API (https://fakerapi.it/en), this API generates fake but reasonably structured data representing books and products from an internal 'Amazon API'. This API serves as educational purposes only.
##'
##'
##' This function launches a plumber API in a new R process using `callr` and return the `callr` process.
##'
##' @return callr result of the individual R process
##' @author Jorge Cimentada
##' @export
##'
##' @examples
##'
##' \dontrun{
##'   live_api <- api_amazon()
##'   live_api$kill()
##' }
##'
api_amazon <- function() {
  launch_api("api_amazon")
}

serve_api_amazon_unique_author <- function() {
  distinct_author
}

serve_api_amazon_unique_country <- function() {
  distinct_countries
}

serve_api_amazon_products_db <- function() {
  products_db
}

serve_api_amazon_books_db <- function(author, genre) {
  # TODO: convert user_id into list column to return as JSON
  author_filter <- books_db$author == author
  genre_filter <- books_db$genre == genre
  books_db[author_filter & genre_filter, ]

}

serve_api_amazon_text_db <- function(author) {
  author_filter <- books_db$author == author
  text_db[author_filter, ]
}

serve_api_amazon_user_db <- function(user_id = NULL, country = NULL, req, res) {
  if (is.null(user_id) & is.null(country)) {
    res$status <- 400
    return(list(error = "Need to specify either `user_id` or `country`"))
  }

  if (!is.null(user_id) & !is.null(country)) {
    res$status <- 400
    return(list(error = "cannot specify `user_id` and `countries` in same call. Specify only one."))
  }

  if (!is.null(user_id)) {
    user_filter <- user_db$user_id == user_id
    final_res <- user_db[user_filter, ]
  }

  if (!is.null(country)) {
    country_filter <- user_db$countries == country
    final_res <- user_db[country_filter, ]
  }

  final_res
}

## serve_api_user_db(user_id = 970, req = list(), res = list())
## serve_api_user_db(country = "China", req = list(), res = list())
## serve_api_user_db(user_id = 970, country = "China", req = list(), res = list())
## serve_api_user_db(req = list(), res = list())

serve_api_amazon_products_user_db <- function(user_id) { #nolintr
  user_filter <- user_db$user_id == user_id
  final_res <- products_user_db[user_filter, ]
  final_res
}

## serve_api_products_user_db(user_id = 319)


## serve_api_products_db()

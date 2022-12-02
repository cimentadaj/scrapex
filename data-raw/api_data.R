## code to prepare `api_coveragedb` dataset goes here
library(covidAgeData)
library(lubridate)
library(dplyr)

inputDB <- download_covid("inputDB", progress = FALSE, tmp = TRUE)

raw_api_coveragedb <-
  inputDB %>%
  subset_covid(Country = "USA") %>%
  as_tibble()

api_coveragedb_data <-
  raw_api_coveragedb %>%
  as_tibble() %>%
  mutate(Date = dmy(Date)) %>%
  filter(
    Measure %in% c("Cases", "Vaccination1", "Vaccination2", "Vaccination3"),
    between(Date, ymd("2020-01-01"), ymd("2021-12-31")),
    Region %in% c("California", "New York State", "Utah"),
    Metric == "Count",
    AgeInt == 10,
    Sex %in% c("m", "f")
  )

## library(ggplot2)
## api_coveragedb %>%
##   ggplot(aes(Date, Value, group = Age, color = Age)) +
##   geom_line() +
##   facet_wrap(Sex ~ Region) +
##   theme_bw()

## code to prepare `api_amazon` dataset goes here
library(httr2)
library(tibble)
library(jsonlite)
library(dplyr)
library(glue)
library(tidyr)
library(mosaicData)

seed <- "21311412"
books <- glue("https://fakerapi.it/api/v1/books?_quantity=5&_seed={seed}")
texts <- glue("https://fakerapi.it/api/v1/texts?_quantity=5&_characters=100&_seed={seed}")
user <- glue("https://fakerapi.it/api/v1/users?_quantity=100&_seed={seed}")
products <- glue("https://fakerapi.it/api/v1/products?_quantity=100&_seed={seed}")


# endpoint args: author, genre
res <- req_perform(request(books))
books_db <-
  res %>%
  resp_body_json() %>%
  .[["data"]] %>%
  lapply(as_tibble) %>%
  bind_rows()


# endpoint args: author title
res <- req_perform(request(texts))
text_db <-
  res %>%
  resp_body_json() %>%
  .[["data"]] %>%
  lapply(as_tibble) %>%
  bind_rows()

countries <-
  Countries %>%
  drop_na() %>%
  filter(gapminder != "") %>%
  pull(gapminder) %>%
  unique()

# endpoint args country user_id
set.seed(1231)
res <- req_perform(request(user))
user_db <-
  res %>%
  resp_body_json() %>%
  .[["data"]] %>%
  lapply(as_tibble) %>%
  bind_rows() %>%
  mutate(countries = sample(countries, nrow(.), replace = TRUE))

distinct_countries <-
  user_db %>%
  distinct(countries)

# endpoint args product_id user_id tags
res <- req_perform(request(products))
products_user_db <-
  res %>%
  resp_body_string() %>%
  fromJSON() %>%
  .[["data"]] %>%
  as_tibble() %>%
  select(-categories)

# endpoint user_id
res <- req_perform(request(products))
products_db <- products_user_db %>% select(id, name, description)

set.seed(1231)
id_books <- sample(1:1000, nrow(books_db))

books_db <-
  books_db %>%
  rename(id_book = id) %>%
  mutate(id_book = id_books)

text_db$title <- books_db$title
text_db$author <- books_db$author
text_db$genre <- NULL

text_db <-
  text_db %>%
  mutate(
    id_books = id_books
  ) %>%
  relocate(id_books, everything())

text_db

set.seed(1231)
user_db <-
  user_db %>%
  select(countries, macAddress, ip) %>%
  mutate(user_id = sample(1:1000, nrow(.))) %>%
  relocate(user_id, everything())

set.seed(1231)
products_user_db <-
  products_user_db %>%
  mutate(user_id = sample(user_db$user_id, nrow(.), replace = TRUE)) %>%
  rename(product_id = id) %>%
  relocate(product_id, user_id, everything()) %>%
  select(-name, -description)

books_db <- bind_rows(lapply(1:5, function(x) books_db))
set.seed(1231)
books_db$user_id <- sample(user_db$user_id, nrow(books_db))
books_db <- books_db %>% arrange(title, author)

distinct_author <-
  books_db %>%
  distinct(author, genre)

######  Save all datasets #######
usethis::use_data(
  distinct_countries,
  distinct_author,
  books_db,
  text_db,
  user_db,
  products_user_db,
  products_db,
  api_coveragedb_data,
  overwrite = TRUE,
  internal = TRUE
)

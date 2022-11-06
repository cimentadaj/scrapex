history_france_link <- "https://en.wikipedia.org/wiki/History_of_France"

# download a complete page with wget
# https://superuser.com/questions/55040/save-a-single-web-page-with-background-images-with-wget
download_req <- paste0("wget -E -H -k -K -p ", history_france_link)

system(download_req)

file_cp <- list.files("en.wikipedia.org",
  pattern = "\\.html",
  recursive = TRUE,
  full.names = TRUE
)

file.copy(
  file_cp,
  "History_Of_France.html"
)

# Remove all convoluted folder structure
unlink(c("en.wikipedia.org", "upload.wikimedia.org"), recursive = TRUE)

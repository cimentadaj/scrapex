retirement_link <- "https://english.elpais.com/"


# download a complete page with wget
# https://superuser.com/questions/55040/save-a-single-web-page-with-background-images-with-wget
download_req <- paste0("wget -E -H -k -K -p ", retirement_link)

system(download_req)

file_cp <- list.files("en.wikipedia.org",
  pattern = "\\.html",
  recursive = TRUE,
  full.names = TRUE
)

file.copy(
  file_cp,
  "Retirement_in_Europe.html"
)

# Remove all convoluted folder structure
unlink(c("en.wikipedia.org", "upload.wikimedia.org"), recursive = TRUE)

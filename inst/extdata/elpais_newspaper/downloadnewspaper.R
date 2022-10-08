newspaper_link <- "https://english.elpais.com/"


# download a complete page with wget
# https://superuser.com/questions/55040/save-a-single-web-page-with-background-images-with-wget
download_req <- paste0("wget -E -H -k -K -p ", newspaper_link)

system(download_req)

file_cp <- list.files("english.elpais.com",
  pattern = "\\.html$",
  recursive = TRUE,
  full.names = TRUE
)

file.copy(
  file_cp,
  "elpais_newspaper.html"
)

# Remove all convoluted folder structure
unlink(c(
  "arcsubscriptions.elpais.com",
  "ep00.epimg.net",
  "static.elpais.com",
  "contributor.google.com",
  "english.elpais.com"
), recursive = TRUE)

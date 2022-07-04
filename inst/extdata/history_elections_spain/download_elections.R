elections_link <- "https://en.wikipedia.org/wiki/Elections_in_Spain"

# download a complete page with wget
# https://superuser.com/questions/55040/save-a-single-web-page-with-background-images-with-wget
download_req <- paste0("wget -E -H -k -K -p ", elections_link)

system(download_req)

file_cp <- list.files("en.wikipedia.org",
  pattern = "\\.html",
  recursive = TRUE,
  full.names = TRUE
)

file.copy(
  file_cp,
  "Elections_Spain.html"
)


image_cp <- list.files("upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Spanish_Elections_for_Congress_of_Deputies.svg/",
  pattern = "\\.svg.png",
  recursive = TRUE,
  full.names = TRUE
)

# Save the file with a simpler name to avoid CRAN check
# fails. Save this in the folder to
# avoid having a deep structure of folders.
replacement <- paste0(c("small", "medium", "large"), "_elections.svg.png")
file.copy(
  image_cp,
  replacement
)

# Remove all convoluted folder structure
unlink(c("en.wikipedia.org", "upload.wikimedia.org"), recursive = TRUE)

# Need to replace convoluted image names in full html by simpler ones
to_replace <- paste0("../../upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Spanish_Elections_for_Congress_of_Deputies.svg/", c(349, 524, 698),"px-Spanish_Elections_for_Congress_of_Deputies.svg.png")

# Read the html
entire_html <- readLines("./Elections_Spain.html")

# Replace the convoluted paths/names for simpler ones
for (i in seq_along(replacement)) {
  entire_html <- gsub(to_replace[i], replacement[i], entire_html)
}

# Overwrite the html with the simpler one
writeLines(entire_html, "Elections_Spain.html")

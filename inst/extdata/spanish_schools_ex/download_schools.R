# All school codes of interest

school_codes <- c("3006839",
                  "8067961",
                  "8051276",
                  "15012626",
                  "43007464",
                  "37013560",
                  "2009158",
                  "28062606",
                  "8052190",
                  "28063003",
                  "43007491",
                  "43007579",
                  "30018357",
                  "43007555",
                  "28061663",
                  "15013308",
                  "28043727",
                  "37013687",
                  "37013705",
                  "8067971",
                  "2009122",
                  "28060661",
                  "37013638",
                  "28061675",
                  "37013663",
                  "43007440",
                  "28061262")

raw_dir <- here::here("inst/extdata")
proj_dir <- file.path(raw_dir, "spanish_schools_ex")
dir.create(proj_dir)
setwd(proj_dir)

dir_school <- vector("character", length(school_codes))

for (i in seq_along(school_codes)) {

  Sys.sleep(3)
  print(paste0("School ", i))
  school_links <-
    paste0("https://www.buscocolegio.com/Colegio/detalles-colegio.action?id=",
           school_codes[i])

  dir_school[i] <- file.path(proj_dir, school_codes[i])
  dir.create(dir_school[i])

  # download a complete page with wget
  # https://superuser.com/questions/55040/save-a-single-web-page-with-background-images-with-wget
  download_req <-
    paste0("wget -E -H -k -K -p ", school_links)

  setwd(dir_school[i])
  system(download_req)

  # Search only for the HTML of the example that contains
  # the most information (without needing the CSS files, etc..)
  # This had to be done manually to identify which is the important
  # file.
  file_cp <- list.files("./www.buscocolegio.com/Colegio/",
                        pattern = "\\.orig",
                        recursive = TRUE,
                        full.names = TRUE)

  # Save the file with a simpler name to avoid CRAN check
  # fails. Save this in the spanish_schools_ex folder to
  # avoid having a deep structure of folders.
  file.copy(file_cp,
            paste0("../school_", school_codes[i], ".html"))

  # Delete this webpage's folder to save space and sanity
  unlink(dir_school[i], recursive = TRUE)
}

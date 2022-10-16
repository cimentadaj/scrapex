library(glue)
library(stringr)
library(readr)

gelman_link <- "https://statmodeling.stat.columbia.edu/"

# download a complete page with wget
# https://superuser.com/questions/55040/save-a-single-web-page-with-background-images-with-wget
download_req <- paste0("wget -E -H -k -K -p ", gelman_link)

system(download_req)

all_files <- c(
  "inst/extdata/gelman_blog/statmodeling.stat.columbia.edu/wp-content/plugins/twenty-eleven-theme-extensions/moztheme2011.css?ver=6.0.2.css",
  "inst/extdata/gelman_blog/statmodeling.stat.columbia.edu/wp-content/plugins/wp-to-twitter/css/twitter-feed.css?ver=6.0.2.css",
  "inst/extdata/gelman_blog/statmodeling.stat.columbia.edu/wp-content/themes/twentyeleven/blocks.css?ver=20190102.css",
  "inst/extdata/gelman_blog/statmodeling.stat.columbia.edu/wp-content/plugins/wp-to-twitter/css/twitter-feed.css?ver=6.0.2orig",
  "inst/extdata/gelman_blog/statmodeling.stat.columbia.edu/wp-content/themes/twentyeleven/style.css?ver=20220127.css",
  "inst/extdata/gelman_blog/statmodeling.stat.columbia.edu/wp-content/themes/twentyeleven/style.css?ver=20220127orig",
  "inst/extdata/gelman_blog/statmodeling.stat.columbia.edu/wp-includes/css/dist/block-library/style.min.css?ver=6.0.2.css",
  "inst/extdata/gelman_blog/statmodeling.stat.columbia.edu/wp-includes/js/wp-embed.min.js?ver=6.0.2"
)

all_files <- file.path("~/repositories/scrapex", all_files)

question_replacer <- function(x) str_replace_all(x, "\\?", "%3F")

file_name <- question_replacer(basename(all_files))
new_file_name <- str_replace_all(file_name, "\\%3F.+$", "")
new_dir_name <- file.path(dirname(all_files), new_file_name)

path_html <- "statmodeling.stat.columbia.edu/index.html"
index_file <- read_lines(path_html)

for (i in seq_along(file_name)) {
  index_file <- str_replace_all(index_file, file_name[i], new_file_name[i])
}

file.rename(all_files, new_dir_name)

write_lines(index_file, path_html)

system("mv statmodeling.stat.columbia.edu stats")


long_names <- c(
  "~/repositories/scrapex/inst/extdata/gelman_blog/stats/wp-content/plugins/twenty-eleven-theme-extensions/moztheme2011.css",
  "~/repositories/scrapex/inst/extdata/gelman_blog/stats/wp-content/themes/twentyeleven/images/comment-arrow-bypostauthor.png",
  "~/repositories/scrapex/inst/extdata/gelman_blog/stats/wp-content/uploads/2022/07/Screen-Shot-2022-07-24-at-9.42.48-PM.png",
  "~/repositories/scrapex/inst/extdata/gelman_blog/stats/wp-content/uploads/2022/07/Screen-Shot-2022-07-24-at-9.42.53-PM.png",
  "~/repositories/scrapex/inst/extdata/gelman_blog/stats/wp-content/uploads/2022/07/Screen-Shot-2022-07-24-at-9.44.15-PM.png",
  "~/repositories/scrapex/inst/extdata/gelman_blog/stats/wp-content/uploads/2022/07/Screen-Shot-2022-07-24-at-9.44.25-PM.png",
  "~/repositories/scrapex/inst/extdata/gelman_blog/stats/wp-content/uploads/2022/07/Screen-Shot-2022-07-24-at-9.46.05-PM.png",
  "~/repositories/scrapex/inst/extdata/gelman_blog/stats/wp-content/uploads/2022/07/Screen-Shot-2022-07-25-at-2.44.07-AM.png",
  "~/repositories/scrapex/inst/extdata/gelman_blog/www.hi-paris.fr/2022/09/15/bob-carpenter-11-october-2022/embed/index.html",
  "~/repositories/scrapex/inst/extdata/gelman_blog/www.hi-paris.fr/2022/09/15/bob-carpenter-11-october-2022/embed/index.html.orig",
  "~/repositories/scrapex/inst/extdata/gelman_blog/www.hi-paris.fr/wp-content/uploads/2020/09/cropped-favico-150x150.png",
  "~/repositories/scrapex/inst/extdata/gelman_blog/www.hi-paris.fr/wp-content/uploads/2022/09/Hi-PARIS_Seminar_BobCarpenter_header-1024x248.jpg",
  "~/repositories/scrapex/inst/extdata/gelman_blog/www.hi-paris.fr/wp-content/uploads/2022/09/Hi-PARIS_Seminar_BobCarpenter_header-300x73.jpg",
  "~/repositories/scrapex/inst/extdata/gelman_blog/www.hi-paris.fr/wp-content/uploads/2022/09/Hi-PARIS_Seminar_BobCarpenter_header-720x175.jpg",
  "~/repositories/scrapex/inst/extdata/gelman_blog/www.hi-paris.fr/wp-content/uploads/2022/09/Hi-PARIS_Seminar_BobCarpenter_header-768x186.jpg",
  "~/repositories/scrapex/inst/extdata/gelman_blog/www.hi-paris.fr/wp-content/uploads/2022/09/Hi-PARIS_Seminar_BobCarpenter_header.jpg"
)

unlink(long_names, force = TRUE)

empty_folders <- c(
  "scrapex/inst/extdata/gelman_blog/stats/wp-content/plugins/twenty-eleven-theme-extensions",
"scrapex/inst/extdata/gelman_blog/stats/wp-content/uploads/2022/07",
"scrapex/inst/extdata/gelman_blog/www.hi-paris.fr/2022/09/15/bob-carpenter-11-october-2022/embed",
"scrapex/inst/extdata/gelman_blog/www.hi-paris.fr/2022/09/15/bob-carpenter-11-october-2022",
"scrapex/inst/extdata/gelman_blog/www.hi-paris.fr/2022/09/15",
"scrapex/inst/extdata/gelman_blog/www.hi-paris.fr/2022/09",
"scrapex/inst/extdata/gelman_blog/www.hi-paris.fr/2022",
"scrapex/inst/extdata/gelman_blog/www.hi-paris.fr/wp-content/uploads/2022/09",
"scrapex/inst/extdata/gelman_blog/www.hi-paris.fr/wp-content/uploads/2022"
)

empty_folders <- file.path("~/repositories", empty_folders)

unlink(empty_folders, recursive = TRUE, force = TRUE)

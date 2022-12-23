
<!-- README.md is generated from README.Rmd. Please edit that file -->

# scrapex

Since web scraping and API tutorials are deemed to be obsolete once they
changes it’s structure or go down indefinately, `scrapex` saves specific
web paths of certain websites to make scraping examples reproducibly in
the long term. Moreover, it `scrapex` contains local copies of custom
APIs for educational purposes using the `plumber` package. To make the
package as lightweight as possible, for the local copies of websites,
some images/figures/maps have been excluded. Aside from that, most
examples should contain the rough skeleton of the original website.

## Installation

`scrapex` will probably never see the light of CRAN since it is deemed
to grow in size if new examples come along, so you need to install the
development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("cimentadaj/scrapex")
```

## Website Example

`scrapex` contains websites which have been saved locally for users to
use as examples. Each example has only one function which returns the
local links to the html websites. For example, for the spanish schools
examples (see `?spanish_schools_ex` for documentation on the example),
we can obtain the links with `spanish_schools_ex()`:

``` r
library(scrapex)
library(xml2)

school_websites <- spanish_schools_ex()
school_websites
#>  [1] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_15012626.html"
#>  [2] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_15013308.html"
#>  [3] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_2009122.html" 
#>  [4] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_2009158.html" 
#>  [5] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_28043727.html"
#>  [6] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_28060661.html"
#>  [7] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_28061262.html"
#>  [8] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_28061663.html"
#>  [9] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_28061675.html"
#> [10] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_28062606.html"
#> [11] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_28063003.html"
#> [12] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_30018357.html"
#> [13] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_3006839.html" 
#> [14] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_37013560.html"
#> [15] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_37013638.html"
#> [16] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_37013663.html"
#> [17] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_37013687.html"
#> [18] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_37013705.html"
#> [19] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_43007440.html"
#> [20] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_43007464.html"
#> [21] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_43007491.html"
#> [22] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_43007555.html"
#> [23] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_43007579.html"
#> [24] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_8051276.html" 
#> [25] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_8052190.html" 
#> [26] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_8067961.html" 
#> [27] "/tmp/Rtmph3vN2y/temp_libpath524336b0c86d6/scrapex/extdata/spanish_schools_ex/school_8067971.html"
```

To browse the actual website of one of these links, use `prep_browser`
with `openURL`:

``` r
browseURL(prep_browser(school_websites)[1])
```

To actually scrape information from these websites, they work as
expected with `read_html`.

``` r
# You can read them with `read_html`
read_html(school_websites[1])
#> {html_document}
#> <html lang="es-es">
#> [1] <head>\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8 ...
#> [2] <body>\r\n  \r\n      <a href="#contenidoPpal" class="sr-only">Saltar a c ...
```

## API example

All APIs in `scrapex` export a function that launches the API. These
functions start with `api_*`. For example, loading the local copy of the
API for the public bicycle system of Barcelona can be done like this:

``` r
library(scrapex)
library(httr2)
#> 
#> Attaching package: 'httr2'
#> The following object is masked from 'package:xml2':
#> 
#>     url_parse
bicing <- api_bicing()
#> [1] "Visit your REST API at http://localhost:3330"
#> [1] "Documentation is at http://localhost:3330/__docs__/"
```

You’ll see that the API returns a link to the documentation of the API
as well as to the main URL of the API. Users can then make requests just
as if this was a real API. For example:

``` r
rt_bicing <- paste0(bicing$api_web, "/api/v1/real_time_bicycles")
resp_output <- 
  rt_bicing %>%
  request() %>% 
  req_perform() %>%
  resp_body_json() %>%
  lapply(data.frame) %>%
  do.call(rbind, .)

resp_output
#>    type latitude longitude                     streetName streetNumber slots
#> 1  BIKE  41.3980    2.1800       Gran Via Corts Catalanes          760    29
#> 2  BIKE  41.3955    2.1771        Roger de Flor/ Gran Vía          126    27
#> 3  BIKE  41.3941    2.1813                         Nàpols           82    27
#> 4  BIKE  41.3935    2.1816                          Ribes           13    20
#> 5  BIKE  41.3911    2.1802              Pg Lluís Companys           11    39
#> 6  BIKE  41.3913    2.1806              Pg Lluís Companys           18    39
#> 7  BIKE  41.3889    2.1833              Pg Lluís Companys            1    23
#> 8  BIKE  41.3891    2.1836              Pg Lluís Companys            2    26
#> 9  BIKE  41.3845    2.1849         Marquès de l'Argentera           13    26
#> 10 BIKE  41.3817    2.1939                Passeig Marítim           19    21
#> 11 BIKE  41.3845    2.1957         Pg Marítim Barceloneta           23    29
#> 12 BIKE  41.3869    2.1958               Avinguda Litoral           16     3
#> 13 BIKE  41.3847    2.1850 Avinguda del Marques Argentera           15    26
#> 14 BIKE  41.3948    2.1712                         Girona           68    18
#> 15 BIKE  41.3983    2.1867                  Av. Meridiana           47    21
#> 16 BIKE  41.3982    2.1867                  Av. Meridiana           47    21
#> 17 BIKE  41.4061    2.1742                       Rosselló          453    26
#> 18 BIKE  41.4033    2.1707                       Rosselló          354    28
#> 19 BIKE  41.4102    2.1758                      Cartagena          308    20
#> 20 BIKE  41.4109    2.1740       Sant Antoni Maria Claret          214     2
#>           current_time in_use
#> 1  2022-12-23 17:43:33     29
#> 2  2022-12-23 17:43:33     12
#> 3  2022-12-23 17:43:33     13
#> 4  2022-12-23 17:43:33     17
#> 5  2022-12-23 17:43:33     14
#> 6  2022-12-23 17:43:33      8
#> 7  2022-12-23 17:43:33      1
#> 8  2022-12-23 17:43:33     26
#> 9  2022-12-23 17:43:33     26
#> 10 2022-12-23 17:43:33      7
#> 11 2022-12-23 17:43:33     21
#> 12 2022-12-23 17:43:33      3
#> 13 2022-12-23 17:43:33      1
#> 14 2022-12-23 17:43:33     15
#> 15 2022-12-23 17:43:33     14
#> 16 2022-12-23 17:43:33      3
#> 17 2022-12-23 17:43:33     20
#> 18 2022-12-23 17:43:33     21
#> 19 2022-12-23 17:43:33      1
#> 20 2022-12-23 17:43:33      2
```

## Collaboration

This package is a work in progress and welcomes more examples from
different backgrounds. If you want to contribute to the package you can
send a pull request following these guidelines:

-   One function that clearly states the substantive theme of your
    example (for example, `spanish_schools_ex` for web scraping or
    `api_*` for an API). This function should return the full local path
    of the html for each single page of your example (**not the full
    local path to the complete website**) for web scraping and a list
    with the `callr` process and the API website for an API.

-   For webscraping, all of your local example files should be in a
    folder located in `inst/extdata` with the same name as the main
    function. Within this folder, there should be only one `.R` file
    which shows how the download was done. We aim to keep the package as
    lightweight as possible so, for example, it would be important to
    delete large files and complicated (long) paths. Keep in mind two
    things: nested directories with very long names (standard when
    saving a website) and complicated file names (containing dots,
    question marks, equal signs, etc…) will throw errors when running
    `devtools::check()`. For the `spanish_schools_ex` I downloaded each
    path to the websites, identified the relevant html, renamed it to
    something shorter and valid, moved only that file to the
    `spanish_schools_ex` folder and deleted the website’s complete
    directory structure. The result is only one html file for each path
    of the website.

-   For APIs, internal functions should go within one single `api_*.R`
    file. The API itself should be located in `/inst/plumber/`.

For webscraping, I encourage anyone looking to do a PR to look at the
one for `spanish_schools_ex` which is called `download_school.R` (note
that this is tricky because downloading a path of a website many times
results in downloading the **complete** website. Look at the example in
`download_school.R` to only download single paths). For the API example,
I encourage users to look at the file `R/api_coveragedb.R` and
`inst/plumber/api_coveragedb/`.

-   Each main function should have an accompanied test file that has
    **at least** the same tests as `spanish_schools_ex()`. Similarly for
    APIs for `api_coveragedb()`.

All suggestions are very welcome if you feel this is not the most
optimal storage strategy! Open an issue request and we’ll discuss it.

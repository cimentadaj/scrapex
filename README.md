
<!-- README.md is generated from README.Rmd. Please edit that file -->

# scrapex

Since web scraping tutorials are deemed to be obsolete once a website
changes it’s structure or goes down indefinately, `scrapex` saves
specific web paths of certain websites to make scraping examples
reproducibly in the long term.

## Installation

`scrapex` will probably never see the light of CRAN because it’s too
heavy, so you need to install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("cimentadaj/scrapex")
```

## Example

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
#>  [1] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/15012626/www.buscocolegio.com/Colegio/detalles-colegio.action?id=15012626.html"
#>  [2] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/15013308/www.buscocolegio.com/Colegio/detalles-colegio.action?id=15013308.html"
#>  [3] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/2009122/www.buscocolegio.com/Colegio/detalles-colegio.action?id=2009122.html"  
#>  [4] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/2009158/www.buscocolegio.com/Colegio/detalles-colegio.action?id=2009158.html"  
#>  [5] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/28043727/www.buscocolegio.com/Colegio/detalles-colegio.action?id=28043727.html"
#>  [6] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/28060661/www.buscocolegio.com/Colegio/detalles-colegio.action?id=28060661.html"
#>  [7] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/28061262/www.buscocolegio.com/Colegio/detalles-colegio.action?id=28061262.html"
#>  [8] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/28061663/www.buscocolegio.com/Colegio/detalles-colegio.action?id=28061663.html"
#>  [9] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/28061675/www.buscocolegio.com/Colegio/detalles-colegio.action?id=28061675.html"
#> [10] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/28062606/www.buscocolegio.com/Colegio/detalles-colegio.action?id=28062606.html"
#> [11] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/28063003/www.buscocolegio.com/Colegio/detalles-colegio.action?id=28063003.html"
#> [12] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/30018357/www.buscocolegio.com/Colegio/detalles-colegio.action?id=30018357.html"
#> [13] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/3006839/www.buscocolegio.com/Colegio/detalles-colegio.action?id=3006839.html"  
#> [14] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/37013560/www.buscocolegio.com/Colegio/detalles-colegio.action?id=37013560.html"
#> [15] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/37013638/www.buscocolegio.com/Colegio/detalles-colegio.action?id=37013638.html"
#> [16] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/37013663/www.buscocolegio.com/Colegio/detalles-colegio.action?id=37013663.html"
#> [17] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/37013687/www.buscocolegio.com/Colegio/detalles-colegio.action?id=37013687.html"
#> [18] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/37013705/www.buscocolegio.com/Colegio/detalles-colegio.action?id=37013705.html"
#> [19] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/43007440/www.buscocolegio.com/Colegio/detalles-colegio.action?id=43007440.html"
#> [20] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/43007464/www.buscocolegio.com/Colegio/detalles-colegio.action?id=43007464.html"
#> [21] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/43007491/www.buscocolegio.com/Colegio/detalles-colegio.action?id=43007491.html"
#> [22] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/43007555/www.buscocolegio.com/Colegio/detalles-colegio.action?id=43007555.html"
#> [23] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/43007579/www.buscocolegio.com/Colegio/detalles-colegio.action?id=43007579.html"
#> [24] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/8051276/www.buscocolegio.com/Colegio/detalles-colegio.action?id=8051276.html"  
#> [25] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/8052190/www.buscocolegio.com/Colegio/detalles-colegio.action?id=8052190.html"  
#> [26] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/8067961/www.buscocolegio.com/Colegio/detalles-colegio.action?id=8067961.html"  
#> [27] "/usr/local/lib/R/site-library/scrapex/extdata/spanish_schools_ex/8067971/www.buscocolegio.com/Colegio/detalles-colegio.action?id=8067971.html"
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
#> [1] <head>\n<meta http-equiv="Content-Type" content="text/html; charset= ...
#> [2] <body>\r\n  \r\n      <a href="detalles-colegio.action%3Fid=15012626 ...
```

This package is a work in progress and welcomes more examples from
different backgrounds. If you want to contribute to the package you can
send a pull request following these guidelines:

  - One function that clearly states the substantive theme of your
    example (for example, `spanish_school_ex`). This function should
    return the full local path of the html for each single page of your
    example (**not the full local path complete website**).

  - All of your local example files should be in a zipped file located
    in `inst/extdata` with the same name as the main function. Within
    this zip file, there should be only one `.R` file which shows how
    the download was done. I encourage anyone looking to do a PR to look
    at the one for `spanish_school_ex` which is called
    `download_school.R` (note that this is tricky because downloading a
    path of a website many times results in downloading the **complete**
    website. Look at the example in `download_school.R` to only download
    single paths).

  - Each main function should have an accompanied test file that has
    **at least** the same tests as `spanish_school_ex()`.

Before sending a PR, I strongly suggest you look at the source code of
`spanish_school_ex()` to see the expected structure. All suggestions are
very welcome if you feel this is not the most optimal storage strategy\!
Open an issue request and we’ll discuss it.

# broadcast <img src='man/figures/logo.png' align="right" height="150" /></a>

<!-- badges: start -->
[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![R-CMD-check](https://github.com/MikeJohnPage/broadcast/actions/workflows/check-release.yaml/badge.svg)](https://github.com/MikeJohnPage/broadcast/actions/workflows/check-release.yaml)
<!-- badges: end -->

## Overview
Broadcast data from your R package to the world

## Installation
You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("humaniverse/broadcast")
```

## Usage
Call `broadcast::broadcast()` in the root directory of your R package to
broadcast .rda files from your `data/` folder into .csv files in a folder called
`.broadcast`. Alternative paths can be supplied using the arg `from`. An
optional file called `.broadcastignore` can be specified in the `.broadcast`
folder to ignore broadcasting certain file types. This additional file should
use the same syntax as `.gitignore`.
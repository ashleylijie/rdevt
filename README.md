
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rdevt

In order to familiarize with an r package development process.

## Installation

You can install the development version of rdevt from
[GitHub](https://github.com/ashleylijie/rdevt) with:

``` r
devtools::install_github("ashleylijie/rdevt")
```

## Example

``` r
library(rdevt)

# basic example code
numverify(number = 14158586273)
#> $valid
#> [1] TRUE
#> 
#> $number
#> [1] "8614158586273"
#> 
#> $local_format
#> [1] "14158586273"
#> 
#> $international_format
#> [1] "+8614158586273"
#> 
#> $country_prefix
#> [1] "+86"
#> 
#> $country_code
#> [1] "CN"
#> 
#> $country_name
#> [1] "China (People's Republic of)"
#> 
#> $location
#> [1] ""
#> 
#> $carrier
#> [1] ""
#> 
#> $line_type
#> [1] "special_services"
```

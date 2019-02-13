#' @importFrom attempt stop_if_not
#' @importFrom curl has_internet
check_internet <- function(){
    stop_if_not(.x = has_internet(), msg = "Please check your internet connexion")
}

#' @importFrom httr status_code
check_status <- function(res){
    stop_if_not(.x = status_code(res),
                .p = ~ .x == 200,
                msg = "The API returned an error")
}


#' Numverify : Validate Phone Number
#'
#' @param country_code Country code, default China : "CN".
#' @param number Phone number
#'
#' @importFrom attempt stop_if_all
#' @importFrom purrr compact
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET
#' @export
#' @rdname numverify
#'
#' @return the results from the validation
#' @examples
#' \dontrun{
#' numverify(number = 14158586273)
#' }

numverify <- function(country_code = "CN", number = NULL){
    args <- list(country_code, number)
    # Check that at least one argument is not null
    stop_if_all(args, is.null, "You need to specify at least one argument")

    base_url <- sprintf("http://apilayer.net/api/validate?access_key=d6dc18ea3d89f8673e3451055c5a587a&country_code=%s&number=%s",
                        country_code, number)

    # Chek for internet
    check_internet()
    # Create the
    res <- GET(base_url)
    # Check the result
    check_status(res)
    # Get the content and return it as a data.frame
    fromJSON(rawToChar(res$content))
}

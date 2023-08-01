#' Save a Dataset to CSV File
#'
#' This function gets a dataset by its name and saves it as a CSV file in the
#' specified path. This function should not be exported to the end user of the R
#' package.
#'
#' @param data_name A string. The name of the dataset you want to save.
#' @param path A string. The directory where you want to save the CSV file.
#'
#' @return None. The function does not return any value. It saves the dataset as
#'  a CSV file in the specified directory.
#' @keywords internal
#' @examples
#' \dontrun{
#' # Save the mtcars dataset to the current working directory
#' data_save("mtcars", ".")
#' }
save_broadcast <- function(data_name, path) {
  data <- get(data_name)
  utils::write.csv(
    data,
    file = paste0(path, "/", data_name, ".csv"),
    row.names = FALSE
  )
}

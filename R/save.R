#' Save a Dataset to CSV File
#'
#' This function gets a dataset by its name and saves it as a CSV file in the
#' specified path. This function should not be exported to the end user of the R
#' package.
#'
#' @param dataset_name A string. The name of the dataset you want to save.
#' @param path A string. The directory where you want to save the CSV file.
#'
#' @return None. The function does not return any value. It saves the dataset as
#'  a CSV file in the specified directory.
#' @keywords internal
#' @examples 
#' \dontrun{
#'   # Save the mtcars dataset to the current working directory
#'   dataset_save("mtcars", ".")
#' }
dataset_save <- function(dataset_name, path) {
  data <- get(dataset_name)
  write.csv(data,
    file = paste0(path, "/", dataset_name, ".csv"),
    row.names = FALSE
  )
}

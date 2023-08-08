#' Append the Broadcast Folder to a File
#'
#' This internal function appends the broadcast folder `.broadcast` to the end
#' of the specified file. It's used within the package and is not intended to be
#' called by the end user.
#'
#' @param file_name The name of the file to which the broadcast folder will be
#' appended.
#'
#' @return None, this function is called for its side effects.
#'
#' @keywords internal
#' @examples
#' \dontrun{
#' append_broadcast("path/to/file.txt")
#' }
append_broadcast <- function(file_name) {
  con <- file(file_name, open = "a")
  write("^\\.broadcast$", con)
  close(con)
}

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

#' Read .broadcastignore File
#'
#' This internal function reads the .broadcastignore file from the .broadcast
#' directory and compiles a list of files to ignore based on the specified
#' patterns. Patterns in the .broadcastignore file should be specified using
#' the syntax used in .gitignore files.
#'
#' @param path A string. The directory containing the files to be ignored.
#'
#' @return A character vector containing the full paths to the files that match
#'   the ignore patterns specified in the .broadcastignore file.
#' @keywords internal
#' @examples
#' \dontrun{
#' read_broadcastignore("data")
#' }
read_broadcastignore <- function(path) {
  check_path(path)

  if (file.exists(".broadcast/.broadcastignore")) {
    ignore_patterns <- readLines(".broadcast/.broadcastignore")

    # Remove empty lines and comments
    ignore_patterns <- ignore_patterns[
      nchar(ignore_patterns) > 0 & !grepl("^#", ignore_patterns)
    ]

    # Initialize a list to store the matched files
    ignored_files <- list()

    # Iterate through the ignore patterns and find matching files
    for (pattern in ignore_patterns) {
      # Convert the pattern into a valid regex pattern
      pattern <- gsub("\\.", "\\.", pattern) # Escape dot
      pattern <- gsub("\\*", ".*", pattern) # Replace asterisk with .*
      pattern <- gsub("\\?", ".", pattern) # Replace question mark with .

      # If the pattern starts with a slash, it should match the beginning of the
      # filename
      if (startsWith(pattern, "/")) {
        pattern <- paste0("^", substr(pattern, 2, nchar(pattern)))
      }

      # Get the list of files in the directory that match the pattern
      files <- list.files(
        path = path,
        pattern = pattern,
        recursive = TRUE
      )

      # Append the matched files to the list
      ignored_files <- c(ignored_files, files)
    }

    ignored_files <- unlist(ignored_files)

    return(ignored_files)
  }
}

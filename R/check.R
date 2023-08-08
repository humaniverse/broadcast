#' Check and Create a Specified Folder
#'
#' This function checks whether the specified folder exists within the current
#' directory. If the folder does not exist, it is created.
#'
#' @param folder The path to the folder that needs to be checked and possibly
#'  created.
#'
#' @return None, this function is called for its side effects.
#'
#' @keywords internal
#' @examples
#' \dontrun{
#' check_folder("path/to/folder")
#' }
check_folder <- function(folder) {
  if (!dir.exists(folder)) {
    dir.create(folder, recursive = TRUE)
  }
}

#' Check if a File Path is Valid
#'
#' This function checks if the provided 'path' argument is a valid file path.
#' If not, it throws an error. This function should not be exported to the end
#' user of the R package.
#'
#' @param path A string. The path to the file you want to check.
#'
#' @return None. The function does not return any value. If the path is not
#'  valid, it stops the function execution and throws an error.
#' @keywords internal
#' @examples
#' \dontrun{
#' # Check if the path to the "mtcars.csv" file in the current working
#' # directory is valid
#' check_path("./mtcars.csv")
#' }
check_path <- function(path) {
  if (!file.exists(path)) {
    stop("The supplied 'path' does not exist or is not valid.")
  }
}

#' Manage the Broadcast Folder in .Rbuildignore File
#'
#' This internal function checks whether the `.Rbuildignore` file exists and
#' then appends the `.broadcast` folder. If the file does not exist, the user is
#' prompted whether they want to create it. It's used within the package and is
#' not intended to be called by the end user.
#'
#' @return None, this function is called for its side effects.
#'
#' @keywords internal
#' @seealso \code{\link{append_broadcast}} for the function that appends the
#'  broadcast folder.
#' @examples
#' \dontrun{
#' check_rbuildignore()
#' }
check_rbuildignore <- function() {
  if (file.exists(".Rbuildignore")) {
    append_broadcast(".Rbuildignore")
    cat("Folder `.broadcast` appended to", ".Rbuildignore", "\n")
  } else {
    create_file <- readline(
      prompt = paste(
        ".Rbuildignore",
        "does not exist. Would you like to create it? (y/n): "
      )
    )
    if (tolower(create_file) == "y") {
      file.create(".Rbuildignore")
      append_broadcast(".Rbuildignore")
      cat("File", ".Rbuildignore", "created and appended with `.broadcast`\n")
    } else {
      cat("File", ".Rbuildignore", "was not created\n")
    }
  }
}

#' Check if Any .rda Files Exist in a Given Path
#'
#' This function checks if any .rda files exist in the provided 'path'. If no
#' .rda files are found, it throws an error. If .rda files are found, it doesn't
#' return anything. This function should not be exported to the end user of the
#' R package.
#'
#' @param path A string. The path to the directory you want to check for .rda
#'  files.
#'
#' @return Nothing. The function doesn't return any value, but throws an error
#'  if no .rda files exist in the provided path.
#' @keywords internal
#' @examples
#' \dontrun{
#' # Check if any .rda files exist in the current working directory
#' check_rda_files(".")
#' }
check_rda_files <- function(path) {
  files <- list.files(path)
  rda_files_exist <- any(grepl("\\.rda$", files))

  if (!rda_files_exist) {
    stop("No .rda files were found in the provided path.")
  }

  invisible(NULL)
}

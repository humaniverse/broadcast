#' Broadcast .rda Files from One Directory to .csv Files in Another
#'
#' This function moves .rda files from one directory (the `from` directory) to
#' .csv files in another directory (the `to` directory). It checks if .rda files
#' exist in the `from` directory, and creates the `to` directory if it does not
#' exist. A progress bar is displayed during the operation.
#'
#' @param from A string. The path to the directory from which .rda files are
#'  from. Defaults to "data".
#' @param to A string. The path to the directory to which .rda files are to be
#'  moved. Defaults to "inst/extdata".
#'
#' @return Invisible. The function doesn't return any value, but it performs the
#'  moving of .rda files and displays a progress bar.
#'
#' @examples
#' \dontrun{
#' # Broadcast .rda files from the "data" directory to the "inst/extdata"
#' # directory
#' broadcast(from = "data", to = "inst/extdata")
#' }
#'
#' @export
broadcast <- function(from = "data", to = "inst/extdata") {
  check_path(from)
  check_rda_files(from)

  if (!dir.exists(to)) {
    dir.create(to, recursive = TRUE)
  }

  data_files <- list.files(path = from, pattern = "\\.rda$")

  # Create a progress bar
  pb <- txtProgressBar(min = 0, max = length(data_files), style = 3)

  # Use lapply function
  lapply(seq_along(data_files), function(i) {
    data_file <- data_files[i]
    data_name <- tools::file_path_sans_ext(data_file)
    load(file = paste0(from, "/", data_file), envir = .GlobalEnv)
    save_broadcast(data_name, to)

    # Update the progress bar
    setTxtProgressBar(pb, i)
  })

  # Close the progress bar
  close(pb)
}

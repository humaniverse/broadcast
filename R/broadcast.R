#' Broadcast .rda Files from One Directory to .csv Files in Another
#'
#' This function moves .rda files from one directory (the `from` directory) to
#' .csv files in another directory called `.broadcast`. It checks if .rda files
#' exist in the `from` directory, and creates the `to` directory if it does not
#' exist. A progress bar is displayed during the operation.
#'
#' @param from A string. The path to the directory from which .rda files are
#'  from. Defaults to "data".
#'
#' @return Invisible. The function doesn't return any value, but it performs the
#'  moving of .rda files and displays a progress bar.
#'
#' @examples
#' \dontrun{
#' # Broadcast .rda files from the "data" directory to the ".broadcast"
#' # directory
#' broadcast(from = "data")
#' }
#'
#' @export
broadcast <- function(from = "data") {
  check_path(from)
  check_rda_files(from)
  check_folder(".broadcast")
  check_rbuildignore()

  all_files <- list.files(path = from, pattern = "\\.rda$")
  ignore_files <- read_broadcastignore(path = from)
  data_files <- setdiff(all_files, ignore_files)

  progress_bar <- utils::txtProgressBar(
    min = 0,
    max = length(data_files),
    style = 3
  )

  lapply(seq_along(data_files), function(i) {
    data_file <- data_files[i]
    data_name <- tools::file_path_sans_ext(data_file)
    load(file = paste0(from, "/", data_file), envir = .GlobalEnv)
    save_broadcast(data_name, ".broadcast")

    utils::setTxtProgressBar(progress_bar, i)
  })

  close(progress_bar)
}

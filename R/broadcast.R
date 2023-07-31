# function to save datasets to .csv
save_dataset <- function(dataset_name, path) {
  data <- get(dataset_name)
  write.csv(data, file = paste0(path, "/", dataset_name, ".csv"), row.names = FALSE)
}

# specify the directories
data_dir <- system.file("data", package = "your_package_name") # replace with your package name
output_dir <- system.file("inst/ext-data", package = "your_package_name") # replace with your package name

# create the output directory if it does not exist
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# get the list of .rda files in the data directory
data_files <- list.files(path = data_dir, pattern = "\\.rda$")

# load and save each dataset
for (data_file in data_files) {
  data_name <- tools::file_path_sans_ext(data_file)
  load(file = paste0(data_dir, "/", data_file), envir = .GlobalEnv)
  save_dataset(data_name, output_dir)
}
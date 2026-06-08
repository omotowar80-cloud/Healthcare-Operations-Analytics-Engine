# Healthcare Operations Analytics Engine: Dependency Installation Script
# Run this script to automatically configure your environment.

required_packages <- c("DBI", "RSQLite", "tidyverse", "knitr")

install_if_missing <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    message(paste("Installing package:", pkg))
    install.packages(pkg, dependencies = TRUE)
  } else {
    message(paste("Package already installed:", pkg))
  }
}

# Execute installation verification
invisible(lapply(required_packages, install_if_missing))

message("All dependencies successfully validated and installed!")

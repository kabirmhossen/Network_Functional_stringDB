required_packages <- c("STRINGdb", "dplyr", "readr", "ggplot2", "stringr")
required_packages <- c("readr", "limma", "umap", "ggplot2", "Rtsne", "ape", "mice", "tidyverse", "dplyr", "BiocManager")
# Get versions (installed packages only)
package_versions <- sapply(required_packages, function(pkg) {
  if (requireNamespace(pkg, quietly = TRUE)) {
    as.character(packageVersion(pkg))
  } else {
    "Not installed"
  }
})

# Display results
data.frame(
  Package = names(package_versions),
  Version = unname(package_versions)
)

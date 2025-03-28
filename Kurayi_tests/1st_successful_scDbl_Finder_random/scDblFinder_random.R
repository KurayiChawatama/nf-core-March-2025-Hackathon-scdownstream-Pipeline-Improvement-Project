#!/usr/bin/env Rscript

# Set a global RNG seed for reproducibility
set.seed(123)

# Load libraries
library(optparse) # used for command line arguments
library(scDblFinder)
library(tidyverse)
library(SingleCellExperiment)
library(BiocParallel)

# Define arguments
option_list <- list(
  make_option("--rds", type="character", help="Input RDS file"),
  make_option("--prefix", type="character", help="Output prefix"),
  make_option("--cpus", type="integer", help="Number of CPUs to use")
)
# Parse arguments
opt <- parse_args(OptionParser(option_list=option_list))

# Read the SCE object from the RDS file
sce <- readRDS(opt$rds)

# Set the param to a specified RNG seed for reproducibility
bp <- MulticoreParam(workers = opt$cpus, RNGseed = 123)

# 10 Genomics Doublet Rate calculator used to get multiplet rate if not provided
# 10X multiplet rate table(https://rpubs.com/kenneditodd/doublet_finder_example)
multiplet_rates_10x <- data.frame(
  "Multiplet_rate" = c(0.004, 0.008, 0.0160, 0.023, 0.031,
                        0.039, 0.046, 0.054, 0.061, 0.069, 0.076),
  "Loaded_cells" = c(800, 1600, 3200, 4800, 6400, 8000, 9600,
                     11200, 12800, 14400, 16000),
  "Recovered_cells" = c(500, 1000, 2000, 3000, 4000, 5000, 6000,
                        7000, 8000, 9000, 10000)
)

# Adjust to use the number of cells in the SCE object
multiplet_rate <- multiplet_rates_10x %>%
  dplyr::filter(Recovered_cells < ncol(sce)) %>%
  dplyr::slice(which.max(Recovered_cells)) %>%
  dplyr::pull(Multiplet_rate) %>%
  as.numeric()

print(paste("Setting multiplet rate to", multiplet_rate))

# Create a dummy dataset of doublets
sce <- mockDoubletSCE(dbl.rate=multiplet_rate, ngenes=500)

# Run scDblFinder
sce <- scDblFinder(assay(sce, "counts"),
                   BPPARAM = bp,
                   dbr = multiplet_rate,
                   artificialDoublets = ncol(sce))

# Generate a summary table
table(sce$scDblFinder.class)

# Rename scDblFinder.* columns to random_scDblFinder_* format
scdbl_cols <- grep("^scDblFinder\\.", colnames(colData(sce)), value = TRUE)
new_scdbl_cols <- paste0("random_", gsub("\\.", "_", scdbl_cols))

# Rename columns in colData(sce)
for (i in seq_along(scdbl_cols)) {
  colData(sce)[[new_scdbl_cols[i]]] <- colData(sce)[[scdbl_cols[i]]]
  colData(sce)[[scdbl_cols[i]]] <- NULL  # Remove the original column
}

# Save the SCE object
saveRDS(sce, paste0(opt$prefix, ".rds"))

# Save predictions to CSV
predictions <- colData(sce)[, new_scdbl_cols]
write.csv(predictions, paste0(opt$prefix, ".csv"))

################################################
################################################
## VERSIONS FILE                              ##
################################################
################################################

r.version <- strsplit(version[['version.string']], ' ')[[1]][3]
scDblFinder.version <- as.character(packageVersion('scDblFinder'))

writeLines(
    c(
        '"${task.process}":',
        paste('    R:', r.version),
        paste('    scDblFinder:', scDblFinder.version)
    ),
'versions.yml')

################################################
################################################
################################################
################################################

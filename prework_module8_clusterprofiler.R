# install and load the package  manager
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

# list the required bioconductor packages 
bio.pkgs = c("clusterProfiler", "org.Hs.eg.db", "DOSE", "tidyverse", "enrichplot", "ggupset")

# install
BiocManager::install(bio.pkgs)

# load all at once
invisible(lapply(bio.pkgs, function(x) library(x, character.only=TRUE)))
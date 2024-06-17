install.packages("ActivePathways")

filename <- "Human_GOBP_AllPathways_noPFOCR_no_GO_iea_June_01_2024_symbol"

#read in the gmt file
gmt_file <- file.path(getwd(),"Module2","gprofiler",
                      "data",
                      paste(filename,".gmt",sep=""))

genesets <- ActivePathways::read.GMT(gmt_file)

geneset_lengths <- lapply(genesets,FUN = function(x){length(x$genes)})

#restrict the genesets to length of 250
genesets_length250 <- genesets[which(geneset_lengths <= 250)]

output_gmt_file <- file.path(getwd(),"Module2","gprofiler",
                      "data",
                      paste(filename,"_maxgssize250.gmt",sep=""))

ActivePathways::write.GMT(genesets_length250,output_gmt_file)

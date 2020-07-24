#cat permutations_*.txt | gzip -c > permutations_full.txt.gz                    ##run this before loading R
#BiocManager::install("qvalue")


library(qvalue)
d = read.table("permutation_full.txt.gz",header=FALSE)
d = d[!is.na(d$V19),]

d$qval = qvalue(d$V19)$qvalue
write.table(d[which(d$qval <= 0.1), ], "results.genes.significant0.05.txt", quote=FALSE, row.names=FALSE, col.names=FALSE)




# Or run 
#Rscript ./script/runFDR_cis.R permutation_full.txt.gz 0.1 results.genes.0.1
#in terminal

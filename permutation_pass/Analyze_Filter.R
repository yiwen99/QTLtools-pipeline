#cat permutations_*.txt | gzip -c > permutations_full.txt.gz                    ##run this before loading R
#BiocManager::install("qvalue")


library(qvalue)
d = read.table("permutation_full.txt.gz",header=FALSE)
d = d[!is.na(d$V19),]

d$qval = qvalue(d$V19)$qvalue
write.table(d[which(d$qval <= 0.1), ], "results_kallisto_0.10.genes.significant0.05.txt", quote=FALSE, row.names=FALSE, col.names=FALSE)

#BiocManager::install("qvalue")

--------------------------------------------------------------------------------------------------------------
#do FDR correction only with p.adjust function
#library(qvalue)
d = read.table("permutation_full.txt.gz",header=FALSE)
head(d)
d = d[!is.na(d$V19),]
pdf("kallisto_permutation_raw_pval.pdf")
#p-value histogram for permutation pass kallisto
hist(d$V19,breaks=100,xlab="raw p-values",main="raw p-values(Permutation Pass for kallisto)")

#d$qval = qvalue(d$V19)$qvalue
d$V19 = p.adjust(d$V19,method="BH")

write.table(d[which(d$V19 <= 0.1), ], "results_kallisto_0.1_padjust.genes.significant0.1.txt", quote=FALSE, row.names=FALSE, col.names=FALSE)

#write.table(d[which(d$qval <= 0.1), ], "results_kallisto_0.10.genes.significant0.05.txt", quote=FALSE, row.names=FALSE, col.names=FALSE)

#p-value histogram for permutation pass featureCounts
f = read.table("permutations_full_featureCounts.txt.gz",header=FALSE)
f = f[!is.na(f$V19),]
pdf("featureCounts_permutation_raw_pval.pdf")
hist(f$V19,breaks=100,xlab="raw p-values",main="raw p-values(Permutation Pass for featureCounts)")


dev.off()

# Or run 
#Rscript ~/script/runFDR_cis.R permutation_full.txt.gz 0.1 results.genes.0.1
#in terminal

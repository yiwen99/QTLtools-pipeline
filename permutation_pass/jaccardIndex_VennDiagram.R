library("VennDiagram")

#jaccard index for 0.1 significance level
results_k_0.1 <- read.table("results_kallisto_0.10.genes.significant.txt")
results_f_0.1 <-read.table("results_featureCounts_0.10.genes.significant.txt")

k_sig_0.1 <- results_k_0.1$V1
f_sig_0.1 <- results_f_0.1$V1
length(k_sig_0.1)
#compute jaccard index
intersect_0.1<-intersect(k_sig_0.1,f_sig_0.1)
union_0.1<-union(k_sig_0.1,f_sig_0.1)
jaccard0.1 <- length(intersect_0.1)/length(union_0.1) #0.5237316
#VennDiagram
pdf("VennDiagram_sig0.1.pdf")
grid.newpage()
draw.pairwise.venn(area1=length(k_sig_0.1),area2=length(f_sig_0.1),cross.area=length(intersect_0.1), col="black",fill=c("lightBlue","Orange"),category = c("kallisto","featureCounts") )


#jaccard index for 0.05 significance level
results_k_0.05 <- read.table("results_kallisto_0.05.genes.significant.txt")
results_f_0.05 <-read.table("results_featureCounts_0.05.genes.significant.txt")

k_sig_0.05 <- results_k_0.05$V1
f_sig_0.05 <- results_f_0.05$V1
length(k_sig_0.05)
length(f_sig_0.05)
#compute jaccard index
intersect_0.05<-intersect(k_sig_0.05,f_sig_0.05)
union_0.05<-union(k_sig_0.05,f_sig_0.05)
jaccard0.05 <- length(intersect_0.05)/length(union_0.05) #0.5156082
#vennDiagram
pdf("VennDiagram_sig0.05.pdf")
#grid.newpage()
draw.pairwise.venn(area1=length(k_sig_0.05),area2=length(f_sig_0.05),cross.area=length(intersect_0.05), col="black",fill=c("lightBlue","Orange"),category = c("kallisto","featureCounts") )



#jaccard index for 0.01 significance level
results_k_0.01 <- read.table("results_kallisto_0.01.genes.significant.txt")
results_f_0.01 <-read.table("results_featureCounts_0.01.genes.significant.txt")

k_sig_0.01 <- results_k_0.01$V1
f_sig_0.01 <- results_f_0.01$V1
length(k_sig_0.01)
length(f_sig_0.01)
#compute jaccard index
intersect_0.01<-intersect(k_sig_0.01,f_sig_0.01)
union_0.01<-union(k_sig_0.01,f_sig_0.01)
jaccard0.01 <- length(intersect_0.01)/length(union_0.01) #0.5223368
#vennDiagram
grid.newpage()
pdf("VennDiagram_sig0.01.pdf")
draw.pairwise.venn(area1=length(k_sig_0.01),area2=length(f_sig_0.01),cross.area=length(intersect_0.01), col="black",fill=c("lightBlue","Orange"),category = c("kallisto","featureCounts") )


dev.off() #to disconnet the opening pdf


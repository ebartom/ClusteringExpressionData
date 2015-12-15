args <- commandArgs()

geneListFile <-sub('--geneListFile=', '', args[grep('--geneListFile=', args)])
countFile<-sub('--countFile=','',args[grep('--countFile=',args)])

# This Rscript takes a list of interesting genes, and a matrix of gene
# expression values.  It will pull out the set of interesting genes from
# the matrix and make a heatmap from their expression.

# NB: The items in the gene list need to be row names in the count file,
# and each row name needs to be unique.

library(gplots)

##----------load differentially expressed genes --------#
print("Loading gene list")
print(geneListFile)

if(grepl('rda',countFile)){
   allCounts <- get(load(file=countFile))
}
if(grepl('txt',countFile)){
    allCounts <- read.table(file=countFile,header=TRUE,sep="\t",row.names=1)
#    head(allCounts)
}
if (countFile == "genomicMatrix"){
    allCounts <- read.table(file=countFile,header=TRUE,sep="\t",row.names=1)
    if(colnames(allCounts)[1]=="probe"){
        rownames(allCounts) = allCounts$probe
    }
    if(colnames(allCounts)[1]=="sample"){
        rownames(allCounts) = allCounts$sample
    }
}
gl <- read.delim(file=geneListFile,header=FALSE,sep="\t")
gl

dim(gl)
dim(allCounts)

print("Keep all columns of data")
sampleNum <- dim(allCounts)[2]
counts<-allCounts

dim(counts)

row.names(gl)<-gl$V1
print ("Gene list")
head(gl)
gl.counts <-counts[row.names(gl),]
print ("Gene list counts")
head(gl.counts)
dim(gl.counts)
print("removing genes with little to no expression")
dim(gl.counts)
gl.counts <-gl.counts[rowSums(abs(gl.counts))>=2,]
print("removing genes with NAs")
gl.counts<-na.omit(gl.counts)
colnames(gl.counts)<- gsub("\\.\\d+$","",colnames(gl.counts))
dim(gl.counts)

listName <- gsub("\\.geneList.txt$","",geneListFile)
listName <- gsub("\\.txt$","",listName)
pdfFile <- paste(listName,"exp.heatmap.pdf",sep=".")
print(pdfFile)
print(head(rownames(gl.counts)))

listLabel <- gsub("^.*/","",listName)
pdf(pdfFile)
#heatmap.2(as.matrix(gl.counts),trace="none",dendrogram="col",scale="row",Rowv=FALSE,Colv=TRUE,labRow=row.names(gl.counts),cexRow=1,colsep=0,rowsep=0,cexCol=1,margins=c(12,9),main=listLabel,col=colorRampPalette(c("blue","white","red"))(75))
gl.cor<-(cor(t(gl.counts),use="pairwise.complete.obs",method="pearson"))
gl.cor.dist<-as.dist(1-gl.cor)
gl.tree<-hclust(gl.cor.dist,method='average')
heatmap.2(as.matrix(gl.counts),trace="none",dendrogram="row",scale="row",Rowv=as.dendrogram(gl.tree),Colv=NA,labRow=row.names(gl.counts),cexRow=1,colsep=0,rowsep=0,cexCol=1,margins=c(12,9),main=listLabel)
dev.off()
gl.sorted <-gl.counts[rev(gl.tree$order),]
write.table(gl.sorted,paste(listName,"clustered.txt",sep="."),sep="\t")

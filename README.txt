Welcome!

makeHeatmapFromGeneListAndTable.R is an Rscript that can be used to draw a hierarchically clustered heatmap from gene expression data.  It takes as input a list of genes of interest, and a table of expression values.  The genes should be labels for rows in the table.  The script will pull out the table rows that match the gene list, heirarchically cluster them, and output both a heatmap and a clustered expression table.

Rscript makeHeatmapFromGeneListAndTable.R --geneListFile=wholeRoot.up3h.geneList.txt --countFile=BRstudy.normCounts.repMerged.txt

Enjoy.


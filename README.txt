Welcome!

makeHeatmapFromGeneListAndTable.R is an Rscript that can be used to draw a hierarchically clustered heatmap from gene expression data.  It takes as input a list of genes of interest, and a table of expression values.  The genes should be labels for rows in the table.  The script will pull out the table rows that match the gene list, heirarchically cluster them, and output both a heatmap and a clustered expression table.

To run the script, download it and some data files, and try running it like this on a command line terminal:

Rscript makeHeatmapFromGeneListAndTable.R --geneListFile=wholeRoot.up3h.geneList.txt --countFile=BRstudy.normCounts.repMerged.txt

Rscript makeHeatmapFromGeneListAndTable.R --geneListFile=longPattern29.tairOnly.txt --countFile=BRstudy.normCounts.repMerged.txt

Enjoy.

Data files:
BRstudy.normCounts.repMerged.txt -- normalized read counts for the study published in Vragovic et al., PNAS, 2015.
epidermalWT.down3h.geneList.txt -- genes differentially expressed (adjusted p-value < 0.05) and repressed (fold change < 0) in the translatome of the epidermal tissue of the root after 3 hours of brassinosteroid treatment, based on the study published in Vragovic et al., PNAS, 2015.
epidermalWT.up3h.geneList.txt -- genes differentially expressed (adjusted p-value < 0.05) and induced (fold change > 0) in the translatome of the epidermal tissue of the root after 3 hours of brassinosteroid treatment, based on the study published in Vragovic et al., PNAS, 2015.
wholeRootWT.down3h.geneList.txt -- genes differentially expressed (adjusted p-value < 0.05) and repressed (fold change < 0) in the translatome of whole root after 3 hours of brassinosteroid treatment, based on the study published in Vragovic et al., PNAS, 2015.
wholeRootWT.up3h.geneList.txt -- genes differentially expressed (adjusted p-value < 0.05) and induced (fold change > 0) in the translatome of whole root after 3 hours of brassinosteroid treatment, based on the study published in Vragovic et al., PNAS, 2015.
longPattern29.tairOnly.txt -- a list of TAIR ids for genes in longitudinal pattern number 29, identified in the supplemental material of Brady et al., Science, 2007.

Results files from the example commands above:
wholeRoot.up3h.clustered.txt
wholeRoot.up3h.exp.heatmap.pdf
longPattern29.tairOnly.clustered.txt
longPattern29.tairOnly.exp.heatmap.pdf

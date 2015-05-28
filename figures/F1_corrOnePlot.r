# source("http://bioconductor.org/biocLite.R")
# biocLite("Heatplus")

#setEPS()
#postscript("full_corrplot.eps")

#bitmap("full_corrplot.tiff", height = 7, width = 7, units = 'in', type="tifflzw")
#png("full_corrplot.png")

tiff("full_corrplot.tiff")

library(Heatplus)
library(RColorBrewer)

corr.path <- "data/corr"

snm <- read.table(paste(corr.path, "cor_SNMnl_20x30.txt", sep = "/"))
bnm <- read.table(paste(corr.path, "cor_BNMnl_20x30.txt", sep = "/"))

snm <- data.matrix(snm)
bnm <- data.matrix(bnm)
           
snmNames <- c("theta", "rho", "thetaW", "thetaW_sd", "thetaW_q05", "thetaW_q95", "thetaPi", "thetaPi_sd", "thetaPi_q05", "thetaPi_q95", 
           "thetaH", "thetaH_sd", "thetaH_q05", "thetaH_q95", "He", "He_sd", "He_q05", "He_q95", 
           "S", "S_sd", "S_q05", "S_q95", "D", "D_sd", "D_q05", "D_q95", "H", "H_sd", "H_q05", "H_q95", "s1", "s2", "s3")
           
bnmNames <- c("theta", "T", "Nb", "rho", "thetaW", "thetaW_sd", "thetaW_q05", "thetaW_q95", "thetaPi", "thetaPi_sd", "thetaPi_q05", "thetaPi_q95", 
           "thetaH", "thetaH_sd", "thetaH_q05", "thetaH_q95", "He", "He_sd", "He_q05", "He_q95", 
           "S", "S_sd", "S_q05", "S_q95", "D", "D_sd", "D_q05", "D_q95", "H", "H_sd", "H_q05", "H_q95", "s1", "s2", "s3")
 
snmCols <- brewer.pal(11, "RdYlBu")
bnmCols <- brewer.pal(11, "RdYlBu")

colnames(snm) = snmNames
colnames(bnm) = bnmNames

rownames(snm) = snmNames
rownames(bnm) = bnmNames

heatmap_2(bnm, Rowv = NA, Colv = NA, col = bnmCols, scale = "none", 
		breaks = c(-1.1, -.8, -.6, -.4, -.2, -.05, .05, .2, .4, .6, .8, 1.1), legend = 2)

dev.off()

dataSNMl0015 <- read.table("data/out/TPHeDH/out0001_SNMnlst_20x30x01x0015.txt", header = T)
dataSNMs005 <- read.table("data/out/TPHeDH/out0001_SNMnlst_10x15x01x005.txt", header = T)

dataSNMl0015$bayes <- dataSNMl0015$BNM / dataSNMl0015$SNM
dataSNMs005$bayes <- dataSNMs005$BNM / dataSNMs005$SNM

fpl0015.1.5 <- sum(dataSNMl0015$bayes >= 1.5) / length(dataSNMl0015$bayes)
fpl0015.1.0 <- sum(dataSNMl0015$bayes >= 1.0) / length(dataSNMl0015$bayes)

fps005.1.5 <- sum(dataSNMs005$bayes >= 1.5) / length(dataSNMs005$bayes)
fps005.1.0 <- sum(dataSNMs005$bayes >= 1.0) / length(dataSNMs005$bayes)


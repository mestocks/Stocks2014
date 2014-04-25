### Supplementary figure 2 ###

# TPH
pwr4.n10l15t0015 <- read.table("data/out/TPH/out0001_BNMnlst_10x15x01x0015.txt", header = T)
pwr4.n20l30t0015 <- read.table("data/out/TPH/out0001_BNMnlst_20x30x01x0015.txt", header = T)
fls4.n10l15t0015 <- read.table("data/out/TPH/out0001_SNMnlst_10x15x01x0015.txt", header = T)
fls4.n20l30t0015 <- read.table("data/out/TPH/out0001_SNMnlst_20x30x01x0015.txt", header = T)

# SFS5
pwr4.n10l15t0015SFS <- read.table("data/out/sfs5/out0001_BNMnlst_10x15x01x0015.txt", header = T)
pwr4.n20l30t0015SFS <- read.table("data/out/sfs5/out0001_BNMnlst_20x30x01x0015.txt", header = T)
fls4.n10l15t0015SFS <- read.table("data/out/sfs5/out0001_SNMnlst_10x15x01x0015.txt", header = T)
fls4.n20l30t0015SFS <- read.table("data/out/sfs5/out0001_SNMnlst_20x30x01x0015.txt", header = T)

# TPH+DH
pwr4.n10l15t0015DH <- read.table("data/out/TPHeDH/out0001_BNMnlst_10x15x01x0015.txt", header = T)
pwr4.n20l30t0015DH <- read.table("data/out/TPHeDH/out0001_BNMnlst_20x30x01x0015.txt", header = T)
fls4.n20l30t0015DH <- read.table("data/out/TPHeDH/out0001_SNMnlst_20x30x01x0015.txt", header = T)
fls4.n10l15t0015DH <- read.table("data/out/TPHeDH/out0001_SNMnlst_10x15x01x0015.txt", header = T)


#pdf("S2_ssSmallLarge2.pdf", width = 8, height = 10)

par(mfrow = c(3, 2))

backSNM = "steelblue"
frontBNM = "tomato3"

hist(fls4.n10l15t0015$BNM, xlim = c(0, 1), ylim = c(0, 230), 
	main = expression("TPH, n = 10, l = 15"), xlab = "Prob. BNM", col = backSNM, bty = "c")
hist(pwr4.n10l15t0015$BNM, add = TRUE, col = frontBNM)	
legend(0, 200, c("SNM = True", "BNM = True"), fill = c(backSNM, frontBNM), cex = 0.8, bty = "n")

hist(fls4.n20l30t0015$BNM, xlim = c(0, 1), ylim = c(0, 230), 
	main = expression("TPH, n = 20, l = 30"), xlab = "Prob. BNM", col = backSNM)
hist(pwr4.n20l30t0015$BNM, add = TRUE, col = frontBNM)	
legend(0, 200, c("SNM = True", "BNM = True"), fill = c(backSNM, frontBNM), cex = 0.8, bty = "n")


hist(fls4.n10l15t0015SFS$BNM, xlim = c(0, 1), ylim = c(0, 500), 
	main = expression(SFS[5]*", n = 10, l = 15"), xlab = "Prob. BNM", col = backSNM)	
hist(pwr4.n10l15t0015SFS$BNM, add = TRUE, col = frontBNM)
legend(0, 400, c("SNM = True", "BNM = True"), fill = c(backSNM, frontBNM), cex = 0.8, bty = "n")

hist(fls4.n20l30t0015SFS$BNM, xlim = c(0, 1), ylim = c(0, 500), 
	main = expression(SFS[5]*", n = 20, l = 30"), xlab = "Prob. BNM", col = backSNM)	
hist(pwr4.n20l30t0015SFS$BNM, add = TRUE, col = frontBNM)
legend(0, 400, c("SNM = True", "BNM = True"), fill = c(backSNM, frontBNM), cex = 0.8, bty = "n")


hist(fls4.n10l15t0015DH$BNM, xlim = c(0, 1), ylim = c(0, 500), 
	main = expression(TPH+DH*", n = 10, l = 15"), xlab = "Prob. BNM", col = backSNM)	
hist(pwr4.n10l15t0015DH$BNM, add = TRUE, col = frontBNM)
legend(0, 400, c("SNM = True", "BNM = True"), fill = c(backSNM, frontBNM), cex = 0.8, bty = "n")

hist(fls4.n20l30t0015DH$BNM, xlim = c(0, 1), ylim = c(0, 700), 
	main = expression(TPH+DH*", n = 20, l = 30"), xlab = "Prob. BNM", col = backSNM)	
hist(pwr4.n20l30t0015DH$BNM, add = TRUE, col = frontBNM)
legend(0, 400, c("SNM = True", "BNM = True"), fill = c(backSNM, frontBNM), cex = 0.8, bty = "n")


#dev.off()

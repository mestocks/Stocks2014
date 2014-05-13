out.path <- "data/out/TPHeDH"
obs.path <- "data/obs/sfs3"

pwr4.n10l15t0015DH <- read.table(paste(out.path, "out0001_BNMnlst_10x15x01x0015.txt", sep = "/"), header = T)
pwr4.n10l15t005DH <- read.table(paste(out.path, "out0001_BNMnlst_10x15x01x005.txt", sep = "/"), header = T)
pwr4.n20l30t0015DH <- read.table(paste(out.path, "out0001_BNMnlst_20x30x01x0015.txt", sep = "/"), header = T)
pwr4.n20l30t005DH <- read.table(paste(out.path, "out0001_BNMnlst_20x30x01x005.txt", sep = "/"), header = T)

pwr4.n10l15t0015sev02DH <- read.table(paste(out.path, "out0001_BNMnlst_10x15x02x0015.txt", sep = "/"), header = T)
pwr4.n10l15t005sev02DH <- read.table(paste(out.path, "out0001_BNMnlst_10x15x02x005.txt", sep = "/"), header = T)
pwr4.n20l30t0015sev02DH <- read.table(paste(out.path, "out0001_BNMnlst_20x30x02x0015.txt", sep = "/"), header = T)
pwr4.n20l30t005sev02DH <- read.table(paste(out.path, "out0001_BNMnlst_20x30x02x005.txt", sep = "/"), header = T)

pwr4.n10l15t0015sev001DH <- read.table(paste(out.path, "out0001_BNMnlst_10x15x001x0015.txt", sep = "/"), header = T)
pwr4.n10l15t005sev001DH <- read.table(paste(out.path, "out0001_BNMnlst_10x15x001x005.txt", sep = "/"), header = T)
pwr4.n20l30t0015sev001DH <- read.table(paste(out.path, "out0001_BNMnlst_20x30x001x0015.txt", sep = "/"), header = T)
pwr4.n20l30t005sev001DH <- read.table(paste(out.path, "out0001_BNMnlst_20x30x001x005.txt", sep = "/"), header = T)

fls4.n10l15t0015DH <- read.table(paste(out.path, "out0001_SNMnlst_10x15x01x0015.txt", sep = "/"), header = T)
fls4.n10l15t005DH <- read.table(paste(out.path, "out0001_SNMnlst_10x15x01x005.txt", sep = "/"), header = T)
fls4.n20l30t0015DH <- read.table(paste(out.path, "out0001_SNMnlst_20x30x01x0015.txt", sep = "/"), header = T)
fls4.n20l30t005DH <- read.table(paste(out.path, "out0001_SNMnlst_20x30x01x005.txt", sep = "/"), header = T)


obsBNM.n20l30t005sev02SFS3 <- read.table(paste(obs.path, "obs_BNMnlst_20x30x02x005.txt", sep = "/"), header = F)
obsBNM.n20l30t005sev001SFS3 <- read.table(paste(obs.path, "obs_BNMnlst_20x30x001x005.txt", sep = "/"), header = F)
obsBNM.n20l30t005SFS3 <- read.table(paste(obs.path, "obs_BNMnlst_20x30x01x005.txt", sep = "/"), header = F)
obsSNM.n20l30t005SFS3 <- read.table(paste(obs.path, "obs_SNMnlst_20x30x01x005.txt", sep = "/"), header = F)

obsBNM.n10l15t005sev02SFS3 <- read.table(paste(obs.path, "obs_BNMnlst_10x15x02x005.txt", sep = "/"), header = F)
obsBNM.n10l15t005sev001SFS3 <- read.table(paste(obs.path, "obs_BNMnlst_10x15x001x005.txt", sep = "/"), header = F)
obsBNM.n10l15t005SFS3 <- read.table(paste(obs.path, "obs_BNMnlst_10x15x01x005.txt", sep = "/"), header = F)
obsSNM.n10l15t005SFS3 <- read.table(paste(obs.path, "obs_SNMnlst_10x15x01x005.txt", sep = "/"), header = F)

obsBNM.n10l15t0015sev02SFS3 <- read.table(paste(obs.path, "obs_BNMnlst_10x15x02x0015.txt", sep = "/"), header = F)
obsBNM.n10l15t0015sev001SFS3 <- read.table(paste(obs.path, "obs_BNMnlst_10x15x001x0015.txt", sep = "/"), header = F)
obsBNM.n10l15t0015SFS3 <- read.table(paste(obs.path, "obs_BNMnlst_10x15x01x0015.txt", sep = "/"), header = F)
obsSNM.n10l15t0015SFS3 <- read.table(paste(obs.path, "obs_SNMnlst_10x15x01x0015.txt", sep = "/"), header = F)

obsBNM.n20l30t0015sev02SFS3 <- read.table(paste(obs.path, "obs_BNMnlst_20x30x02x0015.txt", sep = "/"), header = F)
obsBNM.n20l30t0015sev001SFS3 <- read.table(paste(obs.path, "obs_BNMnlst_20x30x001x0015.txt", sep = "/"), header = F)
obsBNM.n20l30t0015SFS3 <- read.table(paste(obs.path, "obs_BNMnlst_20x30x01x0015.txt", sep = "/"), header = F)
obsSNM.n20l30t0015SFS3 <- read.table(paste(obs.path, "obs_SNMnlst_20x30x01x0015.txt", sep = "/"), header = F)


#########################
#pdf("F4_sev_TPHDH_D_comp.pdf", width = 8, height = 8)
par(mfrow = c(2, 2))
#########################

pchsym = 15
symsize = 0.8
sev1 <- 0.2
sev2 <- 0.1
sev3 <- 0.01

plot(fls4.n10l15t0015DH$BNM, obsSNM.n10l15t0015SFS3$V21, yaxt = "n",
	pch = pchsym, cex = symsize, col = "grey65", xlab = "Prob. BNM",
	ylab = "Tajima's D", xlim = c(0.15, 1), ylim = c(-1.5, 1.0), 
	main = "Small dataset, low genetic variation")
axis(2, las = 2)
points(pwr4.n10l15t0015sev02DH$BNM, obsBNM.n10l15t0015sev02SFS3$V21, pch = pchsym, col = "orange", cex = symsize)
points(pwr4.n10l15t0015DH$BNM, obsBNM.n10l15t0015SFS3$V21, pch = pchsym, col = "tomato3", cex = symsize)
points(pwr4.n10l15t0015sev001DH$BNM, obsBNM.n10l15t0015sev001SFS3$V21, pch = pchsym, cex = symsize)

legend(.2, -.6, c(expression(N[B]==N), expression(N[B] == 0.2*N), expression(N[B] == 0.1*N), expression(N[B] == 0.01*N)), pch = pchsym, col = c("grey65", "orange", "tomato3", "black"), bty = "n")

plot(fls4.n10l15t005DH$BNM, obsSNM.n10l15t005SFS3$V21, yaxt = "n",
	pch = pchsym, cex = symsize, col = "grey65", xlab = "Prob. BNM",
	ylab = "Tajima's D", xlim = c(0.15, 1), ylim = c(-1.5, 1.0), 
	main = "Small dataset, high genetic variation")
axis(2, las = 2)
points(pwr4.n10l15t005sev02DH$BNM, obsBNM.n10l15t005sev02SFS3$V21, pch = pchsym, col = "orange", cex = symsize)
points(pwr4.n10l15t005DH$BNM, obsBNM.n10l15t005SFS3$V21, pch = pchsym, col = "tomato3", cex = symsize)
points(pwr4.n10l15t005sev001DH$BNM, obsBNM.n10l15t005sev001SFS3$V21, pch = pchsym, cex = symsize)

plot(fls4.n20l30t0015DH$BNM, obsSNM.n20l30t0015SFS3$V21, yaxt = "n",
	pch = pchsym, cex = symsize, col = "grey65", xlab = "Prob. BNM",
	ylab = "Tajima's D", xlim = c(0.15, 1), ylim = c(-1.5, 1.0), 
	main = "Large dataset, low genetic variation")
axis(2, las = 2)
points(pwr4.n20l30t0015sev02DH$BNM, obsBNM.n20l30t0015sev02SFS3$V21, pch = pchsym, col = "orange", cex = symsize)
points(pwr4.n20l30t0015DH$BNM, obsBNM.n20l30t0015SFS3$V21, pch = pchsym, col = "tomato3", cex = symsize)
points(pwr4.n20l30t0015sev001DH$BNM, obsBNM.n20l30t0015sev001SFS3$V21, pch = pchsym, cex = symsize)

plot(fls4.n20l30t005DH$BNM, obsSNM.n20l30t005SFS3$V21, yaxt = "n",
	pch = pchsym, cex = symsize, col = "grey65", xlab = "Prob. BNM",
	ylab = "Tajima's D", xlim = c(0.15, 1), ylim = c(-1.5, 1.0), 
	main = "Large dataset, high genetic variation")
axis(2, las = 2)
points(pwr4.n20l30t005sev02DH$BNM, obsBNM.n20l30t005sev02SFS3$V21, pch = pchsym, col = "orange", cex = symsize)
points(pwr4.n20l30t005DH$BNM, obsBNM.n20l30t005SFS3$V21, pch = pchsym, col = "tomato3", cex = symsize)
points(pwr4.n20l30t005sev001DH$BNM, obsBNM.n20l30t005sev001SFS3$V21, pch = pchsym, cex = symsize)


#dev.off()

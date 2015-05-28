
fls4.n20l30t005TSFS3 <- read.table("./data/out/out0001_SNMnlst_20x30x01x005.txt", header = T)
pwr4.n20l30t005TSFS3 <- read.table("./data/out/out0001_BNMnlst_20x30x01x005.txt", header = T)
pwr4.n20l30t005sev02TSFS3 <- read.table("./data/out/out0001_BNMnlst_20x30x02x005.txt", header = T)
pwr4.n20l30t005sev001TSFS3 <- read.table("./data/out/out0001_BNMnlst_20x30x001x005.txt", header = T)

fls4.n20l30t0015TSFS3 <- read.table("./data/out/out0001_SNMnlst_20x30x01x0015.txt", header = T)
pwr4.n20l30t0015TSFS3 <- read.table("./data/out/out0001_BNMnlst_20x30x01x0015.txt", header = T)
pwr4.n20l30t0015sev02TSFS3 <- read.table("./data/out/out0001_BNMnlst_20x30x02x0015.txt", header = T)
pwr4.n20l30t0015sev001TSFS3 <- read.table("./data/out/out0001_BNMnlst_20x30x001x0015.txt", header = T)


obsBNM.n20l30t005sev02SFS3 <- read.table("./data/obs/obs_BNMnlst_20x30x02x005.txt", header = F)
obsBNM.n20l30t005sev001SFS3 <- read.table("./data/obs/obs_BNMnlst_20x30x001x005.txt", header = F)
obsBNM.n20l30t005SFS3 <- read.table("./data/obs/obs_BNMnlst_20x30x01x005.txt", header = F)
obsSNM.n20l30t005SFS3 <- read.table("./data/obs/obs_SNMnlst_20x30x01x005.txt", header = F)

obsBNM.n20l30t0015sev02SFS3 <- read.table("./data/obs/obs_BNMnlst_20x30x02x0015.txt", header = F)
obsBNM.n20l30t0015sev001SFS3 <- read.table("./data/obs/obs_BNMnlst_20x30x001x0015.txt", header = F)
obsBNM.n20l30t0015SFS3 <- read.table("./data/obs/obs_BNMnlst_20x30x01x0015.txt", header = F)
obsSNM.n20l30t0015SFS3 <- read.table("./data/obs/obs_SNMnlst_20x30x01x0015.txt", header = F)


#########################
#setEPS()
#postscript("F3_sevTSFS32x2.eps")
par(mfrow = c(2, 2))
#########################

pchsym = 15
symsize = 0.8
sev1 <- 0.2
sev2 <- 0.1
sev3 <- 0.01

plot(fls4.n20l30t0015TSFS3$BNM, obsSNM.n20l30t0015SFS3$V29, yaxt = "n",
	pch = pchsym, cex = symsize, col = "grey65", xlab = "Prob. BNM",
	ylab = expression(s[1]*" "*(italic(p)<=0.167)), xlim = c(0.25, 1), ylim = c(0.3, 1), 
	main = "Low genetic variation")
axis(2, las = 2)
points(pwr4.n20l30t0015sev02TSFS3$BNM, obsBNM.n20l30t0015sev02SFS3$V29, pch = pchsym, col = "orange", cex = symsize)
points(pwr4.n20l30t0015TSFS3$BNM, obsBNM.n20l30t0015SFS3$V29, pch = pchsym, col = "tomato3", cex = symsize)
points(pwr4.n20l30t0015sev001TSFS3$BNM, obsBNM.n20l30t0015sev001SFS3$V29, pch = pchsym, cex = symsize)

plot(fls4.n20l30t005TSFS3$BNM, obsSNM.n20l30t005SFS3$V29, yaxt = "n",
	pch = pchsym, cex = symsize, col = "grey65", xlab = "Prob. BNM",
	ylab = expression(s[1]*" "*(italic(p)<=0.167)), xlim = c(0.25, 1), ylim = c(0.3, 1), 
	main = "High genetic variation")
axis(2, las = 2)
points(pwr4.n20l30t005sev02TSFS3$BNM, obsBNM.n20l30t005sev02SFS3$V29, pch = pchsym, col = "orange", cex = symsize)
points(pwr4.n20l30t005TSFS3$BNM, obsBNM.n20l30t005SFS3$V29, pch = pchsym, col = "tomato3", cex = symsize)
points(pwr4.n20l30t005sev001TSFS3$BNM, obsBNM.n20l30t005sev001SFS3$V29, pch = pchsym, cex = symsize)

plot(fls4.n20l30t0015TSFS3$BNM, obsSNM.n20l30t0015SFS3$V1, yaxt = "n",
	pch = pchsym, cex = symsize, col = "grey65", xlab = "Prob. BNM",
	ylab = expression(theta[W]), , xlim = c(0.25, 1), ylim = c(0, .007), 
	main = "Low genetic variation")
axis(2, las = 2, at = c(0, 0.002, 0.004, 0.006), labels = c(expression(0), expression(2^-3), expression(4^-3), expression(6^-3)))
points(pwr4.n20l30t0015sev02TSFS3$BNM, obsBNM.n20l30t0015sev02SFS3$V1, pch = pchsym, col = "orange", cex = symsize)
points(pwr4.n20l30t0015TSFS3$BNM, obsBNM.n20l30t0015SFS3$V1, pch = pchsym, col = "tomato3", cex = symsize)
points(pwr4.n20l30t0015sev001TSFS3$BNM, obsBNM.n20l30t0015sev001SFS3$V1, pch = pchsym, cex = symsize)

legend(.3, .007, c(expression(N[B]==N), expression(N[B] == 0.2*N), expression(N[B] == 0.1*N), expression(N[B] == 0.01*N)), pch = pchsym, col = c("grey65", "orange", "tomato3", "black"), bty = "n")

plot(fls4.n20l30t005TSFS3$BNM, obsSNM.n20l30t005SFS3$V1, yaxt = "n",
	pch = pchsym, cex = symsize, col = "grey65", xlab = "Prob. BNM",
	ylab = expression(theta[W]), , xlim = c(0.25, 1), ylim = c(0, .007), 
	main = "High genetic variation")
axis(2, las = 2, at = c(0, 0.002, 0.004, 0.006), labels = c(expression(0), expression(2^-3), expression(4^-3), expression(6^-3)))
points(pwr4.n20l30t005sev02TSFS3$BNM, obsBNM.n20l30t005sev02SFS3$V1, pch = pchsym, col = "orange", cex = symsize)
points(pwr4.n20l30t005TSFS3$BNM, obsBNM.n20l30t005SFS3$V1, pch = pchsym, col = "tomato3", cex = symsize)
points(pwr4.n20l30t005sev001TSFS3$BNM, obsBNM.n20l30t005sev001SFS3$V1, pch = pchsym, cex = symsize)

#dev.off()

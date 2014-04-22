tmrca <- function(x) {
	y = (x - 1) / (x + 1)
	y
}

plotSevFig <- function() {
	get.bayes <- function(table.name, factor) {
		table.name$Bayes <- table.name$BNM / table.name$SNM
		length(table.name[table.name$Bayes >= factor, ]$Bayes) / length(table.name$Bayes)
	}
	pwr4.n10l15t0015sev05DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_10x15x05x0015.txt", header = T)
	pwr4.n10l15t0015sev03DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_10x15x03x0015.txt", header = T)
	pwr4.n10l15t0015sev02DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_10x15x02x0015.txt", header = T)
	pwr4.n10l15t0015DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_10x15x01x0015.txt", header = T)
	pwr4.n10l15t0015sev001DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_10x15x001x0015.txt", header = T)

	pwr4.n10l15t0015sev05DH$Bayes <- pwr4.n10l15t0015sev05DH$BNM / pwr4.n10l15t0015sev05DH$SNM
	pwr4.n10l15t0015sev03DH$Bayes <- pwr4.n10l15t0015sev03DH$BNM / pwr4.n10l15t0015sev03DH$SNM
	pwr4.n10l15t0015sev02DH$Bayes <- pwr4.n10l15t0015sev02DH$BNM / pwr4.n10l15t0015sev02DH$SNM
	pwr4.n10l15t0015DH$Bayes <- pwr4.n10l15t0015DH$BNM / pwr4.n10l15t0015DH$SNM
	pwr4.n10l15t0015sev001DH$Bayes <- pwr4.n10l15t0015sev001DH$BNM / pwr4.n10l15t0015sev001DH$SNM

	DHsev05st0001P00s01b3 = length(pwr4.n10l15t0015sev05DH[pwr4.n10l15t0015sev05DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n10l15t0015sev05DH$Bayes)
	DHsev03st0001P00s01b3 = length(pwr4.n10l15t0015sev03DH[pwr4.n10l15t0015sev03DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n10l15t0015sev03DH$Bayes)
	DHsev02st0001P00s01b3 = length(pwr4.n10l15t0015sev02DH[pwr4.n10l15t0015sev02DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n10l15t0015sev02DH$Bayes)
	DHst0001P00s01b3 = length(pwr4.n10l15t0015DH[pwr4.n10l15t0015DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n10l15t0015DH$Bayes)
	DHsev001st0001P00s01b3 = length(pwr4.n10l15t0015sev001DH[pwr4.n10l15t0015sev001DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n10l15t0015sev001DH$Bayes)

	n10l15t0015points <- c(DHsev05st0001P00s01b3, DHsev03st0001P00s01b3, DHsev02st0001P00s01b3, DHst0001P00s01b3, DHsev001st0001P00s01b3)

	##############

	pwr4.n10l15t005sev05DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_10x15x05x005.txt", header = T)
	pwr4.n10l15t005sev03DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_10x15x03x005.txt", header = T)
	pwr4.n10l15t005sev02DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_10x15x02x005.txt", header = T)
	pwr4.n10l15t005DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_10x15x01x005.txt", header = T)
	pwr4.n10l15t005sev001DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_10x15x001x005.txt", header = T)

	pwr4.n10l15t005sev05DH$Bayes <- pwr4.n10l15t005sev05DH$BNM / pwr4.n10l15t005sev05DH$SNM
	pwr4.n10l15t005sev03DH$Bayes <- pwr4.n10l15t005sev03DH$BNM / pwr4.n10l15t005sev03DH$SNM
	pwr4.n10l15t005sev02DH$Bayes <- pwr4.n10l15t005sev02DH$BNM / pwr4.n10l15t005sev02DH$SNM
	pwr4.n10l15t005DH$Bayes <- pwr4.n10l15t005DH$BNM / pwr4.n10l15t005DH$SNM
	pwr4.n10l15t005sev001DH$Bayes <- pwr4.n10l15t005sev001DH$BNM / pwr4.n10l15t005sev001DH$SNM

	DHsev05t0001P00s01b3 = length(pwr4.n10l15t005sev05DH[pwr4.n10l15t005sev05DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n10l15t005sev05DH$Bayes)
	DHsev03t0001P00s01b3 = length(pwr4.n10l15t005sev03DH[pwr4.n10l15t005sev03DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n10l15t005sev03DH$Bayes)
	DHsev02t0001P00s01b3 = length(pwr4.n10l15t005sev02DH[pwr4.n10l15t005sev02DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n10l15t005sev02DH$Bayes)
	DHt0001P00s01b3 = length(pwr4.n10l15t005DH[pwr4.n10l15t005DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n10l15t005DH$Bayes)
	DHsev001t0001P00s01b3 = length(pwr4.n10l15t005sev001DH[pwr4.n10l15t005sev001DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n10l15t005sev001DH$Bayes)

	n10l15t005points <- c(DHsev05t0001P00s01b3, DHsev03t0001P00s01b3, DHsev02t0001P00s01b3, DHt0001P00s01b3, DHsev001t0001P00s01b3)

	##############

	pwr4.n20l30t0015sev05DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_20x30x05x0015.txt", header = T)
	pwr4.n20l30t0015sev03DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_20x30x03x0015.txt", header = T)
	pwr4.n20l30t0015sev02DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_20x30x02x0015.txt", header = T)
	pwr4.n20l30t0015DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_20x30x01x0015.txt", header = T)
	pwr4.n20l30t0015sev001DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_20x30x001x0015.txt", header = T)

	pwr4.n20l30t0015sev05DH$Bayes <- pwr4.n20l30t0015sev05DH$BNM / pwr4.n20l30t0015sev05DH$SNM
	pwr4.n20l30t0015sev03DH$Bayes <- pwr4.n20l30t0015sev03DH$BNM / pwr4.n20l30t0015sev03DH$SNM
	pwr4.n20l30t0015sev02DH$Bayes <- pwr4.n20l30t0015sev02DH$BNM / pwr4.n20l30t0015sev02DH$SNM
	pwr4.n20l30t0015DH$Bayes <- pwr4.n20l30t0015DH$BNM / pwr4.n20l30t0015DH$SNM
	pwr4.n20l30t0015sev001DH$Bayes <- pwr4.n20l30t0015sev001DH$BNM / pwr4.n20l30t0015sev001DH$SNM

	DHsev05st0001P11s01b3 = length(pwr4.n20l30t0015sev05DH[pwr4.n20l30t0015sev05DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n20l30t0015sev05DH$Bayes)
	DHsev03st0001P11s01b3 = length(pwr4.n20l30t0015sev03DH[pwr4.n20l30t0015sev03DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n20l30t0015sev03DH$Bayes)
	DHsev02st0001P11s01b3 = length(pwr4.n20l30t0015sev02DH[pwr4.n20l30t0015sev02DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n20l30t0015sev02DH$Bayes)
	DHst0001P11s01b3 = length(pwr4.n20l30t0015DH[pwr4.n20l30t0015DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n20l30t0015DH$Bayes)
	DHsev001st0001P11s01b3 = length(pwr4.n20l30t0015sev001DH[pwr4.n20l30t0015sev001DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n20l30t0015sev001DH$Bayes)

	n20l30t0015points <- c(DHsev05st0001P11s01b3, DHsev03st0001P11s01b3, DHsev02st0001P11s01b3, DHst0001P11s01b3, DHsev001st0001P11s01b3)

	#############

	pwr4.n20l30t005sev05DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_20x30x05x005.txt", header = T)
	pwr4.n20l30t005sev03DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_20x30x03x005.txt", header = T)
	pwr4.n20l30t005sev02DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_20x30x02x005.txt", header = T)
	pwr4.n20l30t005DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_20x30x01x005.txt", header = T)
	pwr4.n20l30t005sev001DH <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_20x30x001x005.txt", header = T)

	pwr4.n20l30t005sev05DH$Bayes <- pwr4.n20l30t005sev05DH$BNM / pwr4.n20l30t005sev05DH$SNM
	pwr4.n20l30t005sev03DH$Bayes <- pwr4.n20l30t005sev03DH$BNM / pwr4.n20l30t005sev03DH$SNM
	pwr4.n20l30t005sev02DH$Bayes <- pwr4.n20l30t005sev02DH$BNM / pwr4.n20l30t005sev02DH$SNM
	pwr4.n20l30t005DH$Bayes <- pwr4.n20l30t005DH$BNM / pwr4.n20l30t005DH$SNM
	pwr4.n20l30t005sev001DH$Bayes <- pwr4.n20l30t005sev001DH$BNM / pwr4.n20l30t005sev001DH$SNM

	DHsev05t0001P11s01b3 = length(pwr4.n20l30t005sev05DH[pwr4.n20l30t005sev05DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n20l30t005sev05DH$Bayes)
	DHsev03t0001P11s01b3 = length(pwr4.n20l30t005sev03DH[pwr4.n20l30t005sev03DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n20l30t005sev03DH$Bayes)
	DHsev02t0001P11s01b3 = length(pwr4.n20l30t005sev02DH[pwr4.n20l30t005sev02DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n20l30t005sev02DH$Bayes)
	DHt0001P11s01b3 = length(pwr4.n20l30t005DH[pwr4.n20l30t005DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n20l30t005DH$Bayes)
	DHsev001t0001P11s01b3 = length(pwr4.n20l30t005sev001DH[pwr4.n20l30t005sev001DH$Bayes >= 3.0, ]$Bayes) / length(pwr4.n20l30t005sev001DH$Bayes)

	n20l30t005points <- c(DHsev05t0001P11s01b3, DHsev03t0001P11s01b3, DHsev02t0001P11s01b3, DHt0001P11s01b3, DHsev001t0001P11s01b3)

	xpoints <- c(.5, .3, .2, .1, .01)

	plot(xpoints, n20l30t005points, pch = 20, xlim = rev(c(-0.04, 0.52)), ylim = c(0, 1), axes=FALSE, ann=FALSE, 
		col = "royalblue4", cex = 1.3)
	box()
	axis(1, at = c(.5, .4, .3, .2, .1, 0))
	axis(2, las = 1, at = c(0, .2, .4, .6, .8, 1))
	title(xlab = expression("N"[B]), ylab = "Power", main = "")
	#abline(h = 0.95, lty = 2, col = "grey75")

	points(c(.5, .3, .2, .1, .01), n20l30t0015points, cex = 1.2, col = "steelblue1", pch = 20)
	points(c(.5, .3, .2, .1, .01), n10l15t005points, cex = 1.2, col = "tomato3", pch = 20)
	points(c(.5, .3, .2, .1, .01), n10l15t0015points, cex = 1.2, col = "orange", pch = 20)

	f <- function(x, c, d) {0 + 1 * (exp(c * log(x) - d)/(1 + exp(c * log(x) - d)))}
	f2 <- function(x, a, b, c, d) {a + (b * x) + (c * x^2) + (d * x^3)}

	fit.n20l30t005 <- nls(n20l30t005points ~ 0 + 1 * (exp(c * log(xpoints) - d)/(1 + exp(c * log(xpoints) - d))), start = list(c = -3, d = 4))
	fit.n20l30t0015 <- nls(n20l30t0015points ~ 0 + 1 * (exp(c * log(xpoints) - d)/(1 + exp(c * log(xpoints) - d))), start = list(c = -3, d = 4))
	fit.n10l15t005 <- nls(n10l15t005points ~ 0 + 1 * (exp(c * log(xpoints) - d)/(1 + exp(c * log(xpoints) - d))), start = list(c = -3, d = 4))

	fit.n10l15t0015 <- nls(n10l15t0015points ~ a + (b * xpoints) + (c * xpoints^2) + (d * xpoints^3), start = list(a = .5, b = 13, c = .5, d = .5))

	xvalues <- seq(0, .5, .001)

	y.n20l30t005 <- rep(NA, length(xvalues))
	y.n20l30t0015 <- rep(NA, length(xvalues))
	y.n10l15t005 <- rep(NA, length(xvalues))
	y.n10l15t0015 <- rep(NA, length(xvalues))

	for (i in seq(1:length(xvalues))) {
		y.n20l30t005[i] <- f(xvalues[i], coef(fit.n20l30t005)[1], coef(fit.n20l30t005)[2])
		y.n20l30t0015[i] <- f(xvalues[i], coef(fit.n20l30t0015)[1], coef(fit.n20l30t0015)[2])
		y.n10l15t005[i] <- f(xvalues[i], coef(fit.n10l15t005)[1], coef(fit.n10l15t005)[2])
		y.n10l15t0015[i] <- f2(xvalues[i], coef(fit.n10l15t0015)[1], coef(fit.n10l15t0015)[2], coef(fit.n10l15t0015)[3], coef(fit.n10l15t0015)[4])
	}

	lines(xvalues, y.n20l30t005, col = "royalblue4", lty = 3, lwd = 1.5)
	lines(xvalues, y.n20l30t0015, col = "steelblue1", lty = 3, lwd = 1.5)
	lines(xvalues, y.n10l15t005, col = "tomato3", lty = 3, lwd = 1.5)
	lines(xvalues, y.n10l15t0015, col = "orange", lty = 3, lwd = 1.5)

	legend(.535, 1.06, c("n = 20, l = 30, \ntheta = 0.005"), 
				bty = 'n', col = c("royalblue4"), 
				pch = 20, lty = 3, cex = 0.7, lwd = 1.5)
				
	legend(.535, .9, c("n = 20, l = 30, \ntheta = 0.0015"), 
				bty = 'n', col = c("steelblue1"), 
				pch = 20, lty = 3, cex = 0.7, lwd = 1.5)
				
	legend(.17, .3, c("n = 10, l = 15, \ntheta = 0.005"), 
				bty = 'n', col = c("tomato3"), 
				pch = 20, lty = 3, cex = 0.7, lwd = 1.5)
				
	legend(.17, .15, c("n = 10, l = 15, \ntheta = 0.0015"), 
				bty = 'n', col = c("orange"), 
				pch = 20, lty = 3, cex = 0.7, lwd = 1.5)
				
	par(xpd=T) 
	text(1.012 * (par("usr")[1] - par("usr")[2]), par("usr")[4] + 0.14 * (par("usr")[4] - par("usr")[3]), labels = c("A"), cex=1.5) 
	par(xpd=F)
}

plotProduct <- function() {
	neutralCol <- "grey65"
	moreSamples <- "tomato3"
	moreLoci <- "tan1"

	nsam <- c(5, 5, 10, 10, 10, 10, 10, 10, 
			20, 20, 20, 20, 20, 20, 
			30, 30, 40, 40)
			
	nloci <- c(15, 30, 1, 5, 15, 30, 45, 60, 
			1, 5, 15, 30, 45, 60, 
			15, 30, 15, 30)
			
	nsam_nloci_diff <- nsam - nloci

	dotColors <- c(neutralCol, neutralCol, neutralCol, neutralCol, neutralCol, neutralCol, 
				neutralCol, neutralCol, neutralCol, neutralCol, neutralCol, neutralCol, 
				neutralCol, neutralCol, neutralCol, neutralCol, neutralCol, neutralCol)

	positive <- nsam_nloci_diff > 0
	negative <- nsam_nloci_diff < 0

	dotColors[positive] <- moreSamples
	dotColors[negative] <- moreLoci

	pwr.005.x <- nsam * nloci
	pwr.005.y <- c(get.bayes(pwr001.TPHeDH.n5l15s01t0015, 3), get.bayes(pwr001.TPHeDH.n5l30s01t0015, 3), 
				get.bayes(pwr001.TPHeDH.n10l1s01t0015, 3), get.bayes(pwr001.TPHeDH.n10l5s01t0015, 3), 
				get.bayes(pwr001.TPHeDH.n10l15s01t0015, 3), get.bayes(pwr001.TPHeDH.n10l30s01t0015, 3), 
				get.bayes(pwr001.TPHeDH.n10l45s01t0015, 3), get.bayes(pwr001.TPHeDH.n10l60s01t0015, 3), 
				get.bayes(pwr001.TPHeDH.n20l1s01t0015, 3), get.bayes(pwr001.TPHeDH.n20l5s01t0015, 3), 
				get.bayes(pwr001.TPHeDH.n20l15s01t0015, 3), get.bayes(pwr001.TPHeDH.n20l30s01t0015, 3), 
				get.bayes(pwr001.TPHeDH.n20l45s01t0015, 3), get.bayes(pwr001.TPHeDH.n20l60s01t0015, 3), 
				get.bayes(pwr001.TPHeDH.n30l15s01t0015, 3), get.bayes(pwr001.TPHeDH.n30l30s01t0015, 3), 
				get.bayes(pwr001.TPHeDH.n40l15s01t0015, 3), get.bayes(pwr001.TPHeDH.n40l30s01t0015, 3))
				
	plot(pwr.005.x, pwr.005.y, pch = 20, col = dotColors, cex = 1.3, xaxt = 'n', yaxt = "n", 
		xlab = "Number of samples x number of loci", ylab = "")
	axis(1, at = c(0, 300, 600, 900, 1200))
	axis(2, las = 2)
	abline(h = 0.95, lty = 2, col = "grey75")

	legend(600, .5, c("l > n", "n > l", "n = l"), col = c(moreLoci, moreSamples, neutralCol), 
		pch = 20, bty = 'n')
		
	par(xpd=T) 
	text(-0.15 * (par("usr")[2] - par("usr")[1]), par("usr")[4] + 0.14 * (par("usr")[4] - par("usr")[3]), labels = c("B"), cex=1.5) 
	par(xpd=F)
}

plotSampleLoci <- function() {
	get.bayes <- function(table.name, factor) {
		table.name$Bayes <- table.name$BNM / table.name$SNM
		length(table.name[table.name$Bayes >= factor, ]$Bayes) / length(table.name$Bayes)
	}
	pwr001.TPHeDH.n10l1s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_10x1x01x0015.txt", header = T)
	pwr001.TPHeDH.n10l5s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_10x5x01x0015.txt", header = T)
	pwr001.TPHeDH.n10l15s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_10x15x01x0015.txt", header = T)
	pwr001.TPHeDH.n10l30s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_10x30x01x0015.txt", header = T)
	pwr001.TPHeDH.n10l45s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_10x45x01x0015.txt", header = T)
	pwr001.TPHeDH.n10l60s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_10x60x01x0015.txt", header = T)

	pwr001.TPHeDH.n20l1s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_20x1x01x0015.txt", header = T)
	pwr001.TPHeDH.n20l5s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_20x5x01x0015.txt", header = T)
	pwr001.TPHeDH.n20l30s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_20x30x01x0015.txt", header = T)
	pwr001.TPHeDH.n20l45s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_20x45x01x0015.txt", header = T)
	pwr001.TPHeDH.n20l60s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_20x60x01x0015.txt", header = T)


	pwr001.TPHeDH.n5l15s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_5x15x01x0015.txt", header = T)
	pwr001.TPHeDH.n20l15s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_20x15x01x0015.txt", header = T)
	pwr001.TPHeDH.n30l15s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_30x15x01x0015.txt", header = T)
	pwr001.TPHeDH.n40l15s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_40x15x01x0015.txt", header = T)

	pwr001.TPHeDH.n5l30s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_5x30x01x0015.txt", header = T)
	pwr001.TPHeDH.n30l30s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_30x30x01x0015.txt", header = T)
	pwr001.TPHeDH.n40l30s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_40x30x01x0015.txt", header = T)


	#pwr001.TPHeDH.n20l30s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_20x30x01x0015.txt", header = T)

	fls001.TPHeDH.n10l1s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_SNMnlst_10x1x01x0015.txt", header = T)
	fls001.TPHeDH.n10l5s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_SNMnlst_10x5x01x0015.txt", header = T)
	fls001.TPHeDH.n10l15s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_SNMnlst_10x15x01x0015.txt", header = T)
	fls001.TPHeDH.n10l30s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_SNMnlst_10x30x01x0015.txt", header = T)
	fls001.TPHeDH.n10l45s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_SNMnlst_10x45x01x0015.txt", header = T)
	fls001.TPHeDH.n10l60s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_SNMnlst_10x60x01x0015.txt", header = T)

	fls001.TPHeDH.n5l15s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_SNMnlst_5x15x01x0015.txt", header = T)
	fls001.TPHeDH.n20l15s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_SNMnlst_20x15x01x0015.txt", header = T)
	fls001.TPHeDH.n30l15s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_SNMnlst_30x15x01x0015.txt", header = T)
	fls001.TPHeDH.n40l15s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_SNMnlst_40x15x01x0015.txt", header = T)

	#fls001.TPHeDH.n20l30s01t0015 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_SNMnlst_20x30x01x0015.txt", header = T)

	pwr001.TPHeDH.n10l15s01t005 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_10x15x01x005.txt", header = T)
	pwr001.TPHeDH.n20l30s01t005 <- read.table("/Users/mist/Documents/Projects/morrisonicola/sims/stage2/sfs/out/num3/ss_TPHeDH/out0001_BNMnlst_20x30x01x005.txt", header = T)

	pwr.l15x <- c(5, 10, 20, 30, 40)
	pwr.l15x2 <- pwr.l15x^2
	pwr.l15y <- c(get.bayes(pwr001.TPHeDH.n5l15s01t0015, 3), get.bayes(pwr001.TPHeDH.n10l15s01t0015, 3), get.bayes(pwr001.TPHeDH.n20l15s01t0015, 3), get.bayes(pwr001.TPHeDH.n30l15s01t0015, 3), get.bayes(pwr001.TPHeDH.n40l15s01t0015, 3))

	pwr.l30x <- c(5, 10, 20, 30, 40)
	pwr.l30y <- c(get.bayes(pwr001.TPHeDH.n5l30s01t0015, 3), get.bayes(pwr001.TPHeDH.n10l30s01t0015, 3), get.bayes(pwr001.TPHeDH.n20l30s01t0015, 3), get.bayes(pwr001.TPHeDH.n30l30s01t0015, 3), get.bayes(pwr001.TPHeDH.n40l30s01t0015, 3))

	#fls.l15x <- c(5, 10, 20, 30, 40)
	#fls.l15x2 <- fls.l15x^2
	#fls.l15y <- c(get.bayes(fls001.TPHeDH.n5l15s01t0015, 3), get.bayes(fls001.TPHeDH.n10l15s01t0015, 3), get.bayes(fls001.TPHeDH.n20l15s01t0015, 3), get.bayes(fls001.TPHeDH.n30l15s01t0015, 3), get.bayes(fls001.TPHeDH.n40l15s01t0015, 3))


	plot(pwr.l15x, pwr.l15y, xaxt = "n", yaxt = "n", lwd = 2, type = "b", lty = 3, col = "steelblue1", pch = 20, ylab = "Power", xlab = "Number of samples", cex = 1, xlim = c(0, 40), ylim = c(0, 1), main = "")
	axis(2, las = 2)#, at = c(0, 0.25, 0.5, 0.75, 1))
	axis(1, at = c(0, 10, 20, 30, 40))
	abline(h = 0.95, lty = 2, col = "grey75")

	points(pwr.l30x, pwr.l30y, pch = 20, type = "b", lwd = 2, lty = 3, cex = 1.1, col = "steelblue")

	legend(25, 0.5, c("l = 30", "l = 15"), col = c("steelblue", "steelblue1"), pch = 20, bty = "n")

	#mtext("test upper left", side = 3, outer = T, adj = 0, line = -2)

	par(xpd=T) 
	text(-0.15 * (par("usr")[2] - par("usr")[1]), par("usr")[4] + 0.14 * (par("usr")[4] - par("usr")[3]), labels = c("C"), cex=1.5) 
	par(xpd=F) 

	#points(fls.l15x, fls.l15y, cex = 0.8)

	lmFit <- lm(pwr.l15y ~ pwr.l15x)
	#abline(lmFit, lty = 3, col = "grey64")

	pwr.quad <- lm(pwr.l15y ~ pwr.l15x + pwr.l15x2)
	pwr.xv <- seq(0, 50, 0.1)
	pwr.yv <- predict(pwr.quad, list(pwr.l15x = pwr.xv, pwr.l15x2 = pwr.xv^2))

	#lines(pwr.xv, pwr.yv, lty = 3, col = "grey64")


	pwr.n10x <- c(1, 5, 15, 30, 45, 60)
	pwr.n10x2 <- pwr.n10x^2
	pwr.n10x3 <- pwr.n10x^3
	pwr.n10y <- c(get.bayes(pwr001.TPHeDH.n10l1s01t0015, 3), get.bayes(pwr001.TPHeDH.n10l5s01t0015, 3), get.bayes(pwr001.TPHeDH.n10l15s01t0015, 3), get.bayes(pwr001.TPHeDH.n10l30s01t0015, 3), get.bayes(pwr001.TPHeDH.n10l45s01t0015, 3), get.bayes(pwr001.TPHeDH.n10l60s01t0015, 3))

	pwr.n20x <- c(1, 5, 15, 30, 45, 60)
	pwr.n20y <- c(get.bayes(pwr001.TPHeDH.n20l1s01t0015, 3), get.bayes(pwr001.TPHeDH.n20l5s01t0015, 3), get.bayes(pwr001.TPHeDH.n20l15s01t0015, 3), get.bayes(pwr001.TPHeDH.n20l30s01t0015, 3), get.bayes(pwr001.TPHeDH.n20l45s01t0015, 3), get.bayes(pwr001.TPHeDH.n20l60s01t0015, 3))

	#fls.n10x <- c(1, 5, 15, 30, 45, 60)
	#fls.n10y <- c(get.bayes(fls001.TPHeDH.n10l1s01t0015, 3), get.bayes(fls001.TPHeDH.n10l5s01t0015, 3), get.bayes(fls001.TPHeDH.n10l15s01t0015, 3), get.bayes(fls001.TPHeDH.n10l30s01t0015, 3), get.bayes(fls001.TPHeDH.n10l45s01t0015, 3), get.bayes(fls001.TPHeDH.n10l60s01t0015, 3))

	plot(pwr.n10x, pwr.n10y, xaxt = 'n', yaxt = "n", pch = 20, lwd = 2, type = "b", lty = 3, col = "tan1", ylab = "", xlab = "Number of loci", cex = 1.1, xlim = c(0, 60), ylim = c(0, 1), main = "")
	axis(1, at = c(0, 15, 30, 45, 60))
	axis(2, las = 2)#, at = c(0, 0.25, 0.5, 0.75, 1))
	abline(h = 0.95, lty = 2, col = "grey75")

	points(pwr.n20x, pwr.n20y, pch = 20, lwd = 2, type = "b", lty = 3, cex = 1.1, col = "tomato3")

	legend(35, 0.5, c("n = 20", "n = 10"), col = c("tomato3", "tan1"), pch = 20, bty = "n")

	par(xpd=T) 
	text(-0.15 * (par("usr")[2] - par("usr")[1]), par("usr")[4] + 0.14 * (par("usr")[4] - par("usr")[3]), labels = c("D"), cex=1.5) 
	par(xpd=F) 

	#points(fls.n10x, fls.n10y, cex = 0.8)
}

plotType <- "all4"

if (plotType == "original") {
	pdf("sample_loci.pdf", width = 9, height = 5)
	par(mfrow = c(1, 2))
	plotSampleLoci()
} else if(plotType == "indProduct") {
	pdf("sampleXloci.pdf", width = 11, height = 4)
	par(mfrow = c(1, 3))
	plotSampleLoci()
	plotProduct()
} else if(plotType == "all4") {
	pdf("sample_loci_sev.pdf")
	par(mfrow = c(2, 2))
	plotSevFig()
	plotProduct()
	plotSampleLoci()
}

dev.off()

#pwr.quad2 <- lm(pwr.n10y ~ pwr.n10x + pwr.n10x2 + pwr.n10x3)
#pwr.xv2 <- seq(0, 60, 0.1)
#pwr.yv2 <- predict(pwr.quad2, list(pwr.n10x = pwr.xv2, pwr.n10x2 = pwr.xv2^2, pwr.n10x3 = pwr.xv2^3))
#lines(xv2, yv2, lty = 3, col = "grey64")



#tx <- c(1, 5, 15, 30, 45, 60)
#tx2 <- tmrca(tx)

#tModel <- lm(n10y ~ tx2)
#xv <- seq(0, 60, 0.1)
#xvT <- predict(tModel, list(tx2 = tmrca(xv)))
#lines(xv, xvT, lty = 3, col = "grey64")
#txv <- seq(0, 50, 0.1)
#tyv <- predict(tmrca, list(n10x = txv))
#lines(txv, tyv)

#x1 <- seq(0, 60, 0.1)
#y1 <- tmrca(x1)
#lines(x1, y1)
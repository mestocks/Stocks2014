#pdf("F2_PCAsumstats1234.pdf", width = 13, height = 7)
#setEPS()
#postscript("F2_PCAsumstats1234.eps", width = 13, height = 7)

type <- 'bnm1234'

if (type == 'all') {
	data <- read.table("PCAsumstats2_bnm.txt", header = F)
	contr <- read.table("PCAcontributions.txt", header = F)

	meanCol = rgb(0, 0, 255, 150, maxColorValue = 255)
	q95Col = rgb(255, 0, 0, 150, maxColorValue = 255)
	q05Col = rgb(255, 0, 0, 150, maxColorValue = 255)
	sdCol = rgb(255, 0, 0, 150, maxColorValue = 255)

	colors = c(meanCol, sdCol, q05Col, q95Col, 
			meanCol, sdCol, q05Col, q95Col, 
			meanCol, sdCol, q05Col, q95Col, 
			meanCol, sdCol, q05Col, q95Col, 
			meanCol, sdCol, q05Col, q95Col, 
			meanCol, sdCol, q05Col, q95Col, 
			meanCol, sdCol, q05Col, q95Col, 
			meanCol, meanCol, meanCol)

	plot(data$V2, data$V3, main = "", las = 1,
		xlab = paste("PC1 (", round(contr[1] * 100, digits = 1), "%)", sep = ""), 
		ylab = paste("PC2 (", round(contr[2] * 100, digits = 1), "%)", sep = ""), 
		xlim = c(-.3, .3), ylim = c(-.5, .5), 
		col = colors, pch = 16, cex = 1.2)


	pointNames <- c('thetaW', 'thetaW_sd', 'thetaW_q05', 'thetaW_q95', 
				'thetaPi', 'thetaPi_sd', 'thetaPi_q05', 'thetaPi_q95', 
				'thetaH', 'thetaH_sd', 'thetaH_q05', 'thetaH_q95', 
				'He', 'He_sd', 'He_q05', 'He_q95', 
				'S', 'S_sd', 'S_q05', 'S_q95',
				'D', 'D_sd', 'D_q05', 'D_q95', 
				'H', 'H_sd', 'H_q05', 'H_q95', 
				's1', 's2', 's3')
				
	textcex <- c(.85, .7, .85, .85, 
			.7, .85, .85, .7,
			.85, .85, .85, .85,
			.85, .85, .85, .85,
			.85, .65, .85, .65,
			.85, .85, .85, .85,
			.85, .85, .85, .85, 
			.85, .85, .85)
				
	Xcorrection <- c(-0.032, -0.045, -0.053, -0.05, 
				-0.028, 0.053, 0.05, -0.043, 
				-0.029, 0.03, 0.045, -0.045, 
				0.017, 0.03, 0.039, 0.037, 
				0.001, 0.018, -0.03, 0.03, 
				0.015, 0.03, 0.03, 0.027, 
				0.015, 0.025, 0.03, 0.016, 
				0.015, 0.015, 0.015)
				
	Ycorrection <- c(0.012, -0.017, 0.018, 0, 
				0, -0.01, -0.006, -0.015, 
				-0.02, -0.03, -0.017, -0.036, 
				0.0, 0.02, 0.008, -0.014, 
				0.019, -0.013, 0.045, -0.0086, 
				0.015, 0.015, 0.02, 0.025, 
				0.015, -0.007, 0.02, 0.029, 
				0.015, 0.015, 0.015)
				
	text(data$V2 + Xcorrection, data$V3 + Ycorrection, labels = data$V1, cex = textcex)#, cx = .85)
} else if (type == 'bnm') {
	data <- read.table("PCAsumstats2_bnm.txt", header = F)
	plot(data$V2, data$V3)
} else if (type == 'snm') {
	data <- read.table("PCAsumstats2_snm.txt", header = F)
	
	meanCol = rgb(0, 0, 255, 150, maxColorValue = 255)
	q95Col = rgb(255, 0, 0, 150, maxColorValue = 255)
	q05Col = rgb(255, 0, 0, 150, maxColorValue = 255)
	sdCol = rgb(255, 0, 0, 150, maxColorValue = 255)

	colors = c(meanCol, sdCol, q05Col, q95Col, 
			meanCol, sdCol, q05Col, q95Col, 
			meanCol, sdCol, q05Col, q95Col, 
			meanCol, sdCol, q05Col, q95Col, 
			meanCol, sdCol, q05Col, q95Col, 
			meanCol, sdCol, q05Col, q95Col, 
			meanCol, sdCol, q05Col, q95Col, 
			meanCol, meanCol, meanCol)
	plot(data$V2, data$V3, col = colors, pch = 16, cex = 1.2)
	text(data$V2, data$V3, labels = data$V1)#, cex = textcex)#, cx = .85)
} else if (type == 'bnm1234') {
    
    par(mfrow = c(1, 2))
	
    data <- read.table("data/PCAsumstats2_bnm4pcs.txt", header = F)
    contr <- read.table("data/PCcontrBNM.txt", header = F)
    contrPC1 <- round(contr$V1[1] * 100, digits = 2)
    contrPC2 <- round(contr$V1[2] * 100, digits = 2)
    contrPC3 <- round(contr$V1[3] * 100, digits = 2)
    contrPC4 <- round(contr$V1[4] * 100, digits = 2)
    
	#meanCol = rgb(0, 0, 255, 150, maxColorValue = 255)
	#q95Col = rgb(255, 0, 0, 150, maxColorValue = 255)
	#q05Col = rgb(255, 0, 0, 150, maxColorValue = 255)
	#sdCol = rgb(255, 0, 0, 150, maxColorValue = 255)
    meanCol = "steelblue"
    q95Col = "tomato3"
    q05Col = "tomato3"
    sdCol = "tomato3"

	colors = c(meanCol, sdCol, q05Col, q95Col, 
			meanCol, sdCol, q05Col, q95Col, 
			meanCol, sdCol, q05Col, q95Col, 
			meanCol, sdCol, q05Col, q95Col, 
			meanCol, sdCol, q05Col, q95Col, 
			meanCol, sdCol, q05Col, q95Col, 
			meanCol, sdCol, q05Col, q95Col, 
			meanCol, meanCol, meanCol)
			
	pointNames <- c('thetaW', 'thetaW_sd', 'thetaW_q05', 'thetaW_q95', 
				'thetaPi', 'thetaPi_sd', 'thetaPi_q05', 'thetaPi_q95', 
				'thetaH', 'thetaH_sd', 'thetaH_q05', 'thetaH_q95', 
				'He', 'He_sd', 'He_q05', 'He_q95', 
				'S', 'S_sd', 'S_q05', 'S_q95',
				'D', 'D_sd', 'D_q05', 'D_q95', 
				'H', 'H_sd', 'H_q05', 'H_q95', 
				's1', 's2', 's3')
				
    textcex12 <- c(.85, .7, .85, .85, 
			.7, .85, .85, .7,
			.85, .85, .85, .85,
			.85, .85, .85, .85,
			.85, .5, .85, .5,
			.85, .85, .85, .85,
			.85, .85, .85, .85, 
			.85, .85, .85)
				
	Xcorrection12 <- c(-0.06, -0.07, -0.085, -0.085, 
				-0.045, 0.08, 0.09, -0.07, 
				-0.045, 0.07, 0.085, -0.07, 
				0.03, 0.055, 0.06, 0.06, 
				-0.005, 0.018, -0.04, 0.03, 
				0.025, 0.05, 0.03, 0.05, 
				0.025, 0.045, 0.05, 0.05, 
				0.025, 0.025, 0.025)
				
	Ycorrection12 <- c(0.01, -0.017, 0.018, 0, 
				0, -0.01, -0.005, -0.017, 
				-0.02, -0.03, -0.017, -0.036, 
				0.004, 0.02, 0.008, -0.014, 
				0.019, -0.017, 0.045, -0.0086, 
				0.015, 0.015, 0.02, 0.025, 
				0.015, -0.007, 0.02, 0.029, 
				0.015, 0.015, 0.015)

    pointNames <- c('thetaW', 'thetaW_sd', 'thetaW_q05', 'thetaW_q95', 
				'thetaPi', 'thetaPi_sd', 'thetaPi_q05', 'thetaPi_q95', 
				'thetaH', 'thetaH_sd', 'thetaH_q05', 'thetaH_q95', 
				'He', 'He_sd', 'He_q05', 'He_q95', 
				'S', 'S_sd', 'S_q05', 'S_q95',
				'D', 'D_sd', 'D_q05', 'D_q95', 
				'H', 'H_sd', 'H_q05', 'H_q95', 
				's1', 's2', 's3')
    
	textcex34 <- c(.85, .85, .85, .85, 
			.85, .85, .85, .85,
			.85, .85, .85, .85,
			.85, .85, .85, .85,
			.85, .65, .85, .65,
			.85, .85, .85, .85,
			.85, .85, .85, .85, 
			.85, .85, .85)
				
	Xcorrection34 <- c(-0.075, 0.08, 0.085, 0.04, 
				0.015, 0.08, 0.05, -0.02, 
				0.03, 0.075, 0.08, -0.015, 
				0.03, 0.045, 0.015, 0.06, 
				-0.01, 0.025, -0.055, 0.04, 
				0.025, -0.05, 0.06, 0.055, 
				0.02, 0.04, 0.045, 0.015, 
				0.025, -0.02, 0.03)
				
	Ycorrection34 <- c(0.0, -0.015, 0.015, 0.025, 
				0.025, -0.015, 0.025, -0.025, 
				-0.025, 0.015, 0.015, 0.025, 
				0.015, 0.015, 0.025, 0.015, 
				-0.02, 0.017, -0.015, 0.001, 
				0.015, 0.015, 0.015, 0.015, 
				0.015, 0.015, 0.015, 0.025, 
				0.015, 0.025, 0.015)
	
	plot(data$V2, data$V3, col = colors, pch = 16, cex = 1.2, xlim = c(-.45, .45), yaxt = 'n',
        xlab = paste("PC1 (", contrPC1, "%)", sep = ""), ylab = paste("PC2 (", contrPC2, "%)", sep = ""))
    axis(2, las = 2)
	text(data$V2 + Xcorrection12, data$V3 + Ycorrection12, labels = data$V1, cex = textcex12)
    
    plot(data$V4, data$V5, col = colors, pch = 16, cex = 1.2, xlim = c(-.45, .45), yaxt = 'n',
        xlab = paste("PC3 (", contrPC3, "%)", sep = ""), ylab = paste("PC4 (", contrPC4, "%)", sep = ""))
    axis(2, las = 2)
	text(data$V4 + Xcorrection34, data$V5 + Ycorrection34, labels = data$V1, cex = textcex34)
}

#dev.off()

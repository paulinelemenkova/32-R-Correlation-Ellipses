# шаг-1. вчитываем таблицу. делаем датафрейм.
MDF <- read.csv("Morphology.csv", header=TRUE, sep = ",")
MDF <- na.omit(MDF) 
row.has.na <- apply(MDF, 1, function(x){any(is.na(x))}) 
sum(row.has.na) 
head(MDF)

# шаг-3. рисуем эллипсы-коррелограммы
# Libraries
library(ellipse)
library(RColorBrewer)

data=cor(MDF)

# Build a Pannel of 100 colors with Rcolor Brewer
my_colors <- brewer.pal(5, "Spectral")
my_colors=colorRampPalette(my_colors)(100)

# Order the correlation matrix
ord <- order(data[1, ])
data_ord = data[ord, ord]
# вариант-1 эллипсы корреляции
plotcorr(data_ord , col=my_colors[data_ord*50+50] , mar=c(1,1,1,1), 
	outline = TRUE, numbers = FALSE,
	main = "Mariana Trench: Correlation Ellipses", 
	xlab = "Geomorphological, bathymetric and geological factors", 
	ylab = "Geomorphological, bathymetric and geological factors", 
	cex.lab = 0.7)
# вариант-2 цифры корреляции	
plotcorr(data_ord , col=my_colors[data_ord*50+50] , mar=c(1,1,1,1), 
	outline = TRUE, numbers = TRUE,
	main = "Mariana Trench: Numerical Correlation", 
	xlab = "Geomorphological, bathymetric and geological factors", 
	ylab = "Geomorphological, bathymetric and geological factors", 
	cex.lab = 0.7)



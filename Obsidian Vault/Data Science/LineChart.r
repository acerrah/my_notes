####################################################
##    R ile Gorsellestirme Teknikleri - 2016      ##
##      MSGSU - Istatistik Bolumu                 ##
##  E. Ozge Ozdamar - ozge.ozdamar@msgsu.edu.tr   ##
####################################################
##                                                ##
##               LINE CHART                       ##
##                                                ##
####################################################

#                  references
#---------------------------------------------------
# http://www.datavizcatalogue.com/methods/line_graph.html

# plot(x, y, type = "l", lty = 1)
# lines(x, y, type = "l", lty = 1)

# x, y: coordinate vectors of points to join
# type = p:points, l:lines,b:both points and lines,c:empty points joined by lines, h: histogram like
# o: overplotted points and lines,s and S : stair steps,n: does not produce any points or lines
# lty: line types.0=blank, 1=solid (default), 2=dashed, 3=dotted, 4=dotdash, 5=longdash, 6=twodash)
# or “blank”, “solid”, “dashed”, “dotted”, “dotdash”, “longdash”, “twodash” 

#                  functions
#---------------------------------------------------
# stats::ts.plot

#                  data
#---------------------------------------------------
# d1
x <-c(1:5)
y1<-c(5,3,4,5,5)
y2<-c(4,5,4,3,1)

#                  charts
#---------------------------------------------------

# Create a basic stair steps plot 
plot(x, y1, type = "S")
# Show both points and line
plot(x, y1, type = "b", pch = 19, col = "red", xlab = "x", ylab = "y")

# (2) Plots with multiple lines
plot(x, y1, type = "b", frame = FALSE, pch = 19, col = "red", xlab = "x", ylab = "y") # Create a first line
lines(x, y2, pch = 18, col = "blue", type = "b", lty = 2) # Add a second line 
legend("topleft", legend=c("Line 1", "Line 2"), col=c("red", "blue"), lty = 1:2, cex=0.8) # Add a legend to the plot
	   
# (3) all types example	 
par(pch=22, col="red") # plotting symbol and color 
par(mfrow=c(2,4)) # all plots on one page 
opts = c("p","l","o","b","c","s","S","h") 
for(i in 1:length(opts)){ 
  heading = paste("type=",opts[i]) 
  plot(x, y1, type="n", main=heading) 
  lines(x, y1, type=opts[i]) 
}

# (4) 
plot( y1~x , type="b" , bty="l" , xlab="value of x" , ylab="value of y1" , col=rgb(0.2,0.4,0.1,0.7) , lwd=3 , pch=17 , ylim=c(1,5) )
lines(y2 ~x , col=rgb(0.8,0.4,0.1,0.7) , lwd=3 , pch=19 , type="b" )
# Add a legend
legend("bottomleft", legend = c("Group 1", "Group 2"), col = c(rgb(0.2,0.4,0.1,0.7),rgb(0.8,0.4,0.1,0.7)), 
  pch = c(17,19), bty = "n", pt.cex = 2, cex = 1.2, text.col = "black", horiz = F , inset = c(0.1, 0.1))
 
# inset = c(0.1, 0.1) : % (from 0 to 1) to draw the legend away from x and y axis
# You can also give the X and Y coordinate of the legend: legend(3, 5, legend = c(“A”, “B”))


# complex example
data(Orange)
Orange$Tree <- as.numeric(Orange$Tree) 
ntrees <- max(Orange$Tree)
# get the range for the x and y axis 
xrange <- range(Orange$age) 
yrange <- range(Orange$circumference) 
# set up the plot 
plot(xrange, yrange, type="n", xlab="Age (days)", ylab="Circumference (mm)" ) 
colors <- rainbow(ntrees) 
linetype <- c(1:ntrees) 
plotchar <- seq(18,18+ntrees,1)

# add lines 
for (i in 1:ntrees) { 
  tree <- subset(Orange, Tree==i) 
  lines(tree$age, tree$circumference, type="b", lwd=1.5,
    lty=linetype[i], col=colors[i], pch=plotchar[i]) 
} 

# add a title and subtitle 
title("Tree Growth", "example of line plot")

# add a legend 
legend(xrange[1], yrange[2], 1:ntrees, cex=0.8, col=colors, pch=plotchar, lty=linetype, title="Tree")

# plotly example
library(plotly)
library(magrittr)
t1 <- rnorm(100, mean = 5)
t2 <- rnorm(100, mean = 0)
t3 <- rnorm(100, mean = -5)
x <- c(1:100)

data <- data.frame(x, t1, t2, t3)

plot_ly(data, x = ~x, y = ~t1, name = "t1", type = "scatter", mode = "lines") %>%
  add_trace(y = ~t2, name = "t2", mode = "lines+markers") %>%
  add_trace(y = ~t3, name = "t3", mode = "markers")
  


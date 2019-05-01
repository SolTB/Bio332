#### Calculations and Figures for Bio 332 IP
# Create the data for the chart.
v <- c(-101.3, -102.4, -103.4, -89.2, -95.3, -93.1, -91.4, -93.4, -90.2, -96.5, -94.2, -93.7, -83.8, -82.9, -98.2, -98, -100, -98.8,-95.8,
       -98.7, -96.7, -89.6, -89.6, -87.3, -72.7, -37.3, -77.1)

t <- c(-50.78, -51.02, -51.36, -43.22, -48.28, -50.38, -52.02, -48.54, -46.46, -52.82, -51.18, -49.52, -54.94, -49.82,
       -48.12, -47.7, -53.16, -52.62, -52.62, -53.96, -53.96, -44.36, -44.14, -42.2, -33.76, -38.36, -45.36)

q <- c(-49.0, -49.38, -49.78, -37.0, - 40.65, -44.4, -47.03, -41.03, -37.71, -45.96, -45.04, -42.04, -48.3, -44.2, -41.49, 
       -41.7, -46.35, -46.82, -42.99, -46.42, -46.41, -37.35, -37.55, -34.51, -28.11, -28.24, -37.82)
t.test(v, t)
t.test(q,t)
t.test(q,v)

temp <- c(42.2, 37.8, 16.7, 28.9, 26.1, 26.1, 35.0, 25.0, 30.0, 29.4, 29.4, 22.2, 28.9, 31.7, 25.6, 25.6, 21.7, 27.8, 22.8, 23.9, 21.7, 
          30.0, 30.0, 26.7, 26.1, 30.6, 26.1)
# IN BASE GRAPHICS
plot(temp, q, 
     main="Quikfold Free Energy Vs. RNAStructure Free Energy", 
     xlab="Quikfold Free Energy",ylab="RNAStructure Free Energy)",
     pch=16)

cor(t, v) #0.3523023
cor(q, v) #0.3523023

sd(v) #74.74579
mean(v) #171.4

sd(temp) #51.32955
mean(temp) #132.5

# CREATE LINEAR MODEL
mod<-lm(v~q)
summary(mod)
mod$coefficients

library(tidyverse)
ex6df<-data.frame(q, v)

# CREATE SCATTER PLOT WITH FITTED LINE
ggplot(data=ex6df, aes(x=q, y=v))+
  geom_point()+
  ggtitle("Quikfold Free Energy Vs. ITS2 Free Energy")+
  xlab("Quikfold Free Energy(J/mol)")+
  ylab("ITS2 Free Energy(J/mol)")+
  theme_bw()+
  geom_abline(slope=mod$coefficients[2], intercept=mod$coefficients[1],
              color="blue", lty=2, lwd=1)


# Give the chart file a name.
png(file = "ComparisonFreeEnergy.jpg")

# Plot the bar chart.
plot(v,type = "o",col = "red", xlab = "Taxa", ylab = "Free Energy (kJ/mol)", 
     main = "Free Energies of Secondary Structures")

lines(t, type = "o", col = "blue")
lines(q, type = "o", col = "purple")

# Save the file.
dev.off()

######
png(file = "histogram2.png")

# Create the histogram.
hist(t,xlab = "Free Energies",col = "green",border = "green")

# Save the file.
dev.off()

## BOOTSTRAPPING
nsim=1000

bootDiff<-c()
for(i in 1:nsim){
  bootRed<-sample(v, length(v), replace=T)
  bootYellow<-sample(t, length(t), replace=T)
  thisDiff<-mean(bootRed)-mean(bootYellow)
  
  bootDiff<-c(bootDiff, thisDiff)
}
png(file = "histogramBoot.png")
hist(bootDiff)
# Save the file.
dev.off()


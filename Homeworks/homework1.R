#
usair.dat<-source(paste(getwd(), "/Data/chap3usair.dat", sep = ""))$value
#
#
#
#
var(usair.dat)
cor(usair.dat)
#
#
dis<-dist(usair.dat)
dis.matrix<-dist2full(dis)
round(dis.matrix,digits=2)
#
usair.dat <- data.matrix(usair.dat)
std<-sd(usair.dat)
# Error: (list) object cannot be coerced to type 'double'
# Solutions:
std<-sd(data.matrix(usair.dat)) # Doesn't work
std=c(sd(usair.dat[,1]), sd(usair.dat[,2]), sd(usair.dat[,3]), sd(usair.dat[,4]), sd(usair.dat[,5]), sd(usair.dat[,6]), sd(usair.dat[,7]))
#
#
# sweep usage: sweep(x, MARGIN, STATS, FUN = "-", check.margin = TRUE, …)
# Divide columns of data matrix by the appropriate standard deviation to normalize the data
usair.dat.std<-sweep(usair.dat,2,std,FUN="/")
dis<-dist(usair.dat.std)
dis.matrix<-dist2full(dis)
round(dis.matrix,digits=2)
#
#load MASS library
library(MASS)
#set seed for random number generation to get the same plots
set.seed(1203)
X<-mvrnorm(200,mu=c(0,0),Sigma=matrix(c(1,0.5,0.5,1.0),ncol=2))
#
#
par(mfrow=c(1,2))
qqnorm(X[,1],ylab="Ordered observations")
qqline(X[,1])
qqnorm(X[,2],ylab="Ordered observations")
qqline(X[,2])
#
#
par(mfrow=c(1,1))
chisplot(X)
#
par(mfrow=c(1,2))
qqnorm(log(abs(X[,1])),ylab="Ordered observations")
qqline(log(abs(X[,1])))
qqnorm(log(abs(X[,2])),ylab="Ordered observations")
qqline(log(abs(X[,2])))
#
par(mfrow=c(1,1))
chisplot(log(abs(X)))
#
dist2full<-function(dis) {
  n<-attr(dis,"Size")
  full<-matrix(0,n,n)
  full[lower.tri(full)]<-dis
  full+t(full)
}

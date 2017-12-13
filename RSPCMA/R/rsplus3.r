usair.dat<-source(paste(getwd(), "/Data/chap3usair.dat", sep = ""))$value
#
#
attach(usair.dat)
#
#
cor(usair.dat[,-1])
usair.pc<-princomp(usair.dat[,-1],cor=TRUE)
#
summary(usair.pc,loadings=TRUE)
#
usair.pc$scores[,1:3]
#
par(mfrow=c(1,3))
plot(usair.pc$scores[,1],SO2,xlab="PC1")
plot(usair.pc$scores[,2],SO2,xlab="PC2")
plot(usair.pc$scores[,3],SO2,xlab="PC3")
#
dev.off()
#
par(pty="s")
plot(usair.pc$scores[,1],usair.pc$scores[,2],
ylim=range(usair.pc$scores[,1]),
xlab="PC1",ylab="PC2",type="n",lwd=2)
text(usair.pc$scores[,1],usair.pc$scores[,2],
labels=abbreviate(row.names(usair.dat)),cex=0.7,lwd=2)
#
#
par(pty="s")
plot(usair.pc$scores[,1],usair.pc$scores[,3],
ylim=range(usair.pc$scores[,1]),
xlab="PC1",ylab="PC3",type="n",lwd=2)
text(usair.pc$scores[,1],usair.pc$scores[,3],
labels=abbreviate(row.names(usair.dat)),cex=0.7,lwd=2)
#
#
par(pty="s")
plot(usair.pc$scores[,2],usair.pc$scores[,3],
ylim=range(usair.pc$scores[,2]),
xlab="PC2",ylab="PC3",type="n",lwd=2)
text(usair.pc$scores[,2],usair.pc$scores[,3],
labels=abbreviate(row.names(usair.dat)),cex=0.7,lwd=2)
#
#
#
summary(lm(SO2~usair.pc$scores[,1]+usair.pc$scores[,2]+
usair.pc$scores[,3]))
#
plot(usair.pc$scores[,1],SO2,xlab="PC1",ylab="SO2")
#
load(lqs)
#
usair.mve<-cov.mve(usair.dat[,-1],cor=TRUE)
#
usair.mve$cor
usair.pc1<-princomp(usair.dat[,-1],covlist=usair.mve,cor=TRUE)
summary(usair.pc1,loadings=T)
#
#
#Chapter 8
usair.fit<-lm(SO2~Neg.Temp+Manuf+Pop+Wind+Precip+Days)
summary(usair.fit)


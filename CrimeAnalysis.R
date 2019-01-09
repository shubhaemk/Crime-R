#2
print(getwd())
for(i in 1:lengthState){
  print(getwd())
  for(j in 1:lengthCrime){
    path=paste0("~/Programming/R/Data Set/Crime/Output/",uniqueState[[i]],"/Crime/",uniqueCrime[[j]],"/")
    setwd(path)
    print(getwd())
    fileName=paste0(uniqueCrime[[j]],".csv")
    crimeData=read.csv(fileName,header = TRUE, check.names = FALSE)
    stolenCount=crimeData$`Number Of Cases In Which Property - Stolen`
    recoverCount=crimeData$`Number Of Cases In Which Property - Recovered`
    maxStolen=as.numeric(max(stolenCount))
    ylimit=maxStolen+100
    yearLabel=crimeData$YEAR
    yLabel=paste0("Number of ",uniqueCrime[[j]]," cases")
    fileName=paste0(uniqueCrime[[j]],"Count.png")
    png(file = fileName)
    combineData=cbind(stolenCount,recoverCount)
    colnames(combineData) <- c("Stolen", "Recovered")
    rownames(combineData) <- yearLabel
    barplot(t(combineData),beside=T,cex.names=0.8, las=2,yaxp=c(0,ylimit,5), col=c("darkblue","red"),main=yLabel)
    box(bty="l")
    legend("topleft",c("Stolen","Recovered"),fill = c("darkblue","red"),cex=0.8)
    dev.off()
    setwd("~/Programming/R/Data Set/Crime/Output")
  }
}
print(getwd())
for(i in 1:lengthState){
  print(getwd())
  for(j in 1:lengthCrime){
    path=paste0("~/Programming/R/Data Set/Crime/Output/",uniqueState[[i]],"/Crime/",uniqueCrime[[j]],"/")
    setwd(path)
    print(getwd())
    fileName=paste0(uniqueCrime[[j]],".csv")
    crimeData=read.csv(fileName,header = TRUE, check.names = FALSE)
    stolenValue=crimeData$`Value Of Property (in rupees) - Stolen`
    recoverValue=crimeData$`Value Of Property (in rupees) - Recovered`
    maxStolen=as.numeric(max(stolenValue))
    ylimit=maxStolen+100
    yearLabel=crimeData$YEAR
    yLabel=paste0("Value of ",uniqueCrime[[j]]," cases")
    fileName=paste0(uniqueCrime[[j]],"Value.png")
    png(file = fileName)
    combineData=cbind(stolenValue,recoverValue)
    colnames(combineData) <- c("Stolen", "Recovered")
    rownames(combineData) <- yearLabel
    barplot(t(combineData),beside=T,cex.names=0.8, las=2,yaxp=c(0,ylimit,18), col=c("green","red"),main=yLabel)
    box(bty="l")
    legend("topleft",c("Stolen","Recovered"),fill = c("green","red"),cex=0.8)
    dev.off()
    setwd("~/Programming/R/Data Set/Crime/Output")
  }
}
i=1
j=1
print(getwd())
for(i in 1:lengthState){
  print(getwd())
  for(j in 1:lengthCrime){
    path=paste0("~/Programming/R/Data Set/Crime/Output/",uniqueState[[i]],"/Crime/",uniqueCrime[[j]],"/")
    setwd(path)
    print(getwd())
    fileName=paste0(uniqueCrime[[j]],".csv")
    crimeData=read.csv(fileName,header = TRUE, check.names = FALSE)
    stolenCount=crimeData$`Number Of Cases In Which Property - Stolen`
    recoverCount=crimeData$`Number Of Cases In Which Property - Recovered`
    maxStolen=as.numeric(max(stolenCount))
    ylimit=maxStolen+100
    yearLabel=crimeData$YEAR
    yLabel=paste0("Number of ",uniqueCrime[[j]]," cases")
    fileName=paste0(uniqueCrime[[j]],"Analysis.png")
    png(file = fileName)
    plot(yearLabel,t(stolenCount),pch= 15, col="red", xlab = "Year", ylab=uniqueCrime[[j]], main = "Predective Crime",xlim=c(2001,2018),ylim=c(0,ylimit), axes=FALSE)
    axis(side=1, at=c(2000:2018))
    axis(side=2, at=seq(0, ylimit,3000))
    box()
    lmfit =lm(stolenCount~yearLabel)
    abline(lmfit)
    nyears = c(2013:2018)
    nthecrime = rep(0,length(nyears))
    for (k in seq_along(nyears)) {
      nthecrime[k] = lmfit$coefficients[2] * nyears[k] + lmfit$coefficients[1]
    }
    points(nyears,nthecrime,pch= 17, col="blue")
    dev.off()
    setwd("~/Programming/R/Data Set/Crime/Output")
  }
}
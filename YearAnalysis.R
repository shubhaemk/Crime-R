#3

library("plotrix")
print(getwd())
for(i in 1:lengthState){
  print(getwd())
  for(j in 1:lengthYear){
    path=paste0("~/Programming/R/Data Set/Crime/Output/",uniqueState[[i]],"/Year/",uniqueYear[[j]],"/")
    setwd(path)
    print(getwd())
    fileName=paste0(uniqueYear[[j]],".csv")
    crimeData=read.csv(fileName,header = TRUE, check.names = FALSE)
    stolenCount=crimeData$`Number Of Cases In Which Property - Stolen`
    fileName=paste0(uniqueYear[[j]],"PIE.png")
    png(file = fileName)
    crimeLabel=as.data.frame(crimeData$`Crime Head`)
    bindData=cbind(stolenCount,crimeLabel)
    bindData=bindData[crimeData$`Crime Head`!="TOTAL (MANUAL)",]
    colnames(bindData)=c("Cases","Type")
    bindData=bindData[bindData$Cases!=0,]
    stolenCount=bindData$Cases
    crimeLabel=bindData$Type
    crimePercent=round(100*stolenCount/sum(stolenCount), 1)
    pie3D(stolenCount,labels=crimePercent,main = "Crimes in 2001",radius = 0.9,col = rainbow(length(stolenCount)))
    legend("bottomright",legend=crimeLabel,fill = rainbow(length(stolenCount)),cex=0.4)
    dev.off()
    setwd("~/Programming/R/Data Set/Crime/Output")
  }
}
###################################################################

print(getwd())
 for(i in 1:lengthState){
   print(getwd())
   for(j in 1:lengthYear){
    path=paste0("~/Programming/R/Data Set/Crime/Output/",uniqueState[i],"/Year/",uniqueYear[j],"/")
    setwd(path)
    print(getwd())
    fileName=paste0(uniqueYear[j],".csv")
    crimeData1=read.csv(fileName,header = TRUE, check.names = FALSE)
    stolenCount=crimeData1[,"Number Of Cases In Which Property - Stolen"]
    recoverCount=crimeData1[,"Number Of Cases In Which Property - Recovered"]
    fileName=paste0(uniqueYear[[j]],"CasePercentage.png")
    png(file = fileName)
    crimeLabel=as.data.frame(crimeData1$`Crime Head`)
    bindData=data.frame(crimeLabel,stolenCount,recoverCount)
    bindData=bindData[crimeData1$`Crime Head`!="TOTAL (MANUAL)",]
    colnames(bindData)=c("Type","Stolen","Recover")
    bindData=bindData[bindData$Type!=0,]
    stolenCount=bindData$Stolen
    recoverCount=bindData$Recover
    crimeLabel=bindData$Type
    crimePercent=round(100*recoverCount/stolenCount, 1)
    barplot(crimePercent,beside=T,cex.names=0.8, las=2,yaxp=c(0,100,4), col=c("yellow"),main="Crime Recovery Percentage ( Cases )",names.arg = crimeLabel)
    legend("topright",legend="Recovery ( Percentage )",fill = "yellow",cex=0.4)
    dev.off()
    setwd("~/Programming/R/Data Set/Crime/Output")
   }
 }
print(getwd())
for(i in 1:lengthState){
  print(getwd())
  for(j in 1:lengthYear){
    path=paste0("~/Programming/R/Data Set/Crime/Output/",uniqueState[i],"/Year/",uniqueYear[j],"/")
    setwd(path)
    print(getwd())
    fileName=paste0(uniqueYear[j],".csv")
    crimeData1=read.csv(fileName,header = TRUE, check.names = FALSE)
    stolenValue=crimeData1[,"Value Of Property (in rupees) - Stolen"]
    recoverValue=crimeData1[,"Value Of Property (in rupees) - Recovered"]
    fileName=paste0(uniqueYear[[j]],"ValuePercentage.png")
    png(file = fileName)
    crimeLabel=as.data.frame(crimeData1$`Crime Head`)
    bindData=data.frame(crimeLabel,stolenValue,recoverValue)
    bindData=bindData[crimeData1$`Crime Head`!="TOTAL (MANUAL)",]
    colnames(bindData)=c("Type","Stolen","Recover")
    bindData=bindData[bindData$Type!=0,]
    stolenValue=bindData$Stolen
    recoverValue=bindData$Recover
    crimeLabel=bindData$Type
    crimePercent=round(100*recoverValue/stolenValue, 1)
    barplot(crimePercent,beside=T,cex.names=0.8, las=2,yaxp=c(0,100,4), col=c("green"),main="Crime Recovery Percentage ( Value )",names.arg = crimeLabel)
    legend("topright",legend="Recovery ( Percentage )",fill = "green",cex=0.4)
    dev.off()
    setwd("~/Programming/R/Data Set/Crime/Output")
  }
}


setwd("~/Programming/R/Data Set/Crime")
indiaMap=readRDS("IND_adm1.rds")
colors=character(0)
for(j in 1:lengthYear){
  setwd("~/Programming/R/Data Set/Crime/Output/India Maps")
  setwd(as.character(uniqueYear[[j]]))
  fileName=paste0(uniqueYear[[j]],".csv")
  print(getwd())
  if(uniqueYear[[j]]=="2007")
    next()
  data2001=read.csv(fileName,header = TRUE, check.names = FALSE)
  for(i in seq(length(indiaMap$NAME_1))){
    pattr=indiaMap$NAME_1[i]
    if(pattr=="Telangana"){
      colors=append(colors,"grey",length(colors))
      next
    }
    if(pattr=="Andaman and Nicobar"){
      pattr="A&N Islands"
    }
    if(pattr=="Dadra and Nagar Haveli"){
      pattr="D&N Haveli"
    }
    if(pattr=="Jammu and Kashmir"){
      pattr="Jammu & Kashmir"
    }
    if(pattr=="NCT of Delhi"){
      pattr="Delhi UT"
    }
    if(pattr=="Daman and Diu"){
      pattr="Daman & Diu"
    }
    stateIndices=which(data2001$`STATE/UT`== pattr)
    stateData=data2001[stateIndices,]
    crimeCount=as.numeric(stateData$`Number Of Cases In Which Property - Stolen`)
    
    if(crimeCount < 10000){
      colors=append(colors,"green",length(colors))
      }else if(crimeCount>=10001 && crimeCount <20000){
      colors=append(colors,"yellow",length(colors))
    }else if(crimeCount>=20001 && crimeCount <30000){
      colors=append(colors,"orange",length(colors))
    }else if(crimeCount>=30001 && crimeCount <40000){
      colors=append(colors,"red",length(colors))
    }else if(crimeCount>=40001 && crimeCount <50000){
      colors=append(colors,"brown",length(colors))
    }else if(crimeCount>50001){
      colors=append(colors,"black",length(colors))
    }
  }
  fileName=paste0(uniqueYear[[j]],"MAP.png")
  png(file = fileName)
  plot(indiaMap,
       bg="white",
       axes=TRUE,
       border="grey",
       col=colors,
       main=paste("Crime Count in year ","2001"))
  legend("topright",
         fill=c("Green","Yellow","Orange","Red","Brown","Black","Grey"),
         bty="n",
         cex=.6,
         y.intersp = .6,
         legend=c("Below 10,000","10,000 - 20,000","20,000 - 30,000","30,000 - 40,000","40,000 - 50,000","Above 50,000","Telangana Not in Data"))
  grid()
  box()
  dev.off()
}
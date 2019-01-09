#1

setwd("~/Programming/R/Data Set/Crime")
#Reading data from a csv file
crimeIndia = read.csv("CrimeIndia.csv",header = TRUE, check.names = FALSE)

#Pulling unique states from crimeIndia
uniqueState=unique(crimeIndia$`STATE/UT`,incomparables = FALSE)
#Pulling unique crime from crimeIndia
uniqueCrime=unique(crimeIndia$`Crime Head`,incomparables = FALSE)
#Pulling unique year from crimeIndia
uniqueYear=unique(crimeIndia$YEAR,incomparables = FALSE)

#Determining Length of Number of Crimes
lengthCrime=length(uniqueCrime)
lengthCrime=lengthCrime-1
#Determining Length of Number of States
lengthState=length(uniqueState)
#lengthState=lengthState-1
#Determining Length of Number of Crimes
lengthYear=length(uniqueYear)
lengthYear=lengthYear-1

#Creating an Output directory
if(!file.exists("Output")) {
  dir.create("Output")
}
setwd("~/Programming/R/Data Set/Crime/Output")
print(getwd())
if(!file.exists("India Maps")) {
  dir.create("India Maps")
}

print(getwd())
for ( i in 1:lengthYear){
  setwd("~/Programming/R/Data Set/Crime/Output/India Maps")
  if(!file.exists(as.character(uniqueYear[[i]]))){
    dir.create(as.character(uniqueYear[[i]]))
  }
  print(getwd())
  indices=which(crimeIndia$YEAR == uniqueYear[[i]] & crimeIndia$`Crime Head`=="TOTAL (MANUAL)")
  fileName=paste0(as.character(uniqueYear[[i]]),".csv")
  wd=paste0("~/Programming/R/Data Set/Crime/Output/India Maps/",as.character(uniqueYear[[i]]))
  setwd(wd)
  print(getwd())
  dataSub=crimeIndia[indices,]
  write.csv(dataSub,file = fileName)
  setwd("~/Programming/R/Data Set/Crime/Output")
  print(getwd())
}
#Writing  each data frame in a seperate csv file      [[[[[   CRIME   ]]]]]
for(i in 1:lengthState){
  print(getwd())
  for(j in 1:lengthCrime){
    if(!file.exists(as.character(uniqueState[[i]]))) {
      dir.create(as.character(uniqueState[[i]]))
    }
    print(getwd())
    indices=which(crimeIndia$`STATE/UT`==uniqueState[[i]] & crimeIndia$`Crime Head`==uniqueCrime[[j]])
    fileName=paste0(as.character(uniqueCrime[[j]]),".csv")
    wd=paste0("~/Programming/R/Data Set/Crime/Output/",as.character(uniqueState[[i]]))
    setwd(wd)
    if(!file.exists("Crime")) {
      dir.create("Crime")
    }
    setwd("Crime")
    print(getwd())
    if(!file.exists(as.character(uniqueCrime[[j]]))) {
      dir.create(as.character(uniqueCrime[[j]]))
    }
    print(getwd())
    wd=paste0("~/Programming/R/Data Set/Crime/Output/",as.character(uniqueState[[i]]),"/Crime/",as.character(uniqueCrime[[j]]))
    setwd(wd)
    print(getwd())
    dataSub=crimeIndia[indices,]
    write.csv(dataSub,file = fileName)
    setwd("~/Programming/R/Data Set/Crime/Output")
    print(getwd())
  }
}

#Writing  each data frame in a seperate csv file      [[[[[   Year  ]]]]]
for(i in 1:lengthState){
  print(getwd())
  for(j in 1:lengthYear){
    if(!file.exists(as.character(uniqueState[[i]]))) {
      dir.create(as.character(uniqueState[[i]]))
    }
    print(getwd())
    indices=which(crimeIndia$`STATE/UT`==uniqueState[[i]] & crimeIndia$YEAR==uniqueYear[[j]])
    fileName=paste0(as.character(uniqueYear[[j]]),".csv")
    wd=paste0("~/Programming/R/Data Set/Crime/Output/",as.character(uniqueState[[i]]))
    setwd(wd)
    print(getwd())
    if(!file.exists("Year")) {
      dir.create("Year")
    }
    setwd("Year")
    print(getwd())
    if(!file.exists(as.character(uniqueYear[[j]]))) {
      dir.create(as.character(uniqueYear[[j]]))
    }
    print(getwd())
    wd=paste0("~/Programming/R/Data Set/Crime/Output/",as.character(uniqueState[[i]]),"/Year/",as.character(uniqueYear[[j]]))
    setwd(wd)
    print(getwd())
    dataSub=crimeIndia[indices,]
    write.csv(dataSub,file = fileName)
    setwd("~/Programming/R/Data Set/Crime/Output")
  }
}

#Creating master csv file for each state
for(i in 1:lengthState){
  print(getwd())
    if(!file.exists(as.character(uniqueState[[i]]))) {
      dir.create(as.character(uniqueState[[i]]))
    }
    indices=which(crimeIndia$`STATE/UT`==uniqueState[[i]])
    fileName=paste0(as.character(uniqueState[[i]]),".csv")
    wd=paste0("~/Programming/R/Data Set/Crime/Output/",as.character(uniqueState[[i]]))
    setwd(wd)
    print(getwd())
    dataSub=crimeIndia[indices,]
    write.csv(dataSub,file = fileName)
    setwd("~/Programming/R/Data Set/Crime/Output")
    print(getwd())
}
option=readline(prompt = "This program would run for 2:25 minutes. Are you sure you want to run it? (y/n) : ")
if(option == 'y'){
  setwd("~/Programming/R/Data Set/Crime")
  source("Read.R")
  setwd("~/Programming/R/Data Set/Crime")
  source("CrimeAnalysis.R") 
  setwd("~/Programming/R/Data Set/Crime")
  source("YearAnalysis.R")
  setwd("~/Programming/R/Data Set/Crime")
  source("Map.R")
  cat("\n")
  print("Good Bye!")
  cat("\n")
}else{
  cat("\n")
  print("Good Bye!")
  cat("\n")
}
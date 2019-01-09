cause=select.list(apply(as.data.frame(labels[-1]),
                        1,
                        paste,
                        collapse="  "),
                        graphics=TRUE,
                        multiple=FALSE,
                        title = "Select Map to Display")


row=Accidents[,cause]
values=as.matrix(row)
values=as.numeric(values)
m=max(values)

levels=c(m*.25,m*.50,m*.75)

cl=character(0)

india=readRDS("IND_adm1.rds")
for(i in seq(length(india$NAME_1))){
  pattr=india$NAME_1[i]
  if(pattr=="Telangana"){
    cl=append(cl,"grey",length(cl))
    next
  }
  if(pattr=="NCT of Delhi"){
    pattr="Delhi"
  }
  index=grep(pattr,Accidents$`States/UTs`)
  val=as.matrix(Accidents[index,cause])
  val=as.numeric(val)
  
  if(val<=levels[1]){
    cl=append(cl,"Green",length(cl))
  }else if(val>levels[1] && val<=levels[2]){
    cl=append(cl,"Yellow",length(cl))
  }else if(val>levels[2] && val<=levels[3]){
    cl=append(cl,"Orange",length(cl))
  }else{
    cl=append(cl,"Red",length(cl))
  }
}

plot(india,
     bg="white",
     axes=TRUE,
     border="grey",
     col=cl,
     main=paste("% W.R.T. Maximum Count of",cause))

legend("topright",
       fill=c("Green","Yellow","Orange","Red","Grey"),
       bty="n",
       cex=.6,
       y.intersp = .6,
       legend=c("Below 25%","Between 25%-50%","Between 50%-75%","Above 75%","Telangana Not in Data"))
grid()
box()

zm()

rm(list=setdiff(ls(),c("Accidents","labels")))
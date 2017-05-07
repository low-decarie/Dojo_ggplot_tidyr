
assay.list<-list("ambient")
plate.list<-1:10  #goes to 11 but 11th bad
index<-0




data.extraction<-function(assay,plate.number){
  
  plate.file<-paste("./Data/plate_reads/",assay," ", plate.number,".TXT", sep="")
  
  time<-read.table(plate.file, header=F, sep="=", skip=4, fill=T)
  time<-time[1,2]
  time<-strptime(time, format="%m/%d/%Y %H:%M:%S")
  
  
  plate<-read.table(plate.file, header=F, sep=";", skip=14, fill=T, col.names=list("Line","Navicula", "Nitzschia", "Scenedesmus", "Pseudo", "Synechococcus", "Anabaena", "Chlamy","blank"))
  
  plate$CO2history[plate$Line=="A"|plate$Line=="B"|plate$Line=="C"]<-"ambient"
  plate$CO2history[plate$Line=="D"|plate$Line=="E"|plate$Line=="F"]<-"high"
  
  plate$Time<-time
  
  if(index==1)readings<-plate
  readings<-rbind(readings, plate)
  

  
  return(readings)
}

#assay<-assay.list[1]
#plate.number<-plate.list[3]

readings <- NULL

for(i in assay.list){
  for(j in plate.list){
    
    
    plate<-paste(i,j)
    print(plate)
    index<-index+1
    
    assay<-i
    plate.number<-j
    
    readings<-data.extraction(assay,plate.number)
    
    
  }
}




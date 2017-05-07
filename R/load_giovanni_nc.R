read_giovanni_nc_map <- function(giovanni_nc_map_file){
  #Load the NetCDF file
  giovanni_map_data <- open.nc(giovanni_nc_map_file)
  
  #Extract its content
  giovanni_map_data <- read.nc(giovanni_map_data)
  
  #Convert its content to a data frame
  giovanni_map_dataframe <- as.data.frame(giovanni_map_data[1])
  names(giovanni_map_dataframe) <- giovanni_map_data[[2]]
  giovanni_map_dataframe$lon <- giovanni_map_data[[3]]
  
  return(giovanni_map_dataframe)
}


CVI_check <- function(data=NULL,response_options='default') {
# Check assumptions if the data is in correct format
# CVI package assumes that the data is in tidy format
  # Assumes three columns
  stopifnot(dim(data)[2] == 3)

  # Generic names obtained from tidyverse operations
  stopifnot (names(data)[1]=='ID')
  stopifnot (names(data)[2]=='name')
  stopifnot (names(data)[3]=='value')

  if (response_options=='default'){
    response_categories <- c('Extremely Relevant','Moderately Relevant','Slightly Relevant','Not Relevant')
  }

  # Explore value column
  if (is.factor(data$value)==FALSE){
    data$value <- factor(data$value, levels = response_categories)
  }
  # report summary
  print(paste('No. Experts:',length(unique(data$ID))))
  print(paste('No. Items:',length(unique(data$name))))
  print(paste('No. Item response options:',length(levels(data$value))))
  print(paste('Item response options:',paste(levels(data$value),collapse = '--')))
  print(paste('Missing responses:',sum(is.na(data))))
  print(paste('Total responses:',nrow(data)))

    return <- data
}

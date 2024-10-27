#' Returns overall CVI for the scale using the item information
#'
#' Assumes items have been calculated previously
#'
#' @param items items as data frame
#' @param method relate to type of summary, either
#' average or universal
#'   Source:
#'   Polit DF, Beck CT, Owen SV. Is the CVI an acceptable indicator of content validity? Appraisal and recommendations. Res Nurs Health. 2007;30(4):459–67. doi: 10.1002/nur.20199.
#' @return data frame with the same structure as the input
CVI_scale <- function(items=NULL,method='average') {
# calculates the overall agreement from items
  # universal agreement approach is
  # the number of items considered relevant by all the judges. In other words, no. of items with CVI equal to 1
  # divided by the total number of items
  # The average calculation is the average of CVI-I
  # Source:
  # Polit DF, Beck CT, Owen SV. Is the CVI an acceptable indicator of content validity? Appraisal and recommendations. Res Nurs Health. 2007;30(4):459–67. doi: 10.1002/nur.20199.


  if (method == 'average') {
    CV <- sum(items$CVI.I)/nrow(items)
  } else if (method == 'universal') {
    CV <- sum(items$CVI.I==1)/nrow(items)
  } else {
    stop('method must be average or universal')
  }
    return <- CV
}

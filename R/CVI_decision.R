#' Return decision based on CVI
#'
#' Derived from Abdollahpour et al. (2010)
#'
#' @param CVI value to be processed
#' @return data frame with the same structure as the input

CVI_decision <- function(CVI=NULL) {
  # calculates CVI decision based on
  # CVI = observed CVI
  if (is.null(CVI)) {
    stop("CVI must be provided")
  }

# Source:
# Abdollahpour E, Nejat S, Nourozian M, Majdzadeh R. The process of content validity in instrument development. Iranian Epidemiology. 2010;6(4):66–74
#  If the I-CVI is higher than 79 percent, the item will be appropriate. If it is between 70 and 79 percent, it needs revision. If it is less than 70 percent, it is eliminated.
  if (CVI > 0.79) {
    decision <- "Appropriate"
  } else if (CVI >= 0.70 && CVI <= 0.79) {
    decision <- "Needs revision"
  } else {
    decision <- "Eliminated"
  }
  return <- decision
}

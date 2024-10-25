#' Return decision based on kappa
#'
#' Derived from Cicchetti, D. V., & Sparrow, S. A. (1981)
#'
#' @param CVI value to be processed
#' @return data frame with the same structure as the input

kappa_decision <- function(CVI=NULL) {
  # calculates CVI decision based on
  # kappa adjusted CVI
  if (is.null(CVI)) {
    stop("CVI must be provided")
  }

#  Interpretation criteria for Kappa, using guidelines described in Cicchetti and Sparrow (1981):
  #Fair = K of 0.40 to 0.59; Good = K of 0.60 to 0.74; and Excellent = K > 0.74

#  Cicchetti, D. V., & Sparrow, S. A. (1981). Developing criteria for establishing interrater reliability of specific items: applications to assessment of adaptive behavior. American journal of mental deficiency, 86(2), 127–137.
    if (CVI > 0.74) {
    decision <- "Excellent"
  } else if (CVI >= 0.60 && CVI <= 0.74) {
    decision <- "Good"
  } else if (CVI >= 0.40 && CVI <= 0.59) {
    decision <- "Fair"
  } else {
    decision <- "Poor"
  }
  return <- decision
}

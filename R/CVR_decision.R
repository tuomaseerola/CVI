#' Return decision based on CVR
#'
#' Using the critical values from Jeldres et al 2023 
#' (see critical_values dataset).
#' Source: 
#' Romero Jeldres, M., Díaz Costa, E., & Faouzi Nadim, T. (2023). 
#' A review of Lawshe’s method for calculating content validity in 
#' the social sciences. In Frontiers in Education (Vol. 8, p. 1271335).
#' https://doi.org/10.3389/feduc.2023.1271335
#'
#' @param CVR CVR value 
#' @param N_experts Number of experts
#' @param Method Method for calculating the decision. Default is "Exact"
#' but 'Bayes', 'Chi' and 'Latche' are also possible.
#' @return data frame with the same structure as the input

CVR_decision <- function(CVR = NULL, N_experts = NULL, Method = "Exact") {
  # Checking inputs
  if (is.null(CVR)) {
    stop("CVR must be provided")
  }
  if (is.null(N_experts)) {
    stop("N_experts must be provided")
  }
  # load critical values
  critical <- critical_values
  critical<-dplyr::filter(critical, N == N_experts)
  # select method
  if (Method == "Exact") {
    if (CVR >= critical$Exact) {
      decision <- paste("Accept >",critical$Exact)
    } else {
      decision <- "Reject"
    }
  }
  if (Method == "Chi") {
    if (CVR >= critical$Chi) {
      decision <- paste("Accept >",critical$Chi)
    } else {
      decision <- "Reject"
    }
  }
  if (Method == "Lawshe") {
    if (CVR >= critical$Lawshe) {
      decision <- paste("Accept >",critical$Lawshe)
    } else {
      decision <- "Reject"
    }
  }
  if (Method == "Bayes") {
    if (CVR >= critical$Bayes) {
      decision <- paste("Accept >",critical$Bayes)
    } else {
      decision <- "Reject"
    }
  } 
  else if (Method != 'Chi' & Method != 'Lawshe' & Method != 'Bayes' & Method != 'Exact') {
    stop("Method not found! Acceptable Options are Exact, Chi, Lawshe, Bayes")
  }
  return <- decision
}

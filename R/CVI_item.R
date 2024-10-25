#' Run content validity indices for items
#'
#' Assumes that the ratings are on a specific scale of 1-4
#' Calculates CVI for items
#'
#' @param data data frame to be processed, where the minimal requirements are:
#' ID, name, value
#' @return data frame with the same structure as the input

CVI_item <- function(data=NULL) {
  # describe what the analysis does
  # Expert give ratings on a scale of 1-4
  # Content Validity (CV), CVR (ratio)

  # Content validity ratio (CVR) from https://www.sciencedirect.com/science/article/pii/S2405603023000109
  # CVR=(Ne - N/2)/(N/2)
  # https://rdrr.io/cran/psychometric/man/CVratio.html
  # ITEM-LEVEL
  data <- tidyr::drop_na(data) # remove missing
  dfw <- tidyr::pivot_wider(data,names_from = 'name',values_from = 'value')
  dfw <- dplyr::select(dfw,-ID) # remove the ids before the loop

  ## utility function: content validity ratio
  cvr <- function(n_total, n_essential)
  {
    n <- n_total
    ne <- n_essential
    ratio <- (ne - n/2)/(n/2)
    return(ratio)
  }

  U <- names(dfw)
  CVR<-NULL
  CVI<-NULL
  CVISUM<-NULL
  N_EXPERTS <- NULL
  for (k in 1:length(U)) {
    item <- dplyr::select(dfw,U[k])
    item <- item[complete.cases(item),] # remove NAs from the data (experts and ratings)
    N_experts <- nrow(item)
    N_high <- sum(item[1]=='Extremely Relevant' | item[1]=='Moderately Relevant')
  #  CVR <- rbind(CVR,psychometric::CVratio(N_experts,N_high))
    CVR <- rbind(CVR,cvr(N_experts,N_high))

    #  Content validity index (CVI)
    # number of raters giving 3 or 4 / total number of raters
    CVI <- rbind(CVI,(sum(item[1]=='Extremely Relevant') + sum(item[1]=='Moderately Relevant'))/N_experts)
    CVISUM <- rbind(CVISUM,(sum(item[1]=='Extremely Relevant') + sum(item[1]=='Moderately Relevant')))
    N_EXPERTS <- rbind(N_EXPERTS,N_experts)
  }


  CV <- data.frame(Item = U, Sum = CVISUM, N = as.numeric(N_EXPERTS),CVI.I=CVI[,1],CVI.R=CVR[,1])
  # add kappa adjusted
  CV %>% dplyr::rowwise() %>% dplyr::mutate(CVI.I.adj = kappa_chance_adjusted(N, Sum,CVI.I)) -> CV
  # add decision
  CV %>% dplyr::rowwise() %>% dplyr::mutate(Decision = CVI_decision(CVI.I)) -> CV
  CV %>% dplyr::rowwise() %>% dplyr::mutate(KappaFit = kappa_decision(CVI.I.adj)) -> CV

    return <- CV
}

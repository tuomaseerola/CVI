kappa_chance_adjusted <- function(N = NULL, A = NULL, CVI = NULL) {
  # calculates the chance of agreement by chance
  # N = number of items
  # A = number of items agreed
  if (is.null(N) || is.null(A)) {
    stop("N and A must be provided")
  }
  if (A > N) {
    stop("A cannot be greater than N")
  }
  # chance of agreement by chance
  Pc <- (factorial(N) / (factorial(A) * factorial(N - A))) * 0.5^N
  # adjustment  
  K = (CVI - Pc) / (1 - Pc)
  
  return <- K
}

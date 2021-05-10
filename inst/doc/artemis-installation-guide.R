## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  echo = TRUE
)

## ---- eval=FALSE, include=TRUE------------------------------------------------
#  # install dependencies
#  install.packages(c("StanHeaders", "Rcpp", "rstan", "rstantools", "ggplot2", "lme4"))
#  
#  ##-- MacOSX --##
#  install.packages("https://github.com/fishsciences/artemis/releases/download/v0.14.0/MacOS-artemis_0.14.0.tar.gz",
#                   repos = NULL)
#  
#  ##-- LINUX --##
#  install.packages("https://github.com/fishsciences/artemis/releases/download/v0.14.0/artemis_0.14.0_R_x86_64-pc-linux-gnu.tar.gz",
#                   repos = NULL)
#  
#  ##-- Windows --#
#  install.packages("https://github.com/fishsciences/artemis/releases/download/v0.14.0/artemis_0.14.0.zip",
#                   repos = NULL)
#  
#  

## ---- eval=FALSE--------------------------------------------------------------
#  library(artemis)
#  
#  model_fit = eDNA_lm(Cq ~ Distance + Volume + Distance*Volume,
#                      data = eDNA_data,
#                      std_curve_alpha = 21.2, std_curve_beta = -1.5,
#                      iter = 300, n_chain = 2)
#  
#  model_fit2 = eDNA_lmer(Cq ~ Distance + Volume + (1|SampleID),
#                         eDNA_data,
#                         std_curve_alpha = 21.2, std_curve_beta = -1.5)
#  


## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message = FALSE, warning = FALSE----------------------------------
library(artemis)

## -----------------------------------------------------------------------------
head(eDNA_data)
str(eDNA_data)

## ----eval = FALSE-------------------------------------------------------------
#  na_vals = !complete.cases(eDNA_data)
#  eDNA_data[na_vals,] # visual inspection

## ----warning = FALSE, eval=FALSE----------------------------------------------
#  
#  model_fit = eDNA_lm(Cq ~ Distance_m,
#                      data = eDNA_data,
#                      std_curve_alpha = 21.2, std_curve_beta = -1.5)
#  

## ----warning = FALSE, message=FALSE, eval=FALSE-------------------------------
#  model_fit = eDNA_lm(Cq ~ Distance_m,
#                      data = eDNA_data,
#                      std_curve_alpha = 21.2, std_curve_beta = -1.5,
#                      seed = 1234,
#                      chains = 1) # we don't recommend sampling just 1 chain; the default is 4
#  

## ----warning = FALSE, eval=FALSE----------------------------------------------
#  d = eDNA_data # create a copy to modify
#  d$Year = factor(sample(2018:2020, size = nrow(d), replace = TRUE)) # create a random variable
#  
#  model_fit2 = eDNA_lmer(Cq ~ Distance_m + Volume_mL + (1|Year),
#                         data = d,
#                         std_curve_alpha = 21.2, std_curve_beta = -1.5,
#                         seed = 1234)
#  

## ---- eval=FALSE--------------------------------------------------------------
#  summary(model_fit)
#  
#  plot(model_fit, pars = c("intercept", "betas"))

## ----eval=FALSE---------------------------------------------------------------
#  ranef(model_fit2)

## ---- eval=FALSE--------------------------------------------------------------
#  rstan::summary(model_fit2@stanfit, pars = "rand_betas", probs = c(0.50, 0.025, 0.975))$summary
#  plot(model_fit2, pars = "rand_betas")


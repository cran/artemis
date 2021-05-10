## ---- include = FALSE, echo = FALSE-------------------------------------------
knitr::opts_chunk$set(
  eval = FALSE, # for while editing vignette
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo = FALSE, eval=TRUE, message=FALSE, warning=FALSE-------------
library(artemis)

## ----eval=TRUE----------------------------------------------------------------
p_detect = est_p_detect(variable_levels = c(Intercept = 1, 
                                            Distance = 100),
                        betas = c(Intercept = -10.5, Distance = -0.03),
                        ln_eDNA_sd = 1, 
                        std_curve_alpha = 21.2, std_curve_beta = -1.5,
                        n_rep = 12:30)
p_detect

## ----fig = TRUE, eval=TRUE----------------------------------------------------
plot(p_detect)


## ---- eval=FALSE, fig = TRUE--------------------------------------------------
#  model_fit = eDNA_lm(Cq ~ Distance_m + Volume_mL,
#                      data = eDNA_data,
#                      std_curve_alpha = 21.2, std_curve_beta = -1.5,
#                      seed = 1234,
#                      chains = 1)
#  
#  # Intercept is automatically supplied if in model_fit
#  p_detect2 = est_p_detect(variable_levels = c(Distance_m = 100,
#                                               Volume_mL = 50),
#                          model_fit = model_fit,
#                          n_rep = 1:12)
#  
#  print(p_detect2)
#  

## ---- fig = TRUE, eval = FALSE------------------------------------------------
#  plot(p_detect2, error_width = 0.1)


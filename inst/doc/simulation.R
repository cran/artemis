## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE-----------------------------------------------------
library(artemis)

## ----eval=TRUE----------------------------------------------------------------
vars = list(Cq = 1,
            Intercept = 1,
            distance = c(0, 15, 50),
            volume = c(25, 50),
            tech_rep = 1:10,
            rep = 1:3)

## ---- eval=TRUE---------------------------------------------------------------
betas = c(intercept = -10.6, distance = -0.05, volume = 0.02)

## ----warning = FALSE, eval=TRUE-----------------------------------------------
set.seed(1234)
ans = sim_eDNA_lm(Cq ~ distance + volume, 
                  variable_list = vars,
                  betas = betas,
                  sigma_ln_eDNA = 1.5, 
                  std_curve_alpha = 21.2, 
                  std_curve_beta = -1.5)

## ----eval=TRUE----------------------------------------------------------------
str(ans, max.level = 3)


## ----eval=TRUE----------------------------------------------------------------
summary(ans)


## ----eval = FALSE-------------------------------------------------------------
#  ans2 = sim_eDNA_lm(Cq ~ distance + volume,
#                    variable_list = vars,
#                    betas = betas,
#                    sigma_ln_eDNA = 1,
#                    std_curve_alpha = 21.2,
#                    std_curve_beta = -1.5,
#                    n_sim = 500) # specifies the number of simulated datasets to generate

## ----eval=TRUE, fig.show='hold'-----------------------------------------------
plot(ans, alpha = 0.5, jitter_width = 0.2)

## ----include=TRUE, eval=TRUE, fig.height=3, fig.width=7-----------------------
simsdf <- data.frame(ans)

# custom plot of simulated data
ggplot(simsdf, aes(x = factor(distance), y = Cq_star)) +
  geom_jitter(aes(color = factor(volume)),
              width = 0.05,
              alpha = 0.65) +
  geom_boxplot(alpha = 0.5,
               width = 0.2,
               size = 0.5) +
  theme_minimal() +
  labs(x = "Distance (m)", y = "Estimated Cq")


## ----warning = FALSE----------------------------------------------------------
ans3 = sim_eDNA_lmer(Cq ~ distance + volume + (1|rep) + (1|tech_rep),
                     variable_list = vars,
                     betas = c(intercept = -10.6, distance = -0.05, volume = 0.01),
                     sigma_ln_eDNA = 1,
                     sigma_rand = c(0.1, 0.1), #stdev of the random effects
                     std_curve_alpha = 21.2,
                     std_curve_beta = -1.5)



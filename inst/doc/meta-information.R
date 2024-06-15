## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo=FALSE, message=FALSE-----------------------------------------
library(ilabelled)

## -----------------------------------------------------------------------------
myVariable <- i_labelled(c(1, 2, 3, -9, NA))

myVariable <- myVariable |>
  i_label("my variable label") |>
  i_labels(
    "A" = 1,
    "B" = 2,
    "C" = 3,
    "X" = -9
  ) |>
  i_na_range(c(-9,-1)) |>
  i_scale("nominal") |>
  i_subject("dummy data")
myVariable


## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE, echo=FALSE-----------------------------------------
library(ilabelled)

## -----------------------------------------------------------------------------
myData <- i_labelled(
  x = c(1, 2, 3, NA), 
  labels = c("A" = 1, "B" = 2), 
  label = "my Variable"
)
as.character(myData)
as.numeric(myData)
as.factor(myData)

## -----------------------------------------------------------------------------
myData <- i_labelled(
  x = c(1, 2, 3, NA, -9), 
  labels = c("A" = 1, "B" = 2, "X" = -9), 
  label = "my Variable",
  na_values = -9
)
i_as_factor(myData, missing_to_na = FALSE, keep_attributes = FALSE)
i_as_character(myData, missing_to_na = TRUE, keep_attributes = TRUE)


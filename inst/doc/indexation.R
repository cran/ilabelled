## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo=FALSE, message=FALSE-----------------------------------------
library(ilabelled)

## -----------------------------------------------------------------------------
myData <- i_labelled(
  x = c(1, 2, 3, NA), 
  labels = c("A" = 1, "B" = 2, "C" = 3), 
  label = "my Variable"
)

myData %in% 1
myData == 1
myData > 1

## -----------------------------------------------------------------------------
myData %in% c("A", "B")
myData != "C"
myData > "A"


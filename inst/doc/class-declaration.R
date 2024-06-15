## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo=FALSE, message=FALSE-----------------------------------------
library(ilabelled)

## -----------------------------------------------------------------------------
set.seed(1234)

myVar <- i_labelled(
  x = sample(c(1:3,-9), 50, replace = TRUE), 
  label = "Gender",
  labels = c(
    "A" = 1,
    "B" = 2,
    "C" = 3,
    "X" = -9
  ),
  na_values = -9,
  subject = "Personal information",
  wording = "What is your gender",
  scale = "nominal"
)
myVar


## -----------------------------------------------------------------------------
myData <- factor(c(1, 2, 3, NA), levels = 1:3, labels = c("A", "B", "C"))
myData <- i_labelled(myData)
myData
myData %in% "A"
myData == 1


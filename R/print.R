
#' custom print method for i_labelled
#' @export
#' @returns No return value. Print object data and information to console
#' @param x vector of class i_labelled
#' @param ... not used
print.i_labelled <- function(x, ...){

  if(is.double(unclass(x))){
    cat("<", "i_labelled double", ">\n", sep = "")
  }else if(is.character(unclass(x))){
    cat("<", "i_labelled character", ">\n", sep = "")
  }else if(is.numeric(unclass(x))){
    cat("<", "i_labelled numeric", ">\n", sep = "")
  }else{
    stop("print.i_labelled unknown class")
  }

  print(`attributes<-`(x, NULL))

  i_print_wording(x)
  i_print_subject(x)
  i_print_na_values(x)
  i_print_na_range(x)
  i_print_scale(x)
  i_print_label(x)
  i_print_annotation(x)
  i_print_labels(x)
  i_print_attributes(x, exclude = c("class", "wording", "subject", "na_values", "na_range", "scale", "label", "annotation", "labels"))

  invisible(x)
}


#' print value labels
#' @returns No return value. Print labels to console
#' @param x vector
#' @export
i_print_labels <- function(x){
  UseMethod("i_print_labels")
}

#' @export
i_print_labels.default <- function(x){
  labels <- attr(x, "labels", exact = TRUE)
  if(is.null(labels)){
    return(invisible(labels))
  }
  cat("\nValue labels:\n")
  labels <- data.frame(value = labels, label = names(labels), row.names = NULL, stringsAsFactors = FALSE)
  print(labels, row.names = FALSE)
}


#' print variable label
#' @returns No return value. Print variable label to console
#' @param x vector
#' @export
i_print_label <- function(x){
  UseMethod("i_print_label")
}

#' @export
i_print_label.default <- function(x){
  label <- attr(x, "label", exact = TRUE)
  if(is.null(label)){
    return(invisible(label))
  }
  cat(c("\nVariable label: ", label), sep = "\n ")
  # cat("\nVariable label:", paste0(label, collapse = " / "), "\n")
}


#' print missing values
#' @returns No return value. Print na values to console
#' @param x vector
#' @export
i_print_na_values <- function(x){
  UseMethod("i_print_na_values")
}

#' @export
i_print_na_values.default <- function(x){
  na_values <- attr(x, "na_values", exact = TRUE)
  if(is.null(na_values)){
    return(invisible(na_values))
  }
  cat(paste0("\nMissing values: [", paste0(sort(na_values), collapse = ","), "]", "\n"))
}


#' print missing range
#' @returns No return value. Print na range to console
#' @param x vector
#' @export
i_print_na_range <- function(x){
  UseMethod("i_print_na_range")
}

#' @export
i_print_na_range.default <- function(x){
  na_range <- attr(x, "na_range", exact = TRUE)
  if(is.null(na_range)){
    return(invisible(na_range))
  }
  cat(paste0("\nMissing range: [", min(na_range, na.rm = TRUE), ":", max(na_range, na.rm = TRUE), "]"), "\n")
}


#' print scale level
#' @returns No return value. Print scale level to console
#' @param x vector
#' @export
i_print_scale <- function(x){
  UseMethod("i_print_scale")
}

#' @export
i_print_scale.default <- function(x){
  scale <- attr(x, "scale", exact = TRUE)
  if(is.null(scale)){
    return(invisible(scale))
  }
  cat(paste0("\nScale level: ", scale), sep = "\n")
}



#' print annotation
#' @returns No return value. Print annotation attribute to console
#' @param x vector
#' @export
i_print_annotation <- function(x){
  UseMethod("i_print_annotation")
}

#' @export
i_print_annotation.default <- function(x){
  annotation <- attr(x, "annotation", exact = TRUE)
  if(is.null(annotation)){
    return(invisible(annotation))
  }
  cat(c("\nAnnotation: ", annotation), sep = "\n ")
}


#' print wording
#' @returns No return value. Print wording attribute to console
#' @param x vector
#' @export
i_print_wording <- function(x){
  UseMethod("i_print_wording")
}

#' @export
i_print_wording.default <- function(x){
  wording <- attr(x, "wording", exact = TRUE)
  if(is.null(wording)){
    return(invisible(wording))
  }
  cat(c("\nWording:", wording), sep = "\n ")
}


#' print subject
#' @returns No return value. Print subject attribute to console
#' @param x vector
#' @export
i_print_subject <- function(x){
  UseMethod("i_print_subject")
}

#' @export
i_print_subject.default <- function(x){
  subject <- attr(x, "subject", exact = TRUE)
  if(is.null(subject)){
    return(invisible(subject))
  }
  cat(c("\nSubject:\n", subject, "\n"))
}


#' print attributes
#' @returns No return value. Print attributes to console
#' @param x vector
#' @param exclude character vector with attribute names not taken into account
#' @export
i_print_attributes <- function(x, exclude = NULL){
  UseMethod("i_print_attributes")
}

#' @export
i_print_attributes.default <- function(x, exclude = NULL){
  a <- attributes(x)
  if(length(a) < 1){
    return(invisible(a))
  }
  a <- a[!names(a) %in% exclude]
  for(i in names(a)){
    tmp <- a[[i]]
    cat("\n", i, ":\n")
    print(tmp)
  }
}

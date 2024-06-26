#' remove missing labels
#' @description
#' remove values labels from values which are declared as missing
#'
#' @returns Returns x without missing labels
#' @param x vector or data.frame
#' @export
i_remove_missing_labels <- function(x){
  UseMethod("i_remove_missing_labels")
}

#' @export
i_remove_missing_labels.default <- function(x){
  stopifnot(is.atomic(x))

  na_vals <- c(attr(x, "na_values", TRUE), names(attr(x, "na_values", TRUE)))
  na_range <- sort(attr(x, "na_range", TRUE))
  labels <- attr(x, "labels", TRUE)
  if(!is.null(labels)){
    # browser()
    isnaval <- (labels %in% na_vals | names(labels) %in% na_vals)
    if(length(na_range) > 0){
      isnarange <- labels >= min(na_range) & labels <= max(na_range)
      labels <- labels[!isnaval & !isnarange]
    }else{
      labels <- labels[!isnaval]
    }
    if(length(labels) < 1){
      labels <- NULL
    }
    return(structure(x, labels = labels))
  }else{
    return(x)
  }
}

#' @export
i_remove_missing_labels.data.frame <- function(x){
  x[] <- lapply(x, i_remove_missing_labels)
  x
}

# -----------------------------------------------------------------------------

#' remove variable label
#' @description
#' remove variable label
#' keep other attributes
#'
#' @returns Returns x without variable label
#' @param x vector or data.frame
#' @export
i_remove_label <- function(x){
  UseMethod("i_remove_label")
}

#' @export
i_remove_label.default <- function(x){
  stopifnot(is.atomic(x))
  structure(
    x,
    label = NULL
  )
}

#' @export
i_remove_label.data.frame <- function(x){
  x[] <- lapply(x, i_remove_label)
  x
}

# -----------------------------------------------------------------------------

#' remove all value labels
#' @description
#' remove all value labels
#' keep other attributes
#'
#' @returns Returns x without value labels
#' @param x vector or data.frame
#' @export
i_remove_labels <- function(x){
  UseMethod("i_remove_labels")
}

#' @export
i_remove_labels.default <- function(x){
  stopifnot(is.atomic(x))
  structure(
    x,
    labels = NULL
  )
}

#' @export
i_remove_labels.data.frame <- function(x){
  x[] <- lapply(x, i_remove_labels)
  x
}

# -----------------------------------------------------------------------------

#' remove as na values
#' @description
#' remove na values (information which values should be handled as missing)
#' keep other attributes
#'
#' @returns Returns x without na-values
#' @param x vector or data.frame
#' @export
i_remove_na_values <- function(x){
  UseMethod("i_remove_na_values")
}

#' @export
i_remove_na_values.default <- function(x){
  stopifnot(is.atomic(x))
  structure(
    x,
    na_values = NULL
  )
}

#' @export
i_remove_na_values.data.frame <- function(x){
  x[] <- lapply(x, i_remove_na_values)
}

# -----------------------------------------------------------------------------

#' remove as na range
#' @description
#' remove na range (information which values should be handled as missing)
#' keep other attributes
#'
#' @returns Returns x without na-range
#' @param x vector or data.frame
#' @export
i_remove_na_range <- function(x){
  UseMethod("i_remove_na_range")
}

#' @export
i_remove_na_range.default <- function(x){
  stopifnot(is.atomic(x))
  structure(
    x,
    na_range = NULL
  )
}

#' @export
i_remove_na_range.data.frame <- function(x){
  x[] <- lapply(x, i_remove_na_range)
}

# -----------------------------------------------------------------------------

#' remove scale level
#' @description
#' remove scale label from variable
#' keep other attributes
#'
#' @returns Returns x without scale level
#' @param x vector or data.frame
#' @export
i_remove_scale <- function(x){
  UseMethod("i_remove_scale")
}

#' @export
i_remove_scale.default <- function(x){
  stopifnot(is.atomic(x))
  structure(
    x,
    scale = NULL
  )
}

#' @export
i_remove_scale.data.frame <- function(x){
  x[] <- lapply(x, i_remove_scale)
}


# -----------------------------------------------------------------------------

#' remove annotation
#' @description
#' remove annotation label from variable
#' keep other attributes
#'
#' @returns Returns x without annotation
#' @param x vector or data.frame
#' @export
i_remove_annotation <- function(x){
  UseMethod("i_remove_annotation")
}

#' @export
i_remove_annotation.default <- function(x){
  stopifnot(is.atomic(x))
  structure(
    x,
    annotation = NULL
  )
}

#' @export
i_remove_annotation.data.frame <- function(x){
  x[] <- lapply(x, i_remove_annotation)
}


# -----------------------------------------------------------------------------

#' remove wording
#' @description
#' remove wording label from variable
#' keep other attributes
#'
#' @returns Returns x without wording
#' @param x vector or data.frame
#' @export
i_remove_wording <- function(x){
  UseMethod("i_remove_wording")
}

#' @export
i_remove_wording.default <- function(x){
  stopifnot(is.atomic(x))
  structure(
    x,
    wording = NULL
  )
}

#' @export
i_remove_wording.data.frame <- function(x){
  x[] <- lapply(x, i_remove_wording)
}



# -----------------------------------------------------------------------------

#' remove subject
#' @description
#' remove subject label from variable
#' keep other attributes
#'
#' @returns Returns x without subject
#' @param x vector or data.frame
#' @export
i_remove_subject <- function(x){
  UseMethod("i_remove_subject")
}

#' @export
i_remove_subject.default <- function(x){
  stopifnot(is.atomic(x))
  structure(
    x,
    subject = NULL
  )
}

#' @export
i_remove_subject.data.frame <- function(x){
  x[] <- lapply(x, i_remove_subject)
}

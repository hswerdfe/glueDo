

require(glue)





#' Glue Wrapper Functions
#'
#' These functions are used to pass a glue string to a function and execute it.
#'
#' @param .x      The glue string containing expressions to be evaluated.
#' @param ...     Additional arguments passed to `glue`.
#' @param .envir  The environment where the expressions in the glue string are evaluated. Defaults to `parent.frame()`.
#' @param .func   A function to execute with the result of the evaluated glue string.
#' @param file    file file
#'
#' @return Returns the result of executing `.func` with the evaluated glue string.
#' @export
#' @examples
#' world <- 'mars'
#' glue_message('HELLO {world}!')
#'
glue_do <- function(.x, ..., .envir = parent.frame(), .func){
  .func(glue::glue(.x, ..., .envir = .envir))
}


#' @describeIn glue_do Executes a custom function with the evaluated glue string.
#' @export
glue_func <- function(.x, .func, ..., .envir = parent.frame()){
  glue_do(.x, ..., .envir = .envir, .func = .func)
}




#' @describeIn glue_do Executes the `stop` function with the evaluated glue string.
#' @export
glue_stop <- function(.x, ..., .envir = parent.frame(), .func = stop){
  glue_do(.x, ..., .envir = .envir, .func = .func )
}

#' @describeIn glue_do Executes the `print` function with the evaluated glue string.
#' @export
glue_print <- function(.x, ..., .envir = parent.frame(), .func = print){
  glue_do(.x, ..., .envir = .envir, .func = .func )
}

#' @describeIn glue_do Executes the `message` function with the evaluated glue string.
#' @export
glue_message <- function(.x, ..., .envir = parent.frame(), .func = message){
  glue_do(.x, ..., .envir = .envir, .func = .func )
}

#' @describeIn glue_do Executes the `warning` function with the evaluated glue string.
#' @export
glue_warning <- function(.x, ..., .envir = parent.frame(), .func = warning){
  glue_do(.x, ..., .envir = .envir, .func = .func )
}



#' @describeIn glue_do Executes the `cat` function with the evaluated glue string.
#' @export
glue_cat <- function(.x, ..., .envir = parent.frame(), .func = cat){
  glue_do(.x, ..., .envir = .envir, .func = .func)
}


#' @describeIn glue_do Evaluates the glue string and returns the result.
#' @export
glue_return <- function(.x, ..., .envir = parent.frame(), .func = identity){
  glue_do(.x, ..., .envir = .envir, .func = .func)
}



#' @describeIn glue_do Initializes a file connection and writes the evaluated glue string to it.
#' @export
glue_write <- function(.x, file, ..., .envir = parent.frame(), .func = writeLines){
  con <- file(file, open = "wt")
  on.exit(close(con), add = TRUE)
  glue_do(.x, ..., .envir = .envir, .func = function(output) .func(output, con))
}


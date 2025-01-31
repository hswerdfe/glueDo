library(testthat)
library(glue)

# Define some helper functions for testing
test_func <- function(x) x

test_that("glue_do works with print function", {
  text <- "HELLO {data}!"
  data <- "world"
  expect_output(glue_do(text, .func = test_func), "HELLO world!")
})

test_that("glue_stop throws an error correctly", {
  text <- "Error: {data}"
  data <- "This is a test error"
  expect_error(glue_stop(text), "Error: This is a test error")
})

test_that("glue_print works correctly", {
  text <- "Print test: {data}"
  data <- "Test"
  expect_output(glue_print(text), "Print test: Test")
})

test_that("glue_message works correctly", {
  text <- "Message: {data}"
  data <- "Check"
  expect_message(glue_message(text), "Message: Check")
})

test_that("glue_warning throws a warning correctly", {
  text <- "Warning: {data}"
  data <- "Be careful"
  expect_warning(glue_warning(text), "Warning: Be careful")
})

test_that("glue_do executes custom function correctly", {
  text <- "Custom output {data}"
  data <- "Success"
  expect_equal(glue_do(text, .func = identity), "Custom output Success")
})

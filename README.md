# glueDo

The `glueDo` package provides a set of wrapper functions around the `glue` package, allowing you to seamlessly pass glue strings to a variety of functions and execute them. These functions simplify the use of dynamic strings in various common tasks.

## Installation

You can install the development version of `glueDo` from [GitHub](https://github.com) using the `remotes` package:

```r
# If you don't have the remotes package installed, install it first
install.packages("remotes")

# Install glueDo from GitHub
remotes::install_github("hswerdfe/glueDo")
Alternatively, you can use the devtools package:# If you don't have the devtools package installed, install it first
install.packages("devtools")

# Install glueDo from GitHub
devtools::install_github("hswerdfe/glueDo")
```

# Functions

The main functions provided by this package are:

glue_do()
glue_stop()
glue_print()
glue_message()
glue_warning()

Each of these functions takes a glue string and executes it using the specified function (print, message, warning, etc.).UsageHere’s an example of how to use the glue_message function:library(glueDo)

```r
world <- 'mars'
glue_message('HELLO {world}!')
'''

glue_do The glue_do function evaluates a glue string and passes the result to a specified function. glue_do("The answer is {42}", .func = print)
glue_stop The glue_stop function evaluates a glue string and uses it to throw an error. glue_stop("An error occurred: {error_message}", error_message = "Something went wrong")
glue_print The glue_print function evaluates a glue string and prints the result. glue_print("The quick brown fox {action}", action = "jumps over the lazy dog")
glue_message The glue_message function evaluates a glue string and sends it as a message. glue_message("Welcome to {place}", place = "New York")
glue_warning The glue_warning function evaluates a glue string and sends it as a warning. glue_warning("This is a warning about {issue}", issue = "disk space")

License This package is licensed under the MIT License. See the LICENSE file for more details.```


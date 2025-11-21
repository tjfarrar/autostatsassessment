setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
options(tinytex.verbose = TRUE)

# Load exams and any other libraries that we need
library(exams)
library(knitr)
library(kableExtra)
library(readxl)
library(scales)
library(openxlsx)
library(broom)
library(MASS)
library(pracma)
library(rSymPy)
library(berryFunctions)
library(english)
library(tth)

# Load an R script with some useful functions, frac2rational and frac2latex
source("mathstatsfunctions.R")

# How many random versions of the test we want to generate
maxn <- 20L
myseed <- 9860

test_questions_Rmd <- list("capital_cities.Rmd",
                           "two_numbers.Rmd",
                           "calculate_gradient.Rmd",
                           "calculate_lotto.Rmd",
                           "upload_scatterplot.Rmd",
                           "upload_expectation.Rmd")

# It is VERY important to set the seed here
set.seed(myseed)

# Generate an HTML version of the test for preview purposes
exams2html(file = test_questions_Rmd, n = maxn, 
           mathjax = TRUE, converter = "pandoc-mathjax", 
           solution = TRUE,
           name = "Example_Test_1_", dir = "ExampleTest1_Rmd")

# Be sure to set same seed for the LMS as for HTML
set.seed(myseed)

# MathJax is not currently supported in Blackboard Ultra; 
# that is why we set mathjax = FALSE
exams2blackboard(file = test_questions_Rmd, n = maxn, 
                 mathjax = FALSE, 
                 name = "Example_Test_1_", dir = "ExampleTest1_Rmd")

# You may want to change the seed and run exams2blackboard again 
#  with a different name and directory for the test. 
# This way you can create practice versions and real versions of the 
#  test for your students
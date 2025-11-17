# Set working directory to be folder where this script is saved
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
options(tinytex.verbose = TRUE)

# Load various R packages
library(knitr)
library(tidyverse)
library(exams)
library(english)
library(rmarkdown)
library(kableExtra)
library(readxl)
library(scales)
library(openxlsx)
library(broom)
library(MASS)
library(pracma)
library(rSymPy)
library(berryFunctions)
library(extraDistr)

# Source some useful functions for working with mathematical expressions, 
#  converting between sympy and latex, etc.
source("mathstatsfunctions.R")

# Use yyyy-mm-dd
testdate <- as.Date("2025-11-26")
theyear <- year(testdate)
subjectname = "Statistics"
subjectcode = "ABC260S"
testname = "Test"
# Set testno to "" if not applicable, e.g. if testname is "Final Exam" 
testno = "2"
qualname = "Diploma in Stuff"
qualcode = "D3STUF"
examiner = "Mr E Fudd"
intmoderator = "Ms M Mouse"
# Use HHhMM format for times so that duration is correctly calculated
starttime = "09h00"
endtime = "11h00"

opfilename <- paste(gsub(pattern = " |:", 
                         replacement = "_", x = subjectname),
                    subjectcode, testname, testno, sep = "_")
memovec <- c(FALSE, TRUE)
filenamevec <- str_c(opfilename, c("_QP", "_Memo"))

# The Rmd source file is assumed to have the filename
# subjectcode_testname_testno_currentyear.Rmd

# The Rmd file will be rendered twice: the first time to generate the 
#  question paper; the second time to generate the memorandum
invisible(lapply(1:2, function(i) {
  render(input = str_c(str_c(subjectcode, testname, testno, theyear, 
                       sep = "_"), ".Rmd"),
         params = list(title = filenamevec[i], 
                       testdate = testdate, 
                       starttime = starttime,
                       endtime = endtime,
                       subjectname = subjectname,
                       subjectcode = subjectcode,
                       testname = testname,
                       testno = testno,
                       qualname = qualname,
                       qualcode = qualcode,
                       examiner = examiner,
                       intmoderator = intmoderator,
                       domemo = memovec[i]),  
         output_file = filenamevec[i], clean = FALSE, 
         envir = globalenv())
}))

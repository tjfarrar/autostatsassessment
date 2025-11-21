# Automated setting of statistics assessments using R

This repo has been created for a workshop offered at the 2025 South African Statistical Association Conference.

- The [templates](https://github.com/tjfarrar/autostatsassessment/tree/main/templates) folder contains source and output files useful for automatic generation of paper-based and online statistics assessments.
- The [slides](https://github.com/tjfarrar/autostatsassessment/tree/main/slides) folder contains source and output files for the workshop slides.
- The [videos](https://github.com/tjfarrar/autostatsassessment/tree/main/folder) contains screencast demos of some online assessments created in R's [`exams`](https://r-exams.org) package and deployed to Blackboard Ultra  

A viewable version of the slides will be linked to from this README file soon.

Here is some R code that attendees are encouraged to run before the workshop to install some useful packages.

```
# Install useful R packages
install.packages(c("knitr", "tidyverse", "exams", "english", "rmarkdown", 
                   "rJava", "rjson", "readxl", "kableExtra", "MASS", 
                   "pracma", "tinytex", "berryFunctions", "rstudioapi",
                   "devtools", "mapdeck", "tth"), 
                 dependencies = TRUE)

# rJython (available from CRAN archive)
install.packages("https://cran.r-project.org/src/contrib/Archive/rJython/rJython_0.0-4.tar.gz")
# rSymPy (no longer available on CRAN)
devtools::install_github("FedericoComoglio/rSymPy")

# Install tinytex from tinytex R package
tinytex::install_tinytex()
```

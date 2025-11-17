
install.packages(c("knitr", "tidyverse", "exams", "english", "rmarkdown", 
                   "rJava", "rjson", "readxl", "kableExtra", "MASS", 
                   "pracma", "tinytex", "berryFunctions", "rstudioapi",
                   "devtools", "mapdeck", "tth"), 
                 dependencies = TRUE)

# Installing rSymPy (no longer available on CRAN)
install.packages("https://cran.r-project.org/src/contrib/Archive/rJython/rJython_0.0-4.tar.gz")
devtools::install_github("FedericoComoglio/rSymPy")

tinytex::install_tinytex()

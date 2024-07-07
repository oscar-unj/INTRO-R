# Rscript instalar.r
# Instalar una vez.
# 
# para actualizar el repositorio de cran
options(repos = c(CRAN = "https://cran.r-project.org")) 

install.packages("tidyverse")
install.packages("lubridate")
install.packages("caret")
install.packages("randomForest")
install.packages("e1071")
install.packages("ggplot2")
install.packages("conflicted")

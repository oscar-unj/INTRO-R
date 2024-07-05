# Rscript instalar.r
# instalar una sola vez.
# para actualizar el repositorio de cran
options(repos = c(CRAN = "https://cran.r-project.org")) 
install.packages("sf")
install.packages("purrr")
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("ggrepel")


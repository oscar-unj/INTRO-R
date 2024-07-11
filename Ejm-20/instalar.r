
# Rscript instalar.r
# para actualizar el repositorio de cran
options(repos = c(CRAN = "https://cran.r-project.org"))
# Instalamos las librerías necesarias
install.packages("readr")
install.packages("(neuralnet")
install.packages("caret")
install.packages("ggplot2")
install.packages("lattice")


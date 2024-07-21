
# Rscript instalar.r

# Instalación de librerías necesarias
# para actualizar el repositorio de cran
options(repos = c(CRAN = "https://cran.r-project.org")) 
install.packages("ggplot2")
install.packages("dplyr")
install.packages("reshape2")



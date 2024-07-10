# Rscript dos_variables.r

# Cargando libreria.
library(ggplot2)

# Lee datos del archivo .csv 
datos <- read.csv("salarios.csv")

# Gráfica  Años de Experiencia Vs. Remuneración
pdf(file="Dos_Variables.pdf")
ggplot(datos, 
       aes(x = Años.de.Dr, y = Remuneración) ) +
  geom_point() + 
  labs(title = "Salario Académico por años desde el Grado de Doctor")
 
# REFERENCIAS
# Oscar Núñez Mori. Jaén, 10-Jul-2024. Basado en:
# - Kabacoff. R. (s.f.) Modern Data Visualization with R. Chap. 6.
#   https://rkabacoff.github.io/datavis/Multivariate.html
#   https://github.com/Rkabacoff/datavis_support
# - Fox J. and Weisberg, S. (2011) An R Companion to Applied Regression, 2nd. Sage.
#   https://www.rdocumentation.org/packages/carData/versions/3.0-1/topics/Salaries



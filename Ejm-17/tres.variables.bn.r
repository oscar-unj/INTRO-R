# Rscript tres.variables.bn.r

# Cargando libreria.
library(ggplot2)

# Lee datos del archivo .csv 
datos <- read.csv("salarios.csv")

# Gráfica  Años de Experiencia Vs. Remuneración y el Color representando el Rango

pdf(file="Tres_Variables_ByN.pdf")

ggplot( datos, 
        aes(x = Años.de.Dr, 
	   y = Remuneración,
	   shape = Rango) ) +
  geom_point() + 
  labs(title = "Salario Académico por Rango y Años desde el Grado de Doctor")
 
# REFERENCIAS
# Oscar Núñez Mori. Jaén, 10-Jul-2024. Basado en:
# - Kabacoff. R. () Modern Data Visualization with R. Chap. 6.
#   https://rkabacoff.github.io/datavis/Multivariate.html
#   https://github.com/Rkabacoff/datavis_support
# - Fox J. and Weisberg, S. (2011) An R Companion to Applied Regression, 2nd. Sage.
#   https://www.rdocumentation.org/packages/carData/versions/3.0-1/topics/Salaries



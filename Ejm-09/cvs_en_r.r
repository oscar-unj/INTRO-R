
# Rscript cvs_en_r.r 
#
# Cargar librería necesaria
library(ggplot2)

# Leer archivo CSV
data <- read.csv("ventas_mensuales.csv")

# Crear gráfico de líneas
# Ajuste del mapeo estético con group = 1

ggplot(data, aes(x = Mes, y = Ventas, group = 1)) + 
  geom_line(color = "blue") +
  geom_point(color = "red") +
  labs(title = "Ventas Mensuales", x = "Mes", y = "Ventas") +
  theme_minimal()

# REFERENCIA
# OpenAI (2024). ChatGPT (Versión del 03 de Julio)
# [Genera Archivo CSV con Gráfico].
# https://chatgpt.com/share/bb7bd828-25d4-423c-8c2b-f488e1c5e727


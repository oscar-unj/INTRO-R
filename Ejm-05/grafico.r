# Rscript grafico.r
# Cargar la librería ggplot2
library(ggplot2)

# Usar el conjunto de datos mtcars
data(mtcars)

# Crear el gráfico de dispersión
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  labs(title = "Gráfico de Dispersión de mtcars",
       x = "Peso del Coche (1000 lbs)",
       y = "Millas por Galón (mpg)") +
  theme_minimal()

# REFERENCIA
# OpenAI. (2024). ChatGPT (Versión del 01 de Julio) 
# [Crear gráfico dispersión ggplot2].
# https://chatgpt.com/share/15c72434-85fe-4b47-8acd-d022bf9cb13e















# Rscript confiabilidad.r
library(dplyr)
library(ggplot2)
library(survival)
library(MASS)

# Leer los datos del archivo CSV
data <- read.csv("mantenimiento_industrial.csv")

# Ajustar el modelo Weibull utilizando la función survreg
# Supongamos que los fallos ocurren a intervalos de tiempo iguales
# Aquí, la variable tiempo de operación se utiliza como tiempo hasta fallo
weibull_fit <- survreg(Surv(Horas_de_operación, Fallos > 0) ~ 1, data = data, dist = "weibull")

# Extraer los parámetros de la distribución de Weibull
shape <- 1 / weibull_fit$scale
scale <- exp(coef(weibull_fit))

# Calcular la confiabilidad utilizando la distribución de Weibull
data <- data %>%
  mutate(Confiabilidad = pweibull(Horas_de_operación, shape = shape, scale = scale, lower.tail = FALSE))

# Generar la figura
ggplot(data, aes(x = Horas_de_operación, y = Confiabilidad, color = Tipo_mantenimiento)) +
  geom_point() +
  geom_smooth(method = "loess", se = FALSE) +
  labs(title = "Confiabilidad en el Mantenimiento Industrial usando Weibull",
       x = "Horas de Operación",
       y = "Confiabilidad") +
  theme_minimal()

# REFERENCIA
# OpenAI (2024). ChatGPT (Versión del 04 de Julio)
# [Confiabilidad en Mantenimiento Industrial]. 
# https://chatgpt.com/share/7bde6717-e8ae-4bad-b812-6b1044d9064e





# Rscript doe_100m.r
library(ggplot2)
library(dplyr)
library(dae)

set.seed(123)  # Para reproducibilidad

# Generar 100 muestras de voltaje y temperatura
voltajes <- sample(c(5, 10), 100, replace = TRUE)
temperaturas <- sample(c(25, 75), 100, replace = TRUE)

# Supongamos una función de ejemplo para la resistencia
# Resistencia = 100 + 2*Voltaje + 3*Temperatura + error aleatorio
resistencias <- 100 + 2 * voltajes + 3 * temperaturas + rnorm(100, mean = 0, sd = 10)

# Crear el dataframe con los datos generados
datos <- data.frame(
  Voltaje = factor(voltajes),
  Temperatura = factor(temperaturas),
  Resistencia = resistencias
)

# Resumen de los datos
print(head(datos))

# Análisis de varianza (ANOVA)
modelo <- aov(Resistencia ~ Voltaje * Temperatura, data = datos)
summary(modelo)

# Crear gráfica de interacción
interaction_plot <- ggplot(datos, aes(x = Voltaje, y = Resistencia, color = Temperatura, group = Temperatura)) +
  geom_line(stat = "summary", fun = mean) +
  geom_point(stat = "summary", fun = mean, size = 3) +
  labs(title = "Interacción entre Voltaje y Temperatura en la Resistencia",
       x = "Voltaje (V)",
       y = "Resistencia (Ω)") +
  theme_minimal()

pdf(file = "DOE_100_Muestras.pdf")

# Mostrar la gráfica
print(interaction_plot)


# Oscar Núñez Mori, Jaen 06-Julio-2024.
# Basado en:
# OpenAI (2024). ChatGPT (Versión 06 de Julio) [Análisis DOE Componentes Electrónicos]
# https://chatgpt.com/share/042129c2-8cc4-48c6-8dd5-e423ee2fa606





# Rscript doe_4m.r
library(ggplot2)
library(dplyr)
library(dae)

# 4 muestras
# Datos del experimento
datos <- data.frame(
  Voltaje     = factor(c(  5,     5,   10,   10)),
  Temperatura = factor(c( 25,    75,   25,   75)),
  Resistencia =        c(100,   150,  120,   200)
)

# Resumen de los datos
print(datos)

# Análisis de varianza (ANOVA)
modelo <- aov(Resistencia ~ Voltaje * Temperatura, data = datos)
summary(modelo)

# Crear gráfica de interacción
interaction_plot <- ggplot(datos, aes(x = Voltaje, y = Resistencia, color = Temperatura, group = Temperatura)) +
  geom_line() +
  geom_point(size = 3) +
  labs(title = "Interacción entre Voltaje y Temperatura en la Resistencia",
       x = "Voltaje (V)",
       y = "Resistencia (Ω)") +
  theme_minimal()

pdf(file = "DOE_4_Muestras.pdf")

# Mostrar la gráfica
print(interaction_plot)

# Oscar Núñez Mori, Jaen 06-Julio-2024.
# Basado en:
# OpenAI (2024). ChatGPT (Versión 06 de Julio) [Análisis DOE Componentes Electrónicos]
# https://chatgpt.com/share/042129c2-8cc4-48c6-8dd5-e423ee2fa606


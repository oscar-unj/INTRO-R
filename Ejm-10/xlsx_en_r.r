
# Rscript xlsx_en_r.r
#  cargar paquetes necesarios
library(xlsx)
library(ggplot2)
library(dplyr)

# Leer los datos del archivo .xlsx
# file_path <- "ruta/a/tu/archivo/temperaturas.xlsx

file_path <- "temperaturas.xlsx"

data <- read.xlsx(file_path, sheetIndex = 1)

# Agrupar las temperaturas en rangos
data <- data %>%
  mutate(Rango = cut(Temperatura, breaks = c(-Inf, 10, 15, 20, 25, 30, Inf), 
                     labels = c("<10", "10-15", "15-20", "20-25", "25-30", ">30")))

# Contar la cantidad de días en cada rango
counts <- data %>%
  group_by(Rango) %>%
  summarise(Conteo = n())

# Crear el gráfico de pastel
ggplot(counts, aes(x = "", y = Conteo, fill = Rango)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start = 0) +
  labs(title = "Distribución de Temperaturas Diarias",
       fill = "Rango de Temperatura") +
  theme_void()

# REFERENCIA
# OpenAI (2024). ChatGPT (Versión del 03 de Julio) 
# [Generate xlsx graph R].
# https://chatgpt.com/share/3e3fd78c-562d-4512-80c4-8d7b4810b9c6

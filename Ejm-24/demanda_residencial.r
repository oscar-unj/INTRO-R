# Rscript demanda_residencial.r

# Suprimir mensajes de advertencia al cargar las librerías
suppressPackageStartupMessages({
  library(ggplot2)
  library(dplyr)
  library(reshape2)
})

# Leer los datos del archivo .csv
datos <- read.csv("demanda_residencial.csv")

# Convertir la columna Fecha a tipo Date
datos$Fecha <- as.Date(datos$Fecha, format="%Y-%m-%d")

# Calcular estadísticas descriptivas
estadisticas <- datos %>%
  summarise(
    Consumo_Medio = mean(Consumo),
    Consumo_Mediana = median(Consumo),
    Consumo_SD = sd(Consumo),
    Consumo_Min = min(Consumo),
    Consumo_Max = max(Consumo),
    Consumo_Q1 = quantile(Consumo, 0.25),
    Consumo_Q3 = quantile(Consumo, 0.75),
    Precio_Medio = mean(Precio),
    Precio_Mediana = median(Precio),
    Precio_SD = sd(Precio),
    Precio_Min = min(Precio),
    Precio_Max = max(Precio),
    Precio_Q1 = quantile(Precio, 0.25),
    Precio_Q3 = quantile(Precio, 0.75),
    Temperatura_Media = mean(Temperatura),
    Temperatura_Mediana = median(Temperatura),
    Temperatura_SD = sd(Temperatura),
    Temperatura_Min = min(Temperatura),
    Temperatura_Max = max(Temperatura),
    Temperatura_Q1 = quantile(Temperatura, 0.25),
    Temperatura_Q3 = quantile(Temperatura, 0.75)
  )

# Imprimir estadísticas descriptivas
print(estadisticas)

# Generar gráficos

# Histograma de Consumo
histograma_consumo <- ggplot(datos, aes(x = Consumo)) +
  geom_histogram(binwidth = 10, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Histograma de Consumo", x = "Consumo (kWh)", y = "Frecuencia")

# Mostrar histograma de Consumo
print(histograma_consumo)

# Histograma de Precio
histograma_precio <- ggplot(datos, aes(x = Precio)) +
  geom_histogram(binwidth = 0.01, fill = "red", color = "black", alpha = 0.7) +
  labs(title = "Histograma de Precio", x = "Precio ($/kWh)", y = "Frecuencia")

# Mostrar histograma de Precio
print(histograma_precio)

# Histograma de Temperatura
histograma_temperatura <- ggplot(datos, aes(x = Temperatura)) +
  geom_histogram(binwidth = 1, fill = "green", color = "black", alpha = 0.7) +
  labs(title = "Histograma de Temperatura", x = "Temperatura (°C)", y = "Frecuencia")

# Mostrar histograma de Temperatura
print(histograma_temperatura)

# Boxplot de Consumo
boxplot_consumo <- ggplot(datos, aes(y = Consumo)) +
  geom_boxplot(fill = "blue", alpha = 0.7) +
  labs(title = "Boxplot de Consumo", y = "Consumo (kWh)")

# Mostrar Boxplot de Consumo
print(boxplot_consumo)

# Boxplot de Precio
boxplot_precio <- ggplot(datos, aes(y = Precio)) +
  geom_boxplot(fill = "red", alpha = 0.7) +
  labs(title = "Boxplot de Precio", y = "Precio ($/kWh)")

# Mostrar Boxplot de Precio
print(boxplot_precio)

# Boxplot de Temperatura
boxplot_temperatura <- ggplot(datos, aes(y = Temperatura)) +
  geom_boxplot(fill = "green", alpha = 0.7) +
  labs(title = "Boxplot de Temperatura", y = "Temperatura (°C)")

# Mostrar Boxplot de Temperatura
print(boxplot_temperatura)

# Calcular la matriz de correlación
correlacion <- cor(datos[, -1], use = "complete.obs")  # Excluir la columna Fecha

# Imprimir la matriz de correlación
print(correlacion)

# Convertir la matriz de correlación a un formato largo para ggplot
correlacion_melt <- melt(correlacion)

# Generar un heatmap de la matriz de correlación
heatmap_correlacion <- ggplot(correlacion_melt, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white",
                       midpoint = 0, limit = c(-1, 1), space = "Lab",
                       name="Correlación") +
  theme_minimal() +
  labs(title = "Matriz de Correlación", x = "", y = "") +
  theme(axis.text.x = element_text(angle = 45, vjust = 1,
                                   size = 12, hjust = 1),
        axis.text.y = element_text(size = 12))

# Mostrar el heatmap de la matriz de correlación
print(heatmap_correlacion)

# REFERENCIA
# OpenAI(2024). ChatGPT (Ver. 20 jul)[Demanda Residencial en R].
# https://chatgpt.com/share/a95f2051-3431-4d59-bd9f-5c029ba51df0


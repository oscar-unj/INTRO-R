# Rscript serie_temporal.r

# Instalar y cargar librerías
library(tidyverse)
library(lubridate)
library(forecast)
library(TSstudio)

# Leer archivo CSV
datos <- read.csv("mantenimiento.csv")

# Convertir la columna de fecha a formato de fecha
datos$Fecha <- ymd(datos$Fecha)

# Crear serie temporal
ts_datos <- ts(datos$Mantenimiento, start = c(2020, 1), frequency = 12)

# Visualizar la serie temporal
datos %>%
  ggplot(aes(x=Fecha, y=Mantenimiento)) +
  geom_line() +
  labs(title="Serie Temporal de Mantenimiento", x="Fecha", y="Mantenimiento") +
  theme_minimal()

# Descomposición de la serie temporal
descomposicion <- decompose(ts_datos)
plot(descomposicion)

# Ajustar modelo ARIMA y predicción
fit <- auto.arima(ts_datos)
summary(fit)

pred <- forecast(fit, h=12)
plot(pred)

# Estadísticas descriptivas
summary(datos$Mantenimiento)

# ACF y PACF
acf(ts_datos)
pacf(ts_datos)

# REFERENCIA
# OpenAI(2024). ChatGPT (Ver. 11 Jul.)[Analizar y predecir mantenimiento industrial]. 
# https://chatgpt.com/share/dd88b7ff-4755-4116-9de4-e0ed11e7d319


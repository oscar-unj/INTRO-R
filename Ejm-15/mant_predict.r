# Rscript mant_predict.r
# Cargar las librerías necesarias
library(conflicted)
library(tidyverse)
library(lubridate)
library(caret)
library(randomForest)
library(e1071)
library(ggplot2)

# Configurar conflicted para que los conflictos generen errores
conflicted::conflict_prefer("filter", "dplyr")
conflicted::conflict_prefer("lag", "dplyr")
conflicted::conflict_prefer("combine", "randomForest")

# Cargar los datos desde el archivo CSV, especificando los tipos de columnas
datos <- read_csv("datos_mantenimiento.csv", col_types = cols(
  fecha = col_character(),
  componente = col_character(),
  vibracion = col_double(),
  temperatura = col_double(),
  horas_operacion = col_integer(),
  fallo = col_integer()
))

# Verificar las primeras filas para ver el formato de las fechas
head(datos)

# Convertir la columna fecha a tipo DateTime usando parse_date_time que maneja diferentes formatos
datos <- datos %>%
  mutate(fecha = parse_date_time(fecha, orders = c("ymd_HMS", "ymd_HM", "ymd")),
         fallo = as.factor(fallo))  # Asegurar que 'fallo' sea un factor

# Eliminar filas con valores faltantes
datos <- datos %>%
  drop_na()

# Visualizar los primeros registros del dataset
head(datos)

# Análisis exploratorio de los datos

# Resumen estadístico de las variables
summary(datos)

# Gráfica de las vibraciones a lo largo del tiempo por componente
ggplot(datos, aes(x = fecha, y = vibracion, color = componente)) +
  geom_line() +
  labs(title = "Nivel de vibración a lo largo del tiempo por componente",
       x = "Fecha",
       y = "Vibración")

# Gráfica de la temperatura a lo largo del tiempo por componente
ggplot(datos, aes(x = fecha, y = temperatura, color = componente)) +
  geom_line() +
  labs(title = "Temperatura a lo largo del tiempo por componente",
       x = "Fecha",
       y = "Temperatura")

# Distribución de las horas de operación
ggplot(datos, aes(x = horas_operacion, fill = componente)) +
  geom_histogram(binwidth = 100, position = "dodge") +
  labs(title = "Distribución de las horas de operación",
       x = "Horas de operación",
       y = "Frecuencia")

# Proporción de fallos
ggplot(datos, aes(x = as.factor(fallo), fill = as.factor(fallo))) +
  geom_bar() +
  labs(title = "Proporción de fallos",
       x = "Fallo",
       y = "Frecuencia") +
  scale_fill_discrete(name = "Fallo", labels = c("No", "Sí"))

# Dividir los datos en conjunto de entrenamiento y prueba
set.seed(123)
train_index <- createDataPartition(datos$fallo, p = 0.8, list = FALSE)
datos_train <- datos[train_index, ]
datos_test <- datos[-train_index, ]

# Entrenar el modelo Random Forest
modelo_rf <- randomForest(fallo ~ vibracion + temperatura + horas_operacion, data = datos_train)

# Predicciones en el conjunto de prueba
predicciones <- predict(modelo_rf, datos_test)

# Asegurarse de que las predicciones sean factores con los mismos niveles que los datos de prueba
predicciones <- as.factor(predicciones)
levels(predicciones) <- levels(datos_test$fallo)

# Evaluar el modelo
confusion_matrix <- confusionMatrix(predicciones, datos_test$fallo)
print(confusion_matrix)

# Importancia de las variables
importancia <- varImpPlot(modelo_rf)
print(importancia)

# Visualización de la importancia de las variables
varImpPlot(modelo_rf, main = "Importancia de las variables")

# Gráfica de las predicciones vs datos reales
datos_test <- datos_test %>%
  mutate(prediccion = predicciones)

ggplot(datos_test, aes(x = fecha, y = as.numeric(prediccion), color = componente)) +
  geom_point(alpha = 0.7) +
  geom_point(aes(y = as.numeric(fallo)), shape = 4, alpha = 0.7, color = "red") +
  labs(title = "Predicciones de fallos vs Datos reales",
       x = "Fecha",
       y = "Predicción de fallo")

# Oscar Núñez Mori. 07-Julio-2024. Basado en:
# OpenAI(2024). ChatGPT (Ver. 07 Jul.)[Analisis de Mantenimiento Predictivo].
# https://chatgpt.com/share/4f970cfc-cba2-4ffb-a9c4-831aad595d9e


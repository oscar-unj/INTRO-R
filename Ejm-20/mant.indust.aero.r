# Rscript mant.indust.aero.r
# Ver. 11

# 1. Leer y preprocesar los datos

# Cargamos las librerías necesarias
library(readr)
library(neuralnet)
library(caret)

# Leemos el archivo CSV
data <- read_csv("aerogeneradores.csv", show_col_types = FALSE)

# Normalizamos los datos
preprocessParams <- preProcess(data[, -5], method = c("center", "scale"))
data_norm <- predict(preprocessParams, data)

# Convertimos la variable de mantenimiento a factor
data_norm$maintenance <- as.factor(data$maintenance)

# Dividimos los datos en entrenamiento y prueba
set.seed(123)
trainIndex <- createDataPartition(data_norm$maintenance, p = .8, list = FALSE)
trainData <- data_norm[trainIndex, ]
testData <- data_norm[-trainIndex, ]

cat("Dimensiones del conjunto de entrenamiento: ", dim(trainData), "\n")
cat("Dimensiones del conjunto de prueba: ", dim(testData), "\n")

# 2. Construir y entrenar la red neuronal

# Construimos el modelo de red neuronal
formula <- maintenance ~ wind_speed + temperature + humidity + vibration
nn <- neuralnet(formula, data = trainData, hidden = c(3), linear.output = FALSE, stepmax = 1e6)

# Visualizamos el modelo
plot(nn)

# 3. Evaluar el modelo

# Hacemos predicciones en el conjunto de prueba
nn_pred <- compute(nn, testData[, -5])
nn_pred <- nn_pred$net.result[, 1]  # Seleccionamos solo la primera columna de predicciones

# Convertimos las predicciones a etiquetas (0 o 1)
nn_pred_class <- ifelse(nn_pred > 0.5, 1, 0)

# Aseguramos que las dimensiones coincidan
cat("Longitud de nn_pred_class: ", length(nn_pred_class), "\n")
cat("Longitud de test_labels: ", length(testData$maintenance), "\n")

# Calculamos la precisión del modelo
conf_matrix <- confusionMatrix(factor(nn_pred_class), testData$maintenance)
print(conf_matrix)

# AUTOR
# OpenAI(2024). ChatGPT (Ver. 11 Jul.)[Red Neuronal para Mantenimiento]
# https://chatgpt.com/share/08fe17f7-4492-458e-9152-073effc86350


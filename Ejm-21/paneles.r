
# Rscript paneles.r
# Ver 10

# Cargar las librerías necesarias

library(h2o)
library(ggplot2)
library(gridExtra)
library(grid)

# Inicialización de H2O
h2o.init()

# Leer el archivo CSV y preprocesar los datos
data <- h2o.importFile("paneles_solares.csv")
data <- na.omit(data)

# Conversión de datos de H2OFrame a data.frame
data_frame <- as.data.frame(data)

# Revisión de las clases de las columnas y conversión si es necesario
# (asegurarse de que las columnas no sean tratadas incorrectamente como fechas)
for (col in names(data_frame)) {
  if (inherits(data_frame[[col]], "POSIXct") || inherits(data_frame[[col]], "POSIXlt")) {
    data_frame[[col]] <- as.character(data_frame[[col]])
  }
}

# División de los datos
set.seed(1234)
train_index <- sample(1:nrow(data_frame), 0.8 * nrow(data_frame))
train <- data_frame[train_index, ]
test <- data_frame[-train_index, ]

# Convertir data_frame de nuevo a H2OFrame para modelado
train_h2o <- as.h2o(train)
test_h2o <- as.h2o(test)

# Creación del modelo
model <- h2o.gbm(
  training_frame = train_h2o,
  validation_frame = test_h2o,
  x = c("temperatura", "radiacion_solar", "fallas"), # Variables predictoras
  y = "produccion_energia", # Variable objetivo
  ntrees = 50,
  max_depth = 5,
  learn_rate = 0.1
)

# Guardar el modelo en formato MOJO
h2o.saveModel(model, path = ".")

# Generar gráficos y guardarlos como PNG
# Ejemplo de gráfico con ggplot2
plot1 <- ggplot(data = data_frame, aes(x = temperatura, y = produccion_energia)) +
  geom_point() +
  labs(x = "Temperatura", y = "Producción de Energía") +
  ggtitle("Relación entre Temperatura y Producción de Energía")

# Ejemplo de otro gráfico
plot2 <- ggplot(data = data_frame, aes(x = radiacion_solar)) +
  geom_histogram(binwidth = 50) +
  labs(x = "Radiación Solar", y = "Frecuencia") +
  ggtitle("Distribución de la Radiación Solar")

# Crear el archivo PDF
pdf("reporte.pdf")

# Añadir el título y gráficos al PDF
grid.newpage()
pushViewport(viewport(layout = grid.layout(3, 1)))

print(plot1, vp = viewport(layout.pos.row = 1, layout.pos.col = 1))
print(plot2, vp = viewport(layout.pos.row = 2, layout.pos.col = 1))

# Añadir el resumen estadístico al PDF
summary_stats <- summary(data_frame)
summary_text <- capture.output(print(summary_stats))

grid.newpage()
pushViewport(viewport(layout = grid.layout(1, 1)))
grid.text(paste(summary_text, collapse = "\n"), y=unit(0.9, "npc"), just="top")

# Cerrar el archivo PDF
dev.off()

# Mensaje de confirmación
cat("Se ha generado el reporte en reporte.pdf\n")

# Referencia
# Oscar Núñez Mori. Jaén 11-Jul-2024. Basado en:
# - OpenAI (2024). ChatGPT (Ver. 11 Jul.)[Mantenimiento Industrial con H2O].
#   https://chatgpt.com/share/b208e0f3-f3e2-42c0-b4ad-059d79a4ed62



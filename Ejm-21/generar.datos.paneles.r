# Rscript generar.datos.paneles.r

# Generar datos ficticios
set.seed(123)
fecha <- seq.Date(from = as.Date("2023-01-01"), by = "day", length.out = 365)
temperatura <- round(runif(365, min = 15, max = 40), 1)
radiacion_solar <- round(runif(365, min = 100, max = 1000), 1)
produccion_energia <- round(temperatura * radiacion_solar / 100, 1)
fallas <- rpois(365, lambda = 0.2)

# Crear un data frame
datos_paneles_solares <- data.frame(
  fecha = fecha,
  temperatura = temperatura,
  radiacion_solar = radiacion_solar,
  produccion_energia = produccion_energia,
  fallas = fallas
)

# Guardar el data frame en un archivo CSV
write.csv(datos_paneles_solares, "paneles_solares.csv", row.names = FALSE)

# OpenAI (2024). ChatGPT (Ver. 11 Jul.) [Mantenimiento Industrial con H2O].
# https://chatgpt.com/share/b208e0f3-f3e2-42c0-b4ad-059d79a4ed62



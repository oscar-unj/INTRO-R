# Rscript generador.r
set.seed(123)

# Generamos datos simulados
n <- 1000
data <- data.frame(
  wind_speed = runif(n, min=0, max=25),       # Velocidad del viento
  temperature = runif(n, min=-20, max=40),    # Temperatura
  humidity = runif(n, min=0, max=100),        # Humedad
  vibration = runif(n, min=0, max=10),        # Vibración
  maintenance = sample(0:1, n, replace=TRUE)  # Necesidad de mantenimiento (0 = No, 1 = Sí)
)

# Guardamos los datos en un archivo CSV
write.csv(data, "aerogeneradores.csv", row.names = FALSE)


# Rscript rendimiento_motor.r

# Evaluar el rendimiento de motores eléctricos bajo diferentes 
# condiciones de carga mecánica, midiendo parámetros como la 
# eficiencia, la temperatura y la vibración

# Verificar si el paquete tidyverse está instalado y, si no, instalarlo
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}

# Cargar la librería tidyverse
library(tidyverse)


# Leer datos desde el archivo .csv
# columnas de datos_motor.cvs:
# Carga:       Porcentaje de la carga mecánica aplicada.
# Eficiencia:  Eficiencia del motor en porcentaje.
# Temperatura: Temperatura del motor en grados Celsius.
# Vibracion:   Nivel de vibración en mm/s.

datos <- read_csv("datos_motor.csv", show_col_types = FALSE)

# Visualización de los datos
# Gráfico de eficiencia vs carga
ggplot(datos, aes(x = Carga, y = Eficiencia)) +
  geom_point() +
  geom_line() +
  labs(title = "Eficiencia del Motor vs Carga Mecánica",
       x = "Carga Mecánica (%)",
       y = "Eficiencia (%)") +
  theme_minimal()

# Gráfico de temperatura vs carga
ggplot(datos, aes(x = Carga, y = Temperatura)) +
  geom_point() +
  geom_line() +
  labs(title = "Temperatura del Motor vs Carga Mecánica",
       x = "Carga Mecánica (%)",
       y = "Temperatura (°C)") +
  theme_minimal()

# Gráfico de vibración vs carga
ggplot(datos, aes(x = Carga, y = Vibracion)) +
  geom_point() +
  geom_line() +
  labs(title = "Vibración del Motor vs Carga Mecánica",
       x = "Carga Mecánica (%)",
       y = "Vibración (mm/s)") +
  theme_minimal()

# Oscar Núñez Mori. Jaén, 06-Julio-2024. Basado en:
# OpenAI(2024). ChatGPT (Versión de 06 de Julio)[Diseño Experimental en R]
# https://chatgpt.com/share/0b88fe3b-4737-4bb0-ab09-2032da4b5d2c



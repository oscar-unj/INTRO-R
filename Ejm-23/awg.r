# Rscript cable.r
# Parámetros de entrada
#
# corriente       <- 10     # Amperios
# longitud        <- 50     # Metros
# caida_tension   <- 3      # Caída de tensión permitida en %
# tension_sistema <- 48     # Tensión del sistema en Voltios

# Solicitar al usuario que ingrese la corriente
cat("Ingrese la corriente (Amp) : ")
corriente <- as.integer(readLines(con="stdin", n=1))

# Solicitar al usuario que ingrese la longitud
cat("Ingrese la longitud (Mts) : ")
longitud <- as.integer(readLines(con="stdin", n=1))

# Solicitar al usuario que ingrese la caida de tensión
cat("Ingrese la caida de tensión (%) : ")
caida_tension <- as.integer(readLines(con="stdin", n=1))

# Solicitar al usuario que ingrese la tensión del sistema
cat("Ingrese la tensión del sistema (Volt) : ")
tension_sistema <- as.integer(readLines(con="stdin", n=1))

# suprimiento los mensajes de advertecia
suppressPackageStartupMessages(library(dplyr))

# Función para calcular el diámetro del cable
calcular_diametro_cable <- function(corriente, longitud, caida_tension, tension_sistema) {
  # Resistencia específica del cobre (ohmios por metro)
  rho_cobre <- 1.68e-8
  
  # Caída de tensión en voltios
  caida_tension_voltios <- (caida_tension / 100) * tension_sistema
  
  # Calcular el área de la sección transversal (en mm^2)
  area_seccion <- (2 * rho_cobre * corriente * longitud * 1000) / caida_tension_voltios
  
  # Convertir el área de mm^2 a diámetro en mm (d = 2 * sqrt(area/pi))
  diametro <- 2 * sqrt(area_seccion / pi)
  
  return(diametro)
}

# Calcular el diámetro del cable
diametro <- calcular_diametro_cable(corriente, longitud, caida_tension, tension_sistema)
cat("El diámetro del cable debe ser de", round(diametro, 2), "mm\n")

# Tabla de calibres AWG y diámetros en mm
tabla_awg <- data.frame(
  AWG = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30),
  Diametro_mm = c(8.251, 7.348, 6.544, 5.827, 5.189, 4.621, 4.115, 3.665, 3.264, 2.906, 2.588, 2.305, 2.053, 1.828, 1.628, 1.450, 1.291, 1.150, 1.024, 0.9116, 0.8118, 0.7230, 0.6438, 0.5733, 0.5106, 0.4547, 0.4049, 0.3606, 0.3211, 0.2859, 0.2546 )
)

# Seleccionar el calibre adecuado basado en el diámetro calculado
calibre_adecuado <- tabla_awg %>% filter(Diametro_mm >= diametro) %>% arrange(Diametro_mm) %>% slice(1)

cat("------------------------------------------------------", "\n")

cat("El calibre AWG adecuado para el diámetro calculado es:", calibre_adecuado$AWG, "\n")
cat("Con un diámetro de:", calibre_adecuado$Diametro_mm, "mm\n")

# Oscar Núñez Mori, Jaén 16-Jul-2024. Basado en:
#  - OpenAI(2024). ChatGPT (Ver. 16 Jul.)[Calculo de Diametro de Cables].
#    https://chatgpt.com/share/830ed99c-690d-48e5-baf2-ab3e13a09e89

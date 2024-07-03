# Autor: Oscar Núñez Mori. Jaén 30-Jun-2024
# Adaptado de:
# - Parewa Labs (s.f). Concatenate Strings in R.  
#   https://www.programiz.com/r/examples/concatenate-two-strings
# - R Coder (2024). Print en R. https://r-coder.com/print-en-r/
#
# Rscript hola.r

system("cls")      # Windows
# system("clear")  # Linux

print("Estamos en Jaén")

# creando dos cadenas

cadena01 <- "¡BUENOS"
cadena02 <- "DÍAS CHICOS!"

# usando la función paste() para concadenar 2 cadenas

salida = paste(cadena01, cadena02)

print(salida, quote = FALSE)








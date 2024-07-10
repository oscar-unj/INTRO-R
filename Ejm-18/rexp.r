# Rscript rexp.r

# Generar 1000 valores de una distribución exponencial con una tasa de 1
valores <- rexp(1000, rate = 1)

# Crear un data frame con los valores generados
df <- data.frame(valores)

# Guardar el data frame en un archivo CSV
write.csv(df, "valores_exponenciales.csv", row.names = FALSE)

# Referencia
# OpenAI(2024). ChatGPT (Ver. 10 Jul.)[Generar valores exponenciales CSV].
# https://chatgpt.com/share/29c5e3a6-91a0-435e-8315-8169b6111e09


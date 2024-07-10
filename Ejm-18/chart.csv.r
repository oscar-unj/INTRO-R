
# Rscript chart.csv.r

# Datos
datos <- read.csv("valores_exponenciales.csv")

# Asegurarse de que 'datos' es un vector numérico
numerico <- as.numeric(datos$valores)

pdf(file="CSV_DosChart.pdf")

# Una fila, dos columnas
par(mfrow = c(1, 2))

# Los siguientes gráficos se combinarán
hist(numerico,    main = "a. Histograma")        # Izquierda
boxplot(numerico, main = "b. Diagrama de Caja")  # Derecha

# Oscar Núñez Mori. Jaén, 10-Jul-2024. Basado en:
#  - R Charts (2024). Combinar gráficos en R.
#    https://r-charts.com/es/r-base/combinar-graficos/
#  - OpenAI (2024). ChatGPT (Ver. 10 Jul.)[Generar valores exponenciales CSV].
#    https://chatgpt.com/share/29c5e3a6-91a0-435e-8315-8169b6111e09


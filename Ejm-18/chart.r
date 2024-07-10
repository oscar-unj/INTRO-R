
# Rscript chart.r

# Datos
x <- rexp(50)

pdf(file="DosChart.pdf")

# Una fila, dos columnas
par(mfrow = c(1, 2))

# Los siguientes gráficos se combinarán
hist(x, main = "Gráfico izquierda")  # Izquierda
boxplot(x, main = "Gráfico derecha") # Derecha

# Oscar Núñez Mori. Jaén, 10-Jul-2024. Basado en:
#  - R Charts (2024). Combinar gráficos en R.
#    https://r-charts.com/es/r-base/combinar-graficos/


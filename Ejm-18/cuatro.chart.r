
# Rscript cuatro.chart.r

# Datos
x <- rexp(50)

pdf(file="CuatroChart.pdf")

# Una fila, dos columnas
par(mfrow = c(2, 2))

# Los siguientes gráficos se combinarán
hist(x,              main = "a. Histograma ")     # Izquierda
boxplot(x,           main = "b. Diagrama Caja ")  # Derecha
plot(x,              main = "c. Gráfico")         # Abajo izquierda
pie(table(round(x)), main = "d. Circular")        # Abajo derecha


# Oscar Núñez Mori. Jaén, 10-Jul-2024. Basado en:
#  - R Charts (2024). Combinar gráficos en R.
#    https://r-charts.com/es/r-base/combinar-graficos/


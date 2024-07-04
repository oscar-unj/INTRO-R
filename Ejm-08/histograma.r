# Rscript histograma.r

# Distancia en yards que recorre una pelota de
# golf despues de ser golpeada

distancia <- c(241.1, 284.4, 220.2, 272.4, 271.1, 268.3,
               291.6, 241.6, 286.1, 285.9, 259.6, 299.6,
               253.1, 239.6, 277.8, 263.8, 267.2, 272.6,
               283.4, 234.5, 260.4, 264.2, 295.1, 276.4,
               263.1, 251.4, 264.0, 269.2, 281.0, 283.2)

# Histograma de Densidad

hist(distancia, prob = TRUE,
     main = "Histograma con curva normal", ylab = "Densidad")
x <- seq(min(distancia), max(distancia), length = 40)
f <- dnorm(x, mean = mean(distancia), sd = sd(distancia))
lines(x, f, col = "red", lwd = 2)

# REFERENCIA
# R Coder (2024). Histograma con curva normal.
# https://r-coder.com/histograma-r/



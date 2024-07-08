
# Rscript ai.r

# Red Neuronal Artificial desde cero en R

# Función de activación sigmoide
sigmoid <- function(x) {
  1 / (1 + exp(-x))
}

# Derivada de la función sigmoide
sigmoid_derivative <- function(x) {
  x * (1 - x)
}

# Función para entrenar la red neuronal
train <- function(X, y, epochs, learning_rate) {
  # Inicializar pesos aleatorios
  set.seed(42)
  weights1 <- matrix(runif(ncol(X) * 5), nrow = ncol(X), ncol = 5)
  weights2 <- matrix(runif(5 * 1), nrow = 5, ncol = 1)

  for (epoch in 1:epochs) {
    # Forward propagation
    layer1 <- sigmoid(X %*% weights1)
    output <- sigmoid(layer1 %*% weights2)

    # Cálculo del error
    error <- y - output
    d_output <- error * sigmoid_derivative(output)

    # Backpropagation
    error_layer1 <- d_output %*% t(weights2)
    d_layer1 <- error_layer1 * sigmoid_derivative(layer1)

    # Actualización de pesos
    weights2 <- weights2 + t(layer1) %*% d_output * learning_rate
    weights1 <- weights1 + t(X) %*% d_layer1 * learning_rate

    # Mostrar el error en cada época
    if (epoch %% 100 == 0) {
      cat("Epoch:", epoch, "Error:", mean(abs(error)), "\n")
    }
  }

  list(weights1 = weights1, weights2 = weights2, output = output)
}

# Datos de ejemplo
X <- matrix(c(0,0,1,1,0,1,0,1), nrow = 4, byrow = TRUE)
y <- matrix(c(0,1,1,0), nrow = 4, byrow = FALSE)

# Entrenar la red neuronal
result <- train(X, y, epochs = 10000, learning_rate = 0.1)

pdf("AI.pdf")

# Generar el gráfico
plot(y, type = "p", col = "red", ylim = c(0, 1), ylab = "Salida", xlab = "Ejemplos")
points(result$output, col = "blue")
legend("topright", legend = c("Deseado", "Predicho"), col = c("red", "blue"), pch = 1)

dev.off()

# REFERENCIA
# Oscar Núñez Mori. Jaén 08 de Julio de 2024. Basado en:
# - OpenAI (2024). ChatGPT (Ver. 08 Jul.) [Red Neuronal Simple en R].
#   https://chatgpt.com/share/f5665642-9b92-431b-bad9-7403ba1042a2


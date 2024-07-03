# Autor: OpenAI (2024). Chatgpt (Versíón de 30 Junio)
# [Calcular Fibonacci en R]
# https://chatgpt.com/share/4c6f50b8-ebbd-4aea-82ef-691609934165
# --------------------------------------------------------------
# Rscript fibonacci.r

# Función para calcular la serie de Fibonacci
fibonacci <- function(n) {
  if (n <= 0) {
    return(c())
  } else if (n == 1) {
    return(c(0))
  } else if (n == 2) {
    return(c(0, 1))
  } else {
    fib <- c(0, 1)
    for (i in 3:n) {
      fib <- c(fib, fib[i-1] + fib[i-2])
    }
    return(fib)
  }
}
# Solicitar al usuario que ingrese un número
cat("Ingrese un número entero positivo: ")
n <- as.integer(readLines(con="stdin", n=1))

# Validar la entrada del usuario
if (is.na(n) || n <= 0) {
  cat("Por favor, ingrese un número entero positivo.\n")
} else {
  # Calcular y mostrar la serie de Fibonacci
  resultado <- fibonacci(n)
  cat("Serie de Fibonacci hasta el", n, "es:\n")
  cat(resultado, sep = ", ")
}



# Rscript eda.r

# Exploratory Data Analysis = Análisis Exploratorio de Datos

# Librerias
library(tidyverse)
library(skimr)
library(GGally)
library(corrplot)

# Leer los datos
datos <- read.csv("reactor_mantenimiento.csv")

# Resumen básico
summary(datos)

# Resumen más detallado con skimr
skim(datos)

# Crear histogramas para todas las variables numéricas
datos %>%
  keep(is.numeric) %>%
  gather() %>%
  ggplot(aes(value)) +
  facet_wrap(~ key, scales = "free") +
  geom_histogram(bins = 30) +
  theme_minimal()

# Matriz de gráficos de dispersión para todas las variables numéricas
# Aumentar el umbral de cardinalidad
ggpairs(datos, cardinality_threshold = 200)


# Matriz de correlación
correlation_matrix <- cor(datos %>% select_if(is.numeric), use = "complete.obs")
corrplot(correlation_matrix, method = "circle")

# Boxplots para todas las variables numéricas agrupadas por una variable categórica (ejemplo: 'grupo')
if ("grupo" %in% colnames(datos)) {
  datos %>%
    gather(key = "variable", value = "valor", -grupo) %>%
    ggplot(aes(x = grupo, y = valor, fill = grupo)) +
    geom_boxplot() +
    facet_wrap(~ variable, scales = "free") +
    theme_minimal()
}

# Guardar un gráfico
ggsave("histogramas.png", plot = last_plot(), width = 10, height = 8)

# REFERENCIA
# OpenAI (2024). ChatGPT (Ver. 10 Jul.)[Exploración y visualización datos reactor].
# https://chatgpt.com/share/02f7c112-1015-4463-8055-69cc0bb37831


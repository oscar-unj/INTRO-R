
# Rscript grafico_densidad.r
library(ggplot2)
theme_set(theme_classic())

# Plot
g <- ggplot(mpg, aes(cty))
g + geom_density(aes(fill=factor(cyl)), alpha=0.8) + 
    labs(title="Gráfico de Densidad", 
         subtitle="Kilometraje de la ciudad agrupado por número de cilindros",
         caption="Fuente: mpg",
         x="Kilometraje de la Ciudad",
	 y="Densidad",
         fill="# Cilindros")

# Oscar NÚÑEZ Mori. Jaén 02 Julio de 2024.
# Adaptado de: Prabhakaran, S. (s.f.).  Density plot
# https://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html




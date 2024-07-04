# Rscript distribucion_uniforme.r

# Genera 10,000 numeros aleatorios
# de una distribución uniforme entre 0 y 1

valores <- runif(10000,0,1)

# Devuelve un resumen con el mínimo, primer cuartil, 
# mediana, promedio, tercer cuartil y máximo.

summary(valores)
# Genera su Histograma

hist( valores, main = "Histograma de Valores",
      ylab = "Frecuencia" )
 
# Oscar Núñez Mori, Jaén, 03-Julio-2024
# Adaptado de:
# Rodríguez, J. L. A. (2019). ¿Qué puede hacer el software 
# R para resolver tus problemas?  Revista Digital Universitaria 
# (RDU). (20) 3 mayo-junio. DOI:
# http://doi.org/10.22201/codeic.16076079e.2019.v20n3.a5




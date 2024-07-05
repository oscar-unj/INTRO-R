# Rscript peru.r
library(sf)
library(purrr)
library(tidyverse)
library(ggplot2)
library(ggrepel)

# Lee el shapefile y lo conviente en data frame
perusalem <- st_read("DEPARTAMENTOS.shp")

# Mapa de un Departamento
ggplot(data = perusalem %>%
       filter(DEPARTAMEN=="AMAZONAS")) +
  geom_sf(fill="green", color="red")


#Centroide: Podemos crear un punto al centro de cada unidad, 
# lo cual nos permitirá colocar el nombre de cada departamento
perusalem <- perusalem %>% mutate( centroid = map(geometry, st_centroid),
coords = map(centroid,st_coordinates),
coords_x = map_dbl(coords, 1), coords_y = map_dbl(coords, 2 ) )                                                                                                                                                     
#Mapa con etiquetas de departamentos
ggplot(data = perusalem) +
  geom_sf(fill="skyblue", color="red") + 
#Se inserta el nombre de cada departamento
  geom_text_repel(mapping = aes(coords_x, coords_y, label = DEPARTAMEN), size = 1.6)

# Oscar NÚÑEZ Mori. Jaén 04 de Julio 2024. Basado en:
# - Gob.pe (s.f.). Plataforma Nacional de Datos Abiertos. Limites Departamentales.
#      https://www.datosabiertos.gob.pe/dataset/limites-departamentales
# - Condor, R. M. (s.f.). Elaboración de Mapas con R.
#      https://rpubs.com/rcondor/619184
# - OpenAI (2024). ChatGPT (Versión del 04 de Julio) 
#      [Reading and resolving R issues].
#      https://chatgpt.com/share/efb65880-336e-4857-99ee-effdd9a3815e


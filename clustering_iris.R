# Cargar los datos desde la libreria faraway
library(faraway)
data("iris")

# Extraer las columnas de longitud y ancho de los pétalos
iris_petalo = iris[, 3:4]

# Visualizar
plot(iris_petalo, pch = 16, main = "Datos")

# Aplicamos el algoritmo (Hierarchical Clustering)
cluster = hclust(dist(iris_petalo))
cluster

# Mostramos el dendrograma del agrupamiento
plot(cluster, cex = 0.5)

# Altura máxima del dendrograma
cluster$height

# Dibujar una línea para indicar el corte en una altura de 3.6055513
abline(h = 3.6055513, col = "red")

# Visualizar la distribución de las alturas del dendrograma
plot(cluster$height, type = "l")

# Dividir los datos en 2 grupos utilizando el método de corte del arbol
etiquetas = cutree(cluster, k = 2)

# Visualizar los grupos
plot(iris_petalo, col = etiquetas, pch = 16, ylab = "Ancho del Pétalo", xlab = "Longitud del Pétalo")
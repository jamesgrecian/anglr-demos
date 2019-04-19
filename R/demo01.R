## a global DEM
data("gebco1", package = "anglr")
library(sf)
## North Carolina, the sf boilerplate polygon layer
nc <- read_sf(system.file("shape/nc.shp", package="sf"))


library(raster)
library(anglr)
library(silicate)

p_mesh <- DEL(nc, max_area = 0.002)
## a relief map, composed of triangles grouped by polygon with ##  interpolated raster elevation
p_mesh <- copy_down(p_mesh, z = gebco1)


## plot the scene
library(rgl)

rgl.clear()  ## rerun the cycle from clear to widget in browser contexts
plot3d(p_mesh)
bg3d("black"); material3d(specular = "black")
aspect3d(1, 1, .1)

fdemo1 <- file.path(getwd(), "demo01.html")

htmlwidgets::saveWidget(rglwidget(), fdemo1)

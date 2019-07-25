library(ceramic); library(quadmesh)
library(raster); library(rgl);
library(reproj); library(htmlwidgets)
clear3d()

## longlat extent, and local projection for the scene
ex0 <- c(147.15, 147.45, -42.9, -42.6)
ex <- extent(ex0)

## local LAEA projection, based on the centre of the extent
prj <- sprintf("+proj=laea +lon_0=%f +lat_0=% +datum=WGS84", mean(ex0[1:2]), mean(ex0[3:4]))
## Mapbox elevation
dem <- cc_elevation(ex, zoom = 8)
## Mapbox satellite imagery
im <- cc_location(ex, zoom = 13)

## quadmesh with texture for rgl, in local projection
qm <- reproj::reproj(quadmesh(dem, texture = im), prj)

## plot with rgl, set the aspect ratio and backround
shade3d(qm, lit = FALSE);
aspect3d(1, 1, .1)
bg3d(grey(0.8))

## this final line is only needed to bake the scene into HTML (i.e. if you on RStudio server)
#htmlwidgets::saveWidget(rglwidget(width = 1536, height = 1536), "ceramic-demo01.html")

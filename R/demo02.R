
## either form works
#c_mesh <- copy_down(TRI(nc), z = p_mesh$object$BIR74)
c_mesh <- copy_down(TRI(nc), z = "BIR74")
rgl.clear()
a <- plot3d(c_mesh)
bg3d("black"); material3d(specular = "black")
aspect3d(1, 1, .2)

fdemo <- file.path(getwd(), "demo02.html")
htmlwidgets::saveWidget(rglwidget(), fdemo)

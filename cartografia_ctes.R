#================================================================================
# GIS con R y Banco de Germoplasma *pisando los talones a GIS*
#=================================================================================
# File-Name:       CartografiaCorrientes.R
# Date:            29/09/2012
# Author:          Edwin Aguiar -INTA TICs Corrientes  Desarrollo y Bases de Datos
# Author:          Lic. Mgt Armando Taie - INTA TICs Corrientes - Mineria de Datos
# Email:           eaguiar@correo.inta.gov.ar / ataie@corrientes.inta.gov.ar                                     
# Data:            Banco de Germoplasma de Mani
# Author Data:     Ing Agr. Manuel O. Royo
#==================================================================================
#configuramos donde
setwd("D:/mapas/")

#Carga de librerias
library (sp)
library (RColorBrewer)
library (maptools)

# carga de mapa politico y datos

datos_manies<-read.csv("D:/mapas/corrientes/tabla.csv", sep=",")
cartografia<-readShapeSpatial("D:/mapas/corrientes/corrientes.shp")
# comprobamos si el mapa cargo, si aparece el grafico esta bien
# si no es asi hay que revisar las librerias y dependencias 
plot(cartografia)

# asignamos variables de mani al mapa
datos_manies$MANI
cartografia@data=data.frame(datos_manies$MANI)
# plotea cartografia con pcias con MANI
spplot(cartografia,c("datos_manies.MANI"),col.regions=brewer.pal(5, "RdYlBu"), scales=list(draw = TRUE))


# otro plot con escala de varios colores
spplot(cartografia, "datos_manies.MANI", col.regions=brewer.pal(11, "RdYlBu"),
       main=list(label="Manies en Corrientes"),res=88, par.settings = par)
# creacion e impresion de imagen JPEG
jpeg("Manies_Arg.jpeg", width=630, height=630,col="grey15")
par <- list(axis.line=list(col="transparent"),
            clip=list(panel="off"), par.main.text=list(col="black"), 
            axis.text=list(col="black"), fontsize=list(text=12))
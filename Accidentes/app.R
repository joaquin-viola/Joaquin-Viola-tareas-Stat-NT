#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
datos2019<-read.csv("fallecidos-nueva-2019.csv")
datos2018<-read.csv("datos-fallecidos-en-siniestros-de-trnsito-2018.csv")
datos2017<-read.csv("datos-fallecidos-en-siniestros-de-trnsito-2017.csv")
datos2016<-read.csv("datos-fallecidos-en-siniestros-de-trnsito-2016.csv")
datos2015<-read.csv("datos-fallecidos-en-siniestros-de-trnsito-2015.csv")
datos2014<-read.csv("datos-fallecidos-en-siniestros-de-trnsito-2014.csv")
datos2013<-read.csv("datos-fallecidos-en-siniestros-de-trnsito-2013.csv")
datos2019<-datos2019 %>% rename(Fecha.y.hora=Fechayhora,Tipo.de.Siniestro=TipodeSiniestro,Fallecido.a.los.Dias=FallecidoalosDias,Otro.vehiculo=Otrovehiculo,Lugar.del.Siniestro=LugardelSiniestro)
datosaños<-rbind(datos2013,datos2014,datos2015,datos2016,datos2017,datos2018,datos2019)

ui<-fluidPage(
    titlePanel("Accidentes de tránsito"),
    sidebarLayout(
        sidebarPanel(
    selectInput("var", 
                "Elegir variable", 
                c("Departamento", 
                  "Jurisdiccion.",
                  "Tipo.de.Siniestro",
                  "Vehiculo",
                  "Rol",
                  "Sexo"))),
    mainPanel("Grafico",plotOutput("graf"))))
server<-function(input,output){
   output$graf<-renderPlot( 
    ggplot(datosaños, aes(x=.data[[input$var]])) + geom_bar() + labs(y="Cantidad") + theme(axis.text.x=element_text(angle = 90)))
}
shinyApp(ui,server)

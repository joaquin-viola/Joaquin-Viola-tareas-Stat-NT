#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(here)
library(tidyverse)
library(DT)
propinas <- read_csv("propina.csv" )
ui <- fluidPage(
    titlePanel("Datos de Propina"),
    sidebarLayout(
        sidebarPanel(
            selectInput('varcolor', 'Variable en color',
                        c("sexo", "fuma", "dia", "momento") ) ),
mainPanel(
    tabsetPanel(
        tabPanel("Bivariado", plotOutput("scat"), DTOutput("tabla")),
        tabPanel("Univariado", plotOutput("barra"))
    )
)        
       ))

server <- function(input, output){
    output$scat <- renderPlot({
        ggplot(data = propinas,
               aes(x = total, y = propina,
                   colour = .data[[input$varcolor]] ))+
            geom_point() + theme(aspect.ratio = 1) +
            scale_x_continuous(name ="Total de la cuenta") +
            scale_y_continuous(name = "Propina")
    })
    output$tabla <- renderDT({
        propinas %>% group_by(.data[[input$varcolor]]) %>% summarise(media_prop = mean(propina), sd_propoina = sd(propina), media_total= mean(total), sd_total= sd(total))})
    output$barra <- renderPlot({
        ggplot(data=propinas, aes(x=.data[[input$varcolor]])) + geom_bar() + labs(y="Cantidad")
    })
    }
shinyApp(ui,server)

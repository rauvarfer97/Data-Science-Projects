library(dplyr) 
library(DT) 
library(ggplot2) 
library(plotly) 
library(leaflet) 
library(shiny) 
library(shinythemes) 
library(shiny)
library(TSA)
library(dygraphs)
library(DT)
library(cluster)
library(factoextra)
library(e1071)
library(terra)

data(mpg)
mpg$manufacturer=as.factor(mpg$manufacturer)
mpg$model=as.factor(mpg$model)

var_texto="Esta aplicación shiny tiene el objetivo de demostrar los conocimientos 
adquiridos en la construcción de un cuadro de mandos básico con R." 

var_texto_mitfm=" Mi TFM consiste en... " 

GDatasets=c('advertising.csv','datos_salarios.csv','datos_ordenadores.csv')

datos<-read.csv("advertising.csv")

names(datos)=c("Id","TVPubl","RadioPubl","PeriodicosPubl","Ventas") 

var_selec=c(2:length(datos)) 

GLugares <- c("Sevilla","Córdoba","Londres","Edimburgo", "Vaticano")

GLatLong <- data.frame(
  Lat = c(37.35945,37.886129,51.500818,55.95710112,41.90234465),
  Long = c(-5.98814,-4.867665,-0.124510,-3.187314305,12.4568083)
)

# fluidPage ----
ui = fluidPage( #o: shinyUI( 
  theme=shinythemes::shinytheme(theme="yeti"),
  #shinythemes::themeSelector(), 
  includeCSS("www/estilos.css"), 
  # titlePanel ----
  titlePanel(strong("Inteligencia de Negocio con R: DSBI", 
                    style="color:black;"), 
             windowTitle="Inteligencia de Negocio con R: DSBI"), 
  # navlistPanel ----
  navlistPanel(widths=c(3,9), 
               # tabPanel: Información ----
               tabPanel("Información",icon=icon("info"), 
                        div(class="center", 
                            img(src="portadashiny.png",height="200px"), 
                            img(src="hex_shiny.jpg",height="200px") 
                        ), 
                        br(),br(),br(), 
                        hr(), 
                        h3("Objetivo:",class="estiloh3"), 
                        var_texto, 
                        h3("Autor:",class="estiloh3"), 
                        strong("Raúl Varela Ferrando"), 
                        h3("Resumen de mi Trabajo Fin de Máster:",class="estiloh3"), 
                        var_texto_mitfm ), 
               # tabPanel: Datos ----
               tabPanel("Datos",icon=icon("database"),
                        # Primera fila de la página
                        fluidRow(column(width=4,
                                        fileInput('file1', 'Elige un fichero CSV',
                                                  multiple = FALSE,
                                                  accept = '.csv',
                                                  placeholder = 'Ningún fichero seleccionado')),
                                 column(width=2, offset = 1,
                                        checkboxInput('header', 'Cabecero',
                                                      value = TRUE)),
                                 column(width=4,
                                        radioButtons('sep', 'Separador',
                                                     choiceNames = c('Comma', 'Semicolon', 'Tab'),
                                                     choiceValues = c(',',';',' '),
                                                     selected = ',',
                                                     inline = TRUE))
                        ),
                        # Segunda fila de la página
                        fluidRow(column(width=12,selectInput('data', 'Selecciona un dataset', 
                                             choices = GDatasets, selected = GDatasets[1]))),
                        #Tabla
                        fluidRow(column(width=12,
                                        DT::dataTableOutput('tabla')))
               ),
               
               # tabPanel: Estudio descriptivo ----
               tabPanel("Estudio descriptivo",icon=icon("chart-bar"),
                        fluidRow(column(width=4, 
                                        selectInput('VarSelect01', 
                                                    'Selecciona una variable', 
                                                    choices = names(datos)[c(var_selec)],
                                                    selected = names(datos)[var_selec[1]])
                                        )
                                 ),
                        # tabsetPanel Unidimensional (elecciones)
                        tabsetPanel(
                          # Resumen Numerico
                          tabPanel('Resumen Numérico',
                                    verbatimTextOutput('OutResNum')
                          ),
                          tabPanel('Gráficos Unidimensionales',
                                   plotlyOutput('hist'),
                                   ),
                          tabPanel('Regresión Lineal',
                                   fluidRow(column(width=4,br(),
                                                   selectInput('VarSelectX', 
                                                               'Selecciona una variable independiente (X)', 
                                                               choices = names(datos)[c(var_selec)],
                                                               selected = names(datos)[var_selec[2]])),
                                     column(width=4,br(),
                                                   selectInput('VarSelectY', 
                                                               'Selecciona una variable dependiente (Y)', 
                                                               choices = names(datos)[c(var_selec)],
                                                               selected = names(datos)[var_selec[1]]))
                                            ),
                                   actionButton('boton_reg','Calcular Regresión',icon('calculator'))
                                            ,
                                   fluidRow(column(width=6, verbatimTextOutput('regprint')),
                                            column(width=6, plotOutput('reg'))
                                             )
                                   ),
                          tabPanel("Regresión Múltiple",
                                   fluidRow(
                                     column(width=6,br(),
                                            selectInput("VarSelectX2","Selecciona variable(s) independiente(s) (X)",
                                                               choices = names(datos)[c(var_selec)],
                                                               selected = names(datos)[var_selec[1]],
                                                               multiple=TRUE) 
                                     ),
                                     column(width=6,br(),
                                            selectInput("VarSelectY2","Selecciona variable dependiente (Y)",
                                                               choices = names(datos)[c(var_selec)],
                                                               selected = names(datos)[var_selec[2]]) 
                                     ) , 
                                   ), 
                                   actionButton("boton_regmult","Calcular Regresión", icon = icon("calculator")),
                                   fluidRow(column(6, verbatimTextOutput("multregprint")),
                                            column(6, plotOutput("multreg")))
                          )
                                   
                                   )
                          
                        ),
               
               # tabPanel: Coches
               tabPanel("Automóviles",icon = icon("car"),
                        fluidRow(
                          column(6,br(),
                                 selectInput('marca', 'Seleccione una marca:', 
                                             choices = levels(mpg$manufacturer),
                                             selected = levels(mpg$manufacturer)[1])
                          ),
                        ),
                        fluidRow(
                          column(6,br(),
                                 selectInput('cilindros', 'Número máximo de cilindros', 
                                             choices = c("4", "5", "6", "8"),
                                             selected = "4")
                          )
                        ),
                        fluidRow(
                          column(6,br(),
                                 sliderInput('motor', 'Cilindraje Máximo', 
                                             min = 16, max = 70, value = 25))
                          
                        ),
                        fluidRow(
                          column(6,br(),
                                 tableOutput("tabla_carros_output"))
                        )
               ),
               
               # tabPanel: Mapas ----
               tabPanel("Mapas",icon = icon("globe"),
                        fluidRow(
                          column(4, offset = 1,
                                 selectInput("PlaceSelect", "Selecciona Lugar de visita",
                                                    choices = GLugares), style = "color: grey"),
                          column(4, offset = 1,
                                 tags$ul(list(tags$li(p(tags$a("Como obtener latitud-longitud", 
                                                               href = "https://www.bufa.es/google-maps-latitud-longitud/", 
                                                               style="color: red; font-size: 14px;"))),        
                                              tags$li(p(tags$a("Como obtener latitud-longitud(youtube)", 
                                                               href = "https://www.bufa.es/google-maps-latitud-longitud/", 
                                                               style="color: red; font-size: 14px; margin-bottom: 80px;")))))),      
                          
                          leafletOutput("map")
                          
                        )
               ),
                        
               ),
               
               
  ) 


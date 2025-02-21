library(dplyr) 
library(DT) 
library(ggplot2) 
library(plotly) 
library(leaflet) 
library(shiny) 
library(shinythemes) 

function(input, output, session) {
  
  # tabPanel Datos ----
  GDatos=reactiveValues(
    datos=read.csv('advertising.csv'),
    Nombres = c("X","TV","radio","newspaper","sales"),
    var_selec = c(2:5)
  )
  
  # tabPanel Estudio Descriptivo ----
  
  observeEvent(input$data,{
    if (input$data=='advertising.csv') {
      GDatos$datos=read.csv('advertising.csv')
      GDatos$Nombres = colnames(GDatos$datos)
      GDatos$var_selec=c(2:length(GDatos$Nombres))
    }
    
    if (input$data=='datos_salarios.csv') {
      GDatos$datos=read.csv2('datos_salarios.csv')
      GDatos$Nombres = colnames(GDatos$datos)
      GDatos$var_selec=c(2:length(GDatos$Nombres))
    }
    
    if (input$data=='datos_ordenadores.csv') {
      GDatos$datos=read.csv('datos_ordenadores.csv')
      GDatos$Nombres = colnames(GDatos$datos)
      GDatos$var_selec=c(2:length(GDatos$Nombres))
    }
    
    updateSelectInput(session,'VarSelect01',"Selecciona una variable",
                             choices=GDatos$Nombres[GDatos$var_selec],
                             selected=GDatos$Nombres[GDatos$var_selec[1]])
    
    updateSelectInput(session,"VarSelectX","Selecciona variable independiente (X)",
                             choices=GDatos$Nombres[GDatos$var_selec],
                             selected=GDatos$Nombres[GDatos$var_selec[1]])
    
    updateSelectInput(session,"VarSelectY","Selecciona variable dependiente (Y)",
                            choices=GDatos$Nombres[GDatos$var_selec],
                            selected=GDatos$Nombres[GDatos$var_selec[2]])
    
    updateSelectInput(session,"VarSelectX2",
                      "Selecciona variable(s) independiente(s) (X)",
                      choices = GDatos$Nombres[GDatos$var_selec],
                      selected = GDatos$Nombres[GDatos$var_selec[1]])
    
    updateSelectInput(session,"VarSelectY2",
                             "Selecciona variable dependiente (Y)",
                             choices = GDatos$Nombres[GDatos$var_selec],
                             selected = GDatos$Nombres[GDatos$var_selec[2]])
  
    
  })
  
  
##### Ficheros subidos
  
  observeEvent(input$file1, {
    df = read.csv(input$file1$datapath, header = input$header, sep = input$sep)
    write.csv(df, file = "nuevos_datos.csv")
    GDatasets <<- c("advertising.csv", "datos_salarios.csv", 
                    "datos_ordenadores.csv", "nuevos_datos.csv")
    
    GDatos$datos = read.csv(GDatasets[4]) 
    GDatos$Nombres  = colnames(GDatos$datos) 
    GDatos$var_selec = 3:length(GDatos$Nombres)
    
    updateSelectInput(session, "data", "Selecciona un dataset",
                             choices = GDatasets, selected = GDatasets[4])
  })
  
##### Tabla datos
  
  output$tabla <- renderDataTable({
    datatable(
      GDatos$datos, class = 'cell-border stripe',
      extensions = c('Buttons', "ColReorder"), filter = "bottom",
      options = list(
        dom = 'lBfrtip', colReorder = TRUE,
        lengthMenu = list(c(15, 30, 50, 200), c('15', '30', '50', '200')),
        pageLength = 15, buttons = c('copy', 'csv', 'excel', 'pdf'),
        background = TRUE, language = list(search = "Filtrar:")
        
      )
      
    )
  })
  
  
##### Estudio Descriptivo
  
  datos_1 = eventReactive(input$VarSelect01, {
    dft=GDatos$datos
    cual=which(GDatos$Nombres %in% input$VarSelect01)
    data.frame(varX=dft[,cual])
  })
  
  # Resumen numérico
  
  output$OutResNum = renderPrint({
    req(input$VarSelect01)
    df = datos_1()
    if(is.numeric(df$varX)) {
      cat(paste("Variable = ", input$VarSelect01, "\n\n"))
      summary(df$varX) 
    } else {
      cat("Selecciona variables numéricas.")
    }
    
  })
  
  # Gráficos unidimensionales
  
  output$hist <- renderPlotly({
    req(input$VarSelect01)
    df = datos_1()
    if (is.numeric(df$varX)) {
      ggplotly(
        ggplot(df$dft, aes(x = df$varX)) + 
          ggtitle(paste("Histograma de", input$VarSelect01)) + 
          geom_histogram(fill = "blue", bins = 10, color = "white") +
          xlab(input$VarSelect01) + 
          ylab("Freq")
      )
    } else {
      ggplotly(
        ggplot(df$dft, aes(x = df$varX)) + 
          ggtitle(paste("Diagrama de barras de", input$VarSelect01)) + 
          geom_bar(fill = "darkgreen", color = "white") + 
          xlab(input$VarSelect01)+
          ylab("Freq")
        )
    }
  })

##### Regresion Lineal
  
  modelo<-eventReactive(input$boton_reg, {
    dft = GDatos$datos
    var_Y = input$VarSelectY
    var_X = input$VarSelectX
    sformula = paste0(var_Y, "~", var_X)
    mod <- lm(formula = sformula, data = dft)
    mod
  })
  
  datos_2 = eventReactive(input$VarSelectY, {
    dft = GDatos$datos
    cual = which( GDatos$Nombres %in% input$VarSelectY )
    data.frame(
      varX = dft[,cual]
    )
  })
  
  output$regprint <- renderPrint({
    req(input$VarSelectY)
    req(input$boton_reg)
    datt = datos_2()
    if(is.numeric(datt$varX)) {
      summary(modelo())
    } else {
      stop("Selecciona variables numéricas.")
    }
    
  })
  
##### Grafico nube de puntos
  nube = eventReactive(input$boton_reg, {
    dft <- GDatos$datos
    var_Y <- input$VarSelectY
    var_X <- input$VarSelectX
    ggplot(dft, aes(x = .data[[var_X]], y = .data[[var_Y]])) +
      geom_point() +
      labs(x = var_X, y = var_Y, title = "Gráfico de Dispersión")
  })
  
  output$reg <- renderPlot({
    nube()
  })

  
##### Regresión Múltiple
  multreg <-eventReactive(input$boton_regmult, {
    dft_m = GDatos$datos
    var_Y = input$VarSelectY2
    var_X = input$VarSelectX2
    sformula_m = paste0(var_Y, "~", paste(var_X, collapse = "+"))
    mod_m <- lm(formula = sformula_m, data = dft_m)
    mod_m
  })
  
  
  datos_3 = eventReactive(input$VarSelectY2, {
    dft = GDatos$datos
    cual = which( GDatos$Nombres %in% input$VarSelectY2 )
    data.frame(
      varX = dft[,cual]
    )
  })
  
  
  output$multregprint <- renderPrint({
    req(input$VarSelectY2)
    req(input$boton_regmult)
    datt1 = datos_3()
    if(is.numeric(datt1$varX)) {
      summary(multreg())
    } else {
      stop("Selecciona variables numéricas.")
    }
    
  })
  
  output$multreg <- renderPlot({
    datt2 = datos_3()
    req(input$boton_regmult)
    if (is.numeric(datt2$varX)){
      plot(multreg())
    } else {
      stop("Selecciona variables numéricas.")
    }
  })
  

##### Automóviles
  tabla_carros = function(){
    tabla_carros = mpg %>% 
      mutate(cilindraje = displ*10) %>%
      filter(manufacturer == input$marca) %>%
      filter(cyl <= input$cilindros) %>% 
      filter(cilindraje <= input$motor)
  }
  output$tabla_carros_output <- renderTable({
    tabla_carros()
  })
  
##### Mapa  
  output$map <- renderLeaflet({
    cual = which(input$PlaceSelect==c("Sevilla","Córdoba","Londres","Edimburgo","Vaticano")) 
    LAT = c(37.35945,37.886129,51.500818,55.95710112,41.90234465)[cual]
    LONG = c(-5.98814,-4.867665,-0.124510,-3.187314305,12.4568083)[cual]
    ZOOM=18
    leaflet() %>%
      setView(lng=LONG, lat=LAT, zoom=ZOOM ) %>%
      addProviderTiles("OpenStreetMap.Mapnik")
  })
  
  
}

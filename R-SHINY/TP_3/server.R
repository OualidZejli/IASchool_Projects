#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  output$distPlot <- renderAmCharts({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, input$rb]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    amHist(x, breaks = bins, col = input$color, border = 'white', main = input$titre)
    
  })
  output$box <- renderAmCharts({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, input$rb]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    amBoxplot(x, breaks = bins, col = input$color, border = 'white', main = input$titre)
    
  })
  
  observeEvent(input$go, {
    updateTabsetPanel(session, inputId = "viz", selected = "Histogramme")
  })
  
  
  
  output$summary <- renderPrint({
    summary(faithful)
  })
  output$table<-renderDataTable(faithful)
  output$nbr<-renderText(paste("le nombre de bins :", input$bins))
  
  
})

#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(colourpicker)
# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Premiers pas avec shiny"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
           # selectInput(inputId = "color", label = "Couleur :",
            #            choices = c("Rouge" = "red", "Vert" = "green", "Bleu" = "blue")),
           colourInput(inputId="color", label = "Couleur",
                       value = "red",
                       showColour = c("both", "text", "background"),
                       palette = c("square", "limited")),
           
            textInput(inputId = "titre", label = h3("Le titre l'histogramme : "), value="Entrer le titre"),
            radioButtons(inputId = "rb", label = "Choix Colonnes", choices = colnames(faithful))
            
            
            
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            h1(textOutput("nbr"), align="center"),
            verbatimTextOutput("summary"),
            dataTableOutput(outputId="table")
            
        )
    )
))

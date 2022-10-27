library(shiny)

ui<-navbarPage(title = "Visualisation des donnees",
               tabPanel("Data", navlistPanel(
                 "Les donnees",
                 tabPanel("Table", dataTableOutput(outputId="table")),
                 tabPanel("Summary", verbatimTextOutput("summary"))
               )),
               
               tabPanel("Visualisation", fluidRow(
                 column(width = 3, sliderInput("bins",
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
                 ), # colonne 1/4 (3/12)
                 column(width = 9, tabsetPanel(
                   tabPanel("Histogramme",  plotOutput("distPlot"),
                            h1(textOutput("nbr"), align="center")),
                   tabPanel("BoxPlot", plotOutput("box"))
                 )
                        
                        
                        
                        
                        
                        
                        
                       ) # colonne 3/4 (9/12)
               )
                      
                        
                        
                        
                        )
               
               
               
               
               
               
          
               
               
               
               
               
               
)
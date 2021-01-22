# This is my app!

library(tidyverse)
library(shiny)

ui <- fluidPage(

  navbarPage("THIS IS MY TITLE!",
             tabPanel("Thing 1",
                      sidebarLayout(
                        sidebarPanel("WIDGETS!",
                                     checkboxGroupInput(inputId = "pick_species",
                                                        label = "Choose species:",
                                                        choices = unique(starwars$species))
                                     ),
                        mainPanel("OUTPUT!")
                      )
                      ),
             tabPanel("Thing 2"),
             tabPanel("Thing 3")

  )

)

server <- function(input, output) {

  sw_reactive <- reactive({

    starwars %>%
      filter(species %in% input$pick_species)

  })

}

shinyApp(ui = ui, server = server)

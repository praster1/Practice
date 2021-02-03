library(shiny)

numberDisplayUI <- function(Id ) {
    ns <- NS(Id)
    tagList(
        sliderInput(ns("inputNum"), "Select Number:", min = 1, max = 100, value = 50),
        textOutput(ns("outputNum"))
    )
}

numberDisplay <- function(input, output, session) {
    output$outputNum <- renderText({
        input$inputNum
    })
}

ui <- fluidPage(
    numberDisplayUI("firstId")
)

server <- function(input, output) {
    callModule(numberDisplay, "firstId")
}
shinyApp(ui, server)

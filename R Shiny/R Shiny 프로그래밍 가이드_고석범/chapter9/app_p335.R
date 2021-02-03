library(shiny)

numberDisplayUI <- function(Id, label) {
    ns <- NS(Id)
    tagList(
        sliderInput(ns("inputNum"), label, min = 1, max = 100, value = 50),
        textOutput(ns("outputNum"))
    )
}

numberDisplay <- function(input, output, session) {
    output$outputNum <- renderText({
        input$inputNum
    })
}

ui <- fluidPage(
    numberDisplayUI("firstId", label = "첫 번째 숫자 선택"),
    numberDisplayUI("secondId", label = "두 번재 숫자 선택")
)

server <- function(input, output) {
    callModule(numberDisplay, "firstId")
    callModule(numberDisplay, "secondId")
}
shinyApp(ui, server)

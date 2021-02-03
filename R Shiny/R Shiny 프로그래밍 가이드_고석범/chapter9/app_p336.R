numberDisplayUI <- function(Id, label) {
    ns <- NS(Id)
    tagList(
        sliderInput(ns("inputNum"), label, min = 1, max = 100, value = 50),
        textOutput(ns("outputNum"))
    )
}

numberDisplay <- function(input, output, session, outputLabel) {
    output$outputNum <- renderText({
        paste(outputLabel, ":" , input$inputNum)
    })
}

ui <- fluidPage(
    numberDisplayUI("firstId", label = "첫 번째 값 선택"),
    numberDisplayUI("secondId", label = "두 번째 값 선택"),
    textOutput("value")
)

server <- function(input, output) {
    callModule(numberDisplay, "firstId", outputLabel = "첫 번째 선택된 값")
    callModule(numberDisplay, "secondId", outputLabel = "두 번째 선택된 값")
}

shinyApp(ui, server)

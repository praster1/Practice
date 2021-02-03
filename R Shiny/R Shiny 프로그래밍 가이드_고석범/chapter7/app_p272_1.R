library(shiny)
ui <- fluidPage(
    sliderInput("controller", "Controller", 0, 20, 10),
    textInput("inText", "Input text"),
    textInput("inText2", "Input text 2")
)

server <- function(input, output, session) {
    observe({
        x <- input$controller

        updateTextInput(session, "inText", value = paste("New text", x))

        updateTextInput(session, "inText2",
                        label = paste("New label", x),
                        value = paste("New text", x))
    })
}

shinyApp(ui, server)

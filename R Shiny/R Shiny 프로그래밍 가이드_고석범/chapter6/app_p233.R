library(shiny)

ui <- fluidPage(
    actionButton("rmv", "Remove UI"),
    textInput("txt", "This is no longer useful")
)

server <- function(input, output, session) {
    observeEvent(input$rmv, {
        removeUI(
            selector = "div:has(> #txt)"
        )
    })
}

shinyApp(ui, server)

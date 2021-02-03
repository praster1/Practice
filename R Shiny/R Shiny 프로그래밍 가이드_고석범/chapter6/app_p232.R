library(shiny)

ui <- fluidPage(
    actionButton("add", "Add UI")
)

server <- function(input, output, session) {
    observeEvent(input$add, {
        insertUI(
            selector = "#add",
            where = "afterEnd",
            ui = textInput(paste0("txt", input$add),
                           "Insert some text")
        )
    })
}

shinyApp(ui, server)

library(shiny)
ui <- fluidPage(
    sliderInput("Num", "Number", value = 1, min = 0, max =10),
    verbatimTextOutput("txt")
)

server <- function(input, output, session) {
    observe({
        query <- paste0("?Number=", input$Num)
        updateQueryString(query, mode ="push")
    })

    output$txt <- renderPrint({
        getQueryString()
    })
}

shinyApp(ui, server)

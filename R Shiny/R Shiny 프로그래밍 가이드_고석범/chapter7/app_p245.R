library(shiny)
myData <- mtcars

ui <- fluidPage(
    numericInput("sel", "mtcars 데이터 행의 개수 입력",
                 value = 6, min = 6, max = nrow(mtcars)),
    tableOutput("carData")

)

server <- function(input, output, session){
    output$carData <- renderTable({
        head(myData, input$sel)
    })

    tryCatch({
        x <- input$sel
    }, error = function(c) cat(c$message))

}

shinyApp(ui, server)

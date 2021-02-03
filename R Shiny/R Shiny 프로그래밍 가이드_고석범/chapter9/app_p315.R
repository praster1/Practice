# 폴더에 있는 mtcars.csv 파일을 사용하여 연습

library(shiny)

ui <- fluidPage(
    fileInput("selFile", "파일선택", buttonLabel = "파일선택"),
    tableOutput("tbl")
)

server <- function(input, output, session) {
    output$tbl <- renderTable({
        req(input$selFile)
        read.csv(input$selFile$datapath)
    })
}

shinyApp(ui, server)

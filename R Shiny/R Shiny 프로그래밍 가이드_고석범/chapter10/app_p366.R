# RStudio 편집창에서 Source 버튼을 클릭해서 실행

library(shiny)

myData <- mtcars
ui <- fluidPage(
    actionButton("done", "완료"),
    verbatimTextOutput("txt")
)

server <- function(input, output, session) {
    output$txt <- renderPrint({
        head(myData)
    })
    observeEvent(input$done, {
        k <- lapply(myData, class)
        stopApp(k)
    })
}

runGadget(shinyApp(ui, server))

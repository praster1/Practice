# RStudio 편집창에서 Source 버튼을 클릭해서 실행
# 그런 다음 R 콘솔에서 myG(mtcars)로 연습

library(shiny)

myG <- function(myData) {
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
}

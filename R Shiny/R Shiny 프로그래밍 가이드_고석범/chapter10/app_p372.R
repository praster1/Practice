# RStudio에서 Source 버튼을 클리하여 실행한 다음 R 콘솔에서 다음을 실행
#  myG(mtcars)
library(shiny)
library(miniUI)

myG <- function(myData) {
    ui <- miniPage(
        gadgetTitleBar("연습장"),
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

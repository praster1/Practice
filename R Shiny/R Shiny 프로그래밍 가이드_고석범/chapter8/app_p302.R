# RStudio 편집창에서 Source 버튼을 클릭하여 실행
shinyApp(
    ui = fluidPage(
        actionButton("show", "Show")
    ),
    server = function(input, output) {
        observeEvent(input$show, {
            showNotification("This is a notification.")
        })
    }
)

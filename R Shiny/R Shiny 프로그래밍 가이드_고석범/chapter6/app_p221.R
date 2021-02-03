#  이 앱은 shinyApp() 함수에 샤이니 코드가 들어 있어서,
# RStudio 편집창에서 Source 버튼을 클릭해서 실행한다.

shinyApp(

    ui = fluidPage(
        fluidRow(
            column(12,
                   dataTableOutput('table')
            )
        )
    ),

    server = function(input, output) {
        output $ table <- renderDataTable(iris,
                                          options = list(
                                              pageLength = 5,
                                              initComplete = I("function(settings, json) {alert('Done.');}")
                                          )
        )
    }
)

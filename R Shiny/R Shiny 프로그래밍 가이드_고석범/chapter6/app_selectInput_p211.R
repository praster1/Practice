library(shiny)

ui <- fluidPage(

    # 입출력 위젯
    selectInput("sel", "다음에서 선택:",
                choices = c("초급", "중급", "고급"))

)

server <- function(input, output, session) {

    # 서버 코드

}

shinyApp(ui, server)

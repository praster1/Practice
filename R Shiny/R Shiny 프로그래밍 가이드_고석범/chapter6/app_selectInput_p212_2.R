library(shiny)

ui <- fluidPage(

    # 입출력 위젯
    selectInput("sel", "다음에서 선택:",
                choices = list(
                    "컴파일러 언어" = c("C++", "Java"),
                    "스크립트 언어" = c("R", "JavaScript", "Python")
                ))

)

server <- function(input, output, session) {

    # 서버 코드

}

shinyApp(ui, server)

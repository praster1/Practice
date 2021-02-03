library(shiny)

ui <- fluidPage(
    dateRangeInput("date", "날짜 선택",
                   start = Sys.Date(),
                   end = Sys.Date() + 30,
                   language = "ko")
)

server <- function(input, output, session) {

    # 서버 코드

}

shinyApp(ui, server)

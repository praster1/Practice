library(shiny)
ui <- function(request) {
    fluidPage(
        sliderInput("slider", "Add a value:", 0, 100, 0),
        h4("Sum of all previous slider values: "),
        verbatimTextOutput("sum"),
        bookmarkButton()
    )
}

server <- function(input, output) {
    vals <- reactiveValues(s = 0)
    observe({
        vals$s <- isolate(vals$s) + input$slider
    })
    output$sum <- renderText({
        vals$s
    })

    ## 북마킹 직전, 값 저장
    onBookmark(function(state) {
        state$values$s <- vals$s
    })

    ## 복원 직전, 값 읽기
    onRestore(function(state) {
        vals$s <- state$values$s
    })
}

shinyApp(ui, server, enableBookmarking = "url")

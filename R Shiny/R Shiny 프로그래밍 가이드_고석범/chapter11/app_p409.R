# RStudio에서 Source 버튼을 클릭하여 실행
shinyApp(
    ui = fluidPage(
        inlineCSS("#big { font-size:30px; }
                  .red { color: red; border: 1px solid black;}"),
        p(id = "big", "This will be big"),
        p(class = "red", "This will be red and bordered")
        ),
    server = function(input, output) {}
)

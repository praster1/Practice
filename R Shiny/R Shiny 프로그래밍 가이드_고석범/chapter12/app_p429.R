library(shiny)
ui <- function(request) {
    fluidPage(
        tabsetPanel(id = "tabs",
                    tabPanel("One",
                             checkboxInput("chk1", "Checkbox 1"),
                             bookmarkButton(id = "bookmark1")
                    ),
                    tabPanel("Two",
                             checkboxInput("chk2", "Checkbox 2"),
                             bookmarkButton(id = "bookmark2")
                    )
        )
    )
}
server <- function(input, output, session) {
    # Need to exclude the buttons from themselves being bookmarked
    setBookmarkExclude(c("bookmark1", "bookmark2"))

    # Trigger bookmarking with either button
    observeEvent(input$bookmark1, {
        session$doBookmark()
    })
    observeEvent(input$bookmark2, {
        session$doBookmark()
    })
}
shinyApp(ui, server, enableBookmarking = "url")

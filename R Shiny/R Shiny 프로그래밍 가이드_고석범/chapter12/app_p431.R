library(shiny)
ui <- function(req) {
    fluidPage(
        textInput("txt", "Input text"),
        bookmarkButton()
    )
}
server <- function(input, output) {
    onBookmark(function(state) {
        savedTime <- as.character(Sys.time())
        cat("Last saved at", savedTime, "\n")
        # state is a mutable reference object, and we can add arbitrary values to
        # it.
        state$values$time <- savedTime
    })

    onRestore(function(state) {
        cat("Restoring from state bookmarked at", state$values$time, "\n")
    })
}
enableBookmarking("url")
shinyApp(ui, server)

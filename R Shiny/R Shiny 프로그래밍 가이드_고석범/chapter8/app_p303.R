# RStudio 편집창에서 Source 버튼을 클릭하여 실행

shinyApp(
    ui = fluidPage(
        actionButton("show", "Show"),
        actionButton("remove", "Remove")
    ),
    server = function(input, output) {
        # A queue of notification IDs
        ids <- character(0)
        # A counter
        n <- 0

        observeEvent(input$show, {
            # Save the ID for removal later
            id <- showNotification(paste("Message", n), duration = NULL)
            ids <<- c(ids, id)
            n <<- n + 1
        })

        observeEvent(input$remove, {
            if (length(ids) > 0)
                removeNotification(ids[1])
            ids <<- ids[-1]
        })
    }
)

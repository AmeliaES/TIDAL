#' Shiny module - Selecting and reading in the dataset
#'
#' @noRd
#' @keywords internal
#' @export
selectDataServer <- function(id, dataFormatted) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      ns <- NS(id)

      data <- reactive({
        req(input$select)
        if (input$select == "Upload a long format dataset"){
          output$uploadFile <- renderUI({
            fileInput(ns("Upload a long format dataset"), NULL)
          })
          req(input$`Upload a long format dataset`)
          # data <- data.frame("test" = c(1,2,3))
          data <- fread(input$`Upload a long format dataset`$datapath)
        }
        else {
          output$uploadFile <- renderUI({
          })
          data <- dataFormatted()
        }
      })

      return(data)
    }
  )
}
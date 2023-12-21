#' dbBody UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_dbBody_ui <- function(id){
  ns <- NS(id)
  dashboardBody(
    mod_dbBodyStyle_ui("dbBodyStyle_1"),
    tabItems(
      mod_tabData_ui("tabData_1"),
      mod_tabSummary_ui("tabSummary_1"),
      mod_tabQuanti_ui("tabQuanti_1"),
      mod_tabQuali_ui("tabQuali_1"),
      mod_tabQuantiQuali_ui("tabQuantiQuali_1"),
      mod_tabPredict_ui("tabPredict_1")
    )
  )
}

#' dbBody Server Functions
#'
#' @noRd
mod_dbBody_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
  })
}

## To be copied in the UI
# mod_dbBody_ui("dbBody_1")

## To be copied in the server
# mod_dbBody_server("dbBody_1")

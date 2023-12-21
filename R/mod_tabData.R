#' tabData UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_tabData_ui <- function(id){
  ns <- NS(id)
  tabItem(tabName = "data",
          mainPanel(
            actionBttn(inputId = "guide",label = "Guide", style = "stretch",color = "primary"),
            h1("Expeditions_Himalayan",id= "title"),
            reactableOutput("dtFinal_data",width = "900px"),
            downloadButton('save_data', 'Save to CSV')
            #downloadBttn(outputId = "save_data",label = "Save to CSV",
            #color = "success",size="xs",style="gradient"
            #)
          )
  )
}

#' tabData Server Functions
#'
#' @noRd
mod_tabData_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
  })
}

## To be copied in the UI
# mod_tabData_ui("tabData_1")

## To be copied in the server
# mod_tabData_server("tabData_1")

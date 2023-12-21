#' dbSidebar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_dbSidebar_ui <- function(id){
  ns <- NS(id)
  dashboardSidebar(
    sidebarMenu(
      menuItem("DATA", tabName = "data"),
      menuItem("Résumés statistiques", tabName = "resume"),
      menuItem("Analyse", tabName = "analyse", startExpanded = FALSE, menuName = "Analyse",
               menuSubItem("Graphique quantitatifs", tabName = "graph_quantitatifs"),
               menuSubItem("Graphique qualitatifs", tabName = "graph_qualitatifs"),
               menuSubItem("Graphique quanti vs quali", tabName = "graph_quanti_quali"),
               prettyRadioButtons(inputId = "type_graph",label = "Choix du style de graphique:", choices = c("classique","ggplot","ggplotly","plotly"),
                                  icon = icon("check"), bigger = FALSE,status = "info",animation = "jelly")
      ),
      menuItem("Predictions", tabName = "predictions",startExpanded = FALSE, menuName = "Predictions",
               menuSubItem("Prédictions expédition",tabName = "predExp"),
               prettyRadioButtons(inputId = "type_pred",label = "Choix du modèle de prédiction:", choices = c("knn","randomforest"),icon = icon("check"), bigger = FALSE,status = "info",animation = "jelly")
      )
    )
  )
}

#' dbSidebar Server Functions
#'
#' @noRd
mod_dbSidebar_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_dbSidebar_ui("dbSidebar_1")

## To be copied in the server
# mod_dbSidebar_server("dbSidebar_1")

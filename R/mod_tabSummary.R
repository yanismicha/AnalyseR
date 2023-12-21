#' tabSummary UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_tabSummary_ui <- function(id){
  ns <- NS(id)
  tabItem(tabName = "resume",
          sidebarPanel(
            actionBttn(inputId = "guide1",label = "Guide", style = "stretch",color = "primary"),
            h2("Informations requises:"),
            selectInput("var1", " Choisissez une variable", choices = names_data),
            #conditionalPanel(
            #condition = paste0(toJSON(names_data_quanti),'.includes(input.var1)'),
            radioButtons("bool1", "Souhaitez vous regarder une partie de la population?", choices = c('non', 'oui')),
            conditionalPanel(
              condition = "input.bool1 == 'oui'",
              selectInput("var_quali", "Variable à discriminer:", choices = names_data_quali),
              selectInput("cat1", "Quel partie de la population souhaitez vous regarder?", choices = NULL)
            ),
            #),
            actionBttn(inputId = "run",label = "run", style = "unite",size = "md",color = "royal")
          ),
          mainPanel(
            h1("Résumé statistiques"),
            verbatimTextOutput("summary")
          )
  )
}

#' tabSummary Server Functions
#'
#' @noRd
mod_tabSummary_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
  })
}

## To be copied in the UI
# mod_tabSummary_ui("tabSummary_1")

## To be copied in the server
# mod_tabSummary_server("tabSummary_1")

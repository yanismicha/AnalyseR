#' tabPredict UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_tabPredict_ui <- function(id){
  ns <- NS(id)
  tabItem(tabName = "predExp",
          sidebarPanel(
            actionBttn(inputId = "guide5",label = "Guide", style = "stretch",color = "primary"),
            h2("Dites m'en plus sur vous:",id="title3"),
            selectInput("peak", "Quel Sommet comptez vous grimper?", choices = NULL),
            selectInput("season", "Quel saison souhaitez vous grimper?", choices = NULL),
            selectInput("citizenship", "Votre nationalité:", choices = NULL),
            selectInput("role", "Votre role dans la cordée?", choices = NULL),
            numericInput("year", "En quel année?", value=2023,min=1900,max=3000),
            selectInput("sex", "Votre genre?", choices = NULL),
            numericInput("age", "Quel est votre âge?", value=20,min=0,max=100),
            selectInput("solo", "Comptez vous le faire seul?", choices = NULL),
            selectInput("oxygen", "Voulez vous utiliser de l'oxygène", choices = NULL),
            selectInput("hired", "Etes vous un professionnel?", choices = NULL),
            actionBttn(inputId = "run5",label = "run", style = "unite",size = "md",color = "royal")
          ),
          mainPanel(
            column(width = 6,
                   h1("Prédictions Python:"),
                   verbatimTextOutput("predknnP"),
                   progressBar(id = "pb1", value = 0, total = 100, status = "info", display_pct = TRUE, striped = FALSE, title = "Pourcentage de succès:")
            ),
            column(width = 6,
                   h1("Prédictions Julia:"),
                   verbatimTextOutput("predknnJ"),
                   progressBar(id = "pb2", value = 0, total = 100, status = "info", display_pct = TRUE, striped = FALSE, title = "Pourcentage de succès:")

            )
          )
  )
}

#' tabPredict Server Functions
#'
#' @noRd
mod_tabPredict_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_tabPredict_ui("tabPredict_1")

## To be copied in the server
# mod_tabPredict_server("tabPredict_1")

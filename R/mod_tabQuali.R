#' tabQuali UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_tabQuali_ui <- function(id){
  ns <- NS(id)
  tabItem(tabName = "graph_qualitatifs",
          sidebarPanel(
            actionBttn(inputId = "guide3",label = "Guide", style = "stretch",color = "primary"),
            h2("Informations requises"),
            selectInput("var4", " Choisissez une variable", choices = names_data_quali),
            selectInput('plot_type_quali', 'Choisissez le type de graphique:', choices = c('barplot', 'mosaicplot')),
            conditionalPanel(
              condition = "input.plot_type_quali == 'mosaicplot'",
              selectInput("var5", "Choisissez la 2ème variable", choices = names_data_quali)
            ),
            conditionalPanel(
              condition = "input.plot_type_quali == 'barplot'",
              radioButtons("bool3","Voulez vous que les barres soient triées?",choices = c("non","oui"))
            ),
            actionBttn(inputId = "run3",label = "run", style = "unite",size = "md",color = "royal")
          ),
          mainPanel(
            conditionalPanel(
              condition = "input.type_graph == 'classique'",
              plotOutput("plot_quali")
            ),
            conditionalPanel(
              condition = "input.type_graph == 'ggplot'",
              plotOutput("ggplot_quali")
            ),
            conditionalPanel(
              condition = "input.type_graph == 'ggplotly'",
              plotlyOutput("ggplotly_quali")
            ),
            conditionalPanel(
              condition = "input.type_graph == 'plotly'",
              plotlyOutput("plotly_quali")
            )
          )
  )
}

#' tabQuali Server Functions
#'
#' @noRd
mod_tabQuali_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_tabQuali_ui("tabQuali_1")

## To be copied in the server
# mod_tabQuali_server("tabQuali_1")

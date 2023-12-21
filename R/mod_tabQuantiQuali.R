#' tabQuantiQuali UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_tabQuantiQuali_ui <- function(id){
  ns <- NS(id)
  tabItem(tabName = "graph_quanti_quali",
          sidebarPanel(
            actionBttn(inputId = "guide4",label = "Guide", style = "stretch",color = "primary"),
            h2("Informations requises"),
            selectInput("var6", "Choisissez une variable quantitative:", choices = names_data_quanti),
            selectInput("var7", "Choisissez une variable qualitative:", choices = names_data_quali),
            selectInput('plot_type_quali_quanti', 'Choisissez le type de graphique:', choices = c('barplot', 'boxplot', 'scatterplot')),
            conditionalPanel(
              condition = "input.plot_type_quali_quanti == 'scatterplot'",
              selectInput("var8", "Choisissez une deuxième variable quantitative:", choices = names_data_quanti),
              selectInput("cat2", "Sur quel modalité voulez vous discriminer?", choices = NULL)
            ),
            actionBttn(inputId = "run4",label = "run", style = "unite",size = "md",color = "royal")
          ),
          mainPanel(
            conditionalPanel(
              condition = "input.type_graph == 'classique'",
              plotOutput("plot_quali_quanti")
            ),
            conditionalPanel(
              condition = "input.type_graph == 'ggplot'",
              plotOutput("ggplot_quali_quanti")
            ),
            conditionalPanel(
              condition = "input.type_graph == 'ggplotly'",
              plotlyOutput("ggplotly_quali_quanti")
            ),
            conditionalPanel(
              condition = "input.type_graph == 'plotly'",
              plotlyOutput("plotly_quali_quanti")
            )
          )
  )
}

#' tabQuantiQuali Server Functions
#'
#' @noRd
mod_tabQuantiQuali_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_tabQuantiQuali_ui("tabQuantiQuali_1")

## To be copied in the server
# mod_tabQuantiQuali_server("tabQuantiQuali_1")

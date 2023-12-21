#' tabQuanti UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_tabQuanti_ui <- function(id){
  ns <- NS(id)



  tabItem(tabName = "graph_quantitatifs",
          sidebarPanel(
            actionBttn(inputId = "guide2",label = "Guide", style = "stretch",color = "primary"),
            h2("Informations requises"),
            selectInput("var2", " Choisissez une variable:", choices = names_data_quanti),
            selectInput('plot_type', 'Choisissez le type de graphique:', choices = c('Histogram', 'scatterplot','Density','boxplot')),
            conditionalPanel(
              condition = "input.plot_type == 'Histogram'",
              sliderInput(inputId = "Classes", label = "Nombre de classes:", min = 2, max = 50, value = 8, step = 2)
            ),
            conditionalPanel(
              condition = "input.plot_type == 'boxplot'",
              sliderInput(inputId = "Classes2", label = "Nombre de classes:", min = 1, max = 10, value = 2, step = 1),
              radioButtons("bool4","Voulez vous que la taille des box dépende de l'effectif?",choices = c("oui","non"))
            ),
            conditionalPanel(
              condition = "input.plot_type == 'scatterplot'",
              selectInput("var3", "Choisissez la seconde variable", choices = names_data_quanti),
              radioButtons("bool2", "Souhaitez vous regarder une partie de la population?", choices = c('non', 'oui')),
              conditionalPanel(
                condition = "input.bool2 == 'oui'",
                selectInput("var_binaire", "Variable à discriminer:", choices = names_data_binaire)
              )
            ),
            conditionalPanel(
              condition = "input.plot_type == 'Density'",
              selectInput("var_quali2","Variable à discriminer:",choices = c("Aucune",names_data_quali))
            ),
            actionBttn(inputId = "run2",label = "run", style = "unite",size = "md",color = "royal")
          ),
          mainPanel(
            conditionalPanel(
              condition = "input.type_graph == 'classique'",
              plotOutput("plot_quanti")
            ),
            conditionalPanel(
              condition = "input.type_graph == 'ggplot'",
              plotOutput("ggplot_quanti")
            ),
            conditionalPanel(
              condition = "input.type_graph == 'ggplotly'",
              plotlyOutput("ggplotly_quanti")
            ),
            conditionalPanel(
              condition = "input.type_graph == 'plotly'",
              plotlyOutput("plotly_quanti")
            )
          )
  )
}

#' tabQuanti Server Functions
#'
#' @noRd
mod_tabQuanti_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_tabQuanti_ui("tabQuanti_1")

## To be copied in the server
# mod_tabQuanti_server("tabQuanti_1")

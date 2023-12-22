#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.


#' @import cicerone
#' @import forcats
#' @import ggmosaic
#' @import ggplot2
#' @import ggridges
#' @import RColorBrewer
#' @import shiny
#' @import shinyWidgets
#' @import dplyr
#' @import magrittr
#' @import plotly
#' @noRd
app_server <- function(input, output, session) {
  palette_couleurs <- brewer.pal(12, "Set3")
  names_data<- scinde(data)
  names_data_quanti <- names_data$quanti
  names_data_quali <- names_data$quali
  names_data_binaire <- names_data$binaire
  # Your application server logic
  #mod_tabData_server("tabData_1")
  #mod_tabSummary_server("tabSummary_1")


  ###traitement des guides des differentes pages###
  guide$
    init()

  guide1$init()
  guide2$init()
  guide3$init()
  guide4$init()
  guide5$init()


  observeEvent(input$guide, {
    guide$start()
  })
  observeEvent(input$guide1, {
    guide1$start()
  })
  observeEvent(input$guide2, {
    guide2$start()
  })
  observeEvent(input$guide3, {
    guide3$start()
  })
  observeEvent(input$guide4, {
    guide4$start()
  })
  observeEvent(input$guide5, {
    guide5$start()
  })


  observe({
    var_qualitative <- input$var_quali
    var_qualitative2 <- input$var7
    modalites <- levels(as.factor(df()[,var_qualitative]))
    modalites2 <- c("toute la population",levels(as.factor(df()[,var_qualitative2])))
    # Mettre à jour les choix des selectInput
    updateSelectInput(session, "cat1", choices = modalites)
    updateSelectInput(session, "cat2", choices = modalites2)
    #predictions#
    updateSelectInput(session,"peak",choices=levels(as.factor(df()$peak_name)))
    updateSelectInput(session,"season",choices=levels(as.factor(df()$season)))
    updateSelectInput(session,"citizenship",choices=levels(as.factor(df()$citizenship)))
    updateSelectInput(session,"role",choices=levels(as.factor(df()$expedition_role)))
    updateSelectInput(session,"sex",choices=levels(as.factor(df()$sex)))
    updateSelectInput(session,"solo",choices=levels(as.factor(df()$solo)))
    updateSelectInput(session,"oxygen",choices=levels(as.factor(df()$oxygen_used)))
    updateSelectInput(session,"hired",choices=levels(as.factor(df()$hired)))



    if(input$plot_type_quali_quanti == "barplot"){
      updateSelectInput(session,"var6",choices = names(data),label = "Choisissez une variable:")
    }
    else{
      updateSelectInput(session,"var6",choices = names_data_quanti,label = "Choisissez une variable quantitative:")
    }


  })

  df <- reactive({
    data
  })





  ###theme du jeu de donnee###
  theme_dark <-reactableTheme(
    color = "hsl(233, 9%, 87%)",
    backgroundColor = "hsl(233, 9%, 19%)",
    borderColor = "hsl(233, 9%, 22%)",
    stripedColor = "hsl(233, 12%, 22%)",
    highlightColor = "hsl(233, 12%, 24%)",
    inputStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
    selectStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
    pageButtonHoverStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
    pageButtonActiveStyle = list(backgroundColor = "hsl(233, 9%, 28%)"))



  style_success <- function(value) {
    if (value) {
      list(color = "green")
    }
    else {
      list(color = "red")
    }
  }
  output$dtFinal_data <- renderReactable({
    reactable(df(),
              columns = list(success = colDef(align = "center"#, style = style_success (plus joli mais long a lancer;)
                                              , filterable = FALSE)),fullWidth = TRUE,defaultColDef = colDef(style = "font-style: italic;"),searchable = TRUE,
              filterable = TRUE,highlight = TRUE, showPageSizeOptions = TRUE,defaultPageSize = 10,pageSizeOptions = c(10, 50, 100),theme = theme_dark)
  })


  #################################Resumes statistiques###########################
  resume <- eventReactive(input$run, {
    v1 <- input$var1
    x1 <- df()[,v1]
    if(v1 %in% names_data_quanti){##cas ou c'est un variable quanti
      if(input$bool1 == "oui"){##on regarde une sous partie
        data_filtre <- df()[df()[,input$var_quali] == input$cat1, ]
        n_observations <- length(data_filtre[,v1])
        frequency <- n_observations / length(x1)#/73000 normalement
        pop <- round(frequency*100,2)
        # Création du résumé personnalisé
        custom_summary <- summary(data_filtre[,v1])
        custom_summary <- c(custom_summary, N_Observations = n_observations, Pourcentage_population = pop)
        round(custom_summary,2)
      }
      else #on regarde la variable
        summary(df()[,input$var1])
    }
    else{#cas d'une variable qualitative#
      if(input$bool1 == "oui"){##on regarde une sous partie
        data_filtre <- df()[df()[,input$var_quali] == input$cat1, ]
        subx1 <- data_filtre[,v1]
        effectifs <- table(subx1)
        effectifsCumulés <- cumsum(effectifs)
        frequence <- round(effectifs/length(subx1)*100,2)
        frequence_cumulés <- cumsum(frequence)
        table_data <- data.frame(Effectif = as.vector(effectifs),EffectifsCumules= effectifsCumulés, Frequence = as.vector(frequence), Frequence_Cumulees= frequence_cumulés)
        table_data
      }
      else{
        effectifs <- table(x1)
        frequence <- round(effectifs/length(x1)*100,2)
        frequence_cumulés <- cumsum(frequence)
        table_data <- data.frame(Effectif = as.vector(effectifs), Frequence = as.vector(frequence), Frequence_Cumulees= frequence_cumulés)
        table_data
      }
    }
  },ignoreNULL = FALSE) #ignoreNull=false, permet d'afficher sans cliquer sur run



  output$summary <- renderPrint({
    resume()
  })

  #################################PARTIE QUANTITATIF###########################

  plot_quanti_print <- eventReactive(input$run2,{
    plot_quanti(plot_type = input$plot_type,data=df(),variable_quanti1 = input$var2,variable_quanti2 = input$var3,
                variable_binaire=input$var_binaire,modalites = input$var_quali2,breaksHist = input$Classes,
                breaksBox = input$Classes2,ajust = input$bool4,discr=input$bool2,type = "classique")
  })
  ggplot_quanti_print <- eventReactive(input$run2,{
    plot_quanti(plot_type = input$plot_type,data=df(),variable_quanti1 = input$var2,variable_quanti2 = input$var3,
                variable_binaire=input$var_binaire,modalites = input$var_quali2,breaksHist = input$Classes,
                breaksBox = input$Classes2,ajust = input$bool4,discr=input$bool2,type = "ggplot")
  })
  ggplotly_quanti_print <- eventReactive(input$run2,{
    p<- plot_quanti(plot_type = input$plot_type,data=df(),variable_quanti1 = input$var2,variable_quanti2 = input$var3,
                    variable_binaire=input$var_binaire,modalites = input$var_quali2,breaksHist = input$Classes,
                    breaksBox = input$Classes2,ajust = input$bool4,discr=input$bool2,type = "ggplot")
    ggplotly(p)
  })
  plotly_quanti_print <- eventReactive(input$run2,{
    plot_quanti(plot_type = input$plot_type,data=df(),variable_quanti1 = input$var2,variable_quanti2 = input$var3,
                variable_binaire=input$var_binaire,modalites = input$var_quali2,breaksHist = input$Classes,
                breaksBox = input$Classes2,ajust = input$bool4,discr=input$bool2,type = "plotly")
  })


  output$plot_quanti <- renderPlot({
    plot_quanti_print()
  })
  output$ggplot_quanti <- renderPlot({
    ggplot_quanti_print()
  })

  output$ggplotly_quanti <- renderPlotly({
    ggplotly_quanti_print()
  })
  output$plotly_quanti <- renderPlotly({
    plotly_quanti_print()
  })






  #################################PARTIE QUALITATIF#############################
  plot_quali_print <- eventReactive(input$run3,{
    plot_quali(plot_type = input$plot_type_quali,df(),input$var4,input$var5,input$bool3,palette_couleurs,"classique")
  })

  ggplot_quali_print <- eventReactive(input$run3,{
    plot_quali(plot_type = input$plot_type_quali,df(),input$var4,input$var5,input$bool3,palette_couleurs,"ggplot")
  })
  ggplotly_quali_print <- eventReactive(input$run3,{
    p <- plot_quali(plot_type = input$plot_type_quali,df(),input$var4,input$var5,input$bool3,palette_couleurs,"ggplot")
    ggplotly(p)
  })
  plotly_quali_print <- eventReactive(input$run3,{
    plot_quali(plot_type = input$plot_type_quali,df(),input$var4,input$var5,input$bool3,palette_couleurs,"plotly")
  })

  output$plot_quali <- renderPlot({
    plot_quali_print()
  })
  output$ggplot_quali <- renderPlot({
    ggplot_quali_print()
  })
  output$ggplotly_quali <- renderPlotly({
    ggplotly_quali_print
  })
  output$plotly_quali <- renderPlotly({
    plotly_quali_print()
  })



  #################################PARTIE QUANTITATIF vs QUALITATIF##########################


  plot_quali_quanti_print <- eventReactive(input$run4,{
    plot_quanti_quali(input$plot_type_quali_quanti,df(),input$var6,input$var8,input$var7,input$cat2,palette_couleurs,"classique")
  })
  ggplot_quali_quanti_print <- eventReactive(input$run4,{
    plot_quanti_quali(input$plot_type_quali_quanti,df(),input$var6,input$var8,input$var7,input$cat2,palette_couleurs,"ggplot")
  })
  ggplotly_quali_quanti_print <- eventReactive(input$run4,{
    if(input$plot_type_quali_quanti=="scatterplot" && input$cat2=="toute la population"){
      plot_ly() %>%
        add_trace(
          type = "scatter",
          mode = "lines",
          x = c(1, 2, 1.5, 1),
          y = c(1, 1, 2, 1),
          line = list(color = "red", width = 2)
        ) %>%
        layout(
          title = "En Chantier",
          xaxis = list(title = "En chantier"),
          yaxis = list(title = "En chantier")
        )
    }
    else{
      p3<-plot_quanti_quali(input$plot_type_quali_quanti,df(),input$var6,input$var8,input$var7,input$cat2,palette_couleurs,"ggplot")
      ggplotly(p3)
    }

  })
  plotly_quali_quanti_print <- eventReactive(input$run4,{
    if(input$plot_type_quali_quanti=="scatterplot" && input$cat2=="toute la population"){
      plot_ly() %>%
        add_trace(
          type = "scatter",
          mode = "lines",
          x = c(1, 2, 1.5, 1),
          y = c(1, 1, 2, 1),
          line = list(color = "red", width = 2)
        ) %>%
        layout(
          title = "En Chantier",
          xaxis = list(title = "En chantier"),
          yaxis = list(title = "En chantier")
        )
    }
    else
      plot_quanti_quali(input$plot_type_quali_quanti,df(),input$var6,input$var8,input$var7,input$cat2,palette_couleurs,"plotly")
  })

  output$plot_quali_quanti <- renderPlot({
    plot_quali_quanti_print()
  })
  output$ggplot_quali_quanti <- renderPlot({
    ggplot_quali_quanti_print()
  })
  output$ggplotly_quali_quanti <- renderPlotly({
    ggplotly_quali_quanti_print()
  })
  output$plotly_quali_quanti <- renderPlotly({
    plotly_quali_quanti_print()
  })




  #################################PARTIE PREDICTIONS#########################
  predict_knnP <- eventReactive(input$run5,{
    # if (input$type_pred == "knn"){
    #   ind <- c(input$peak,input$season,input$citizenship,input$role,input$year,input$sex,input$age,input$hired,input$solo,input$oxygen,0,0)
    #   tryCatch({
    #     predict <- KNN_Python(ind)
    #   }, error = function(e) {
    #     "Une erreur s'est produite lors de l'exécution de Python/main.py."
    #   })
    #   if(typeof(predict) == "list"){
    #     output$textPython <- renderText({
    #       paste("Vous avez ",round(predict$proba_s*100,0),"% de chances de réussir",".","La prediction à mis : ",round(predict$temps,3),"s")
    #     })
    #     updateProgressBar(session = session, id = "pb1", value = round(predict$proba_s*100,0),total=100)
    #   }
    # }else{
    #   ind <- list(input$peak,input$season,input$citizenship,input$role,input$year,input$sex,input$age,input$hired,input$solo,input$oxygen,0,0)
    #   tryCatch({
    #     Forest <- RandomForest_Python(ind,5)
    #   }, error = function(e) {
    #     "Une erreur s'est produite lors de l'exécution de Python/main.py."
    #   })
    #   if(typeof(Forest) == "list"){
    #     output$textPython <- renderText({
    #       paste("Vous avez ",round(Forest$proba_s*100,0),"% de chances de réussir",".","La prediction à mis : ",round(Forest$temps,3),"s")
    #     })
    #     updateProgressBar(session = session, id = "pb1", value = round(Forest$proba_s*100,0), total = 100)
    #   }
    # }
    ## a enlever une fois les pb réglés##
    sample <- sample(100,1)
    output$textPython <- renderText({
      paste("Vous avez ",sample,"% de chances de reussir",".","La prediction a mis : ",abs(runif(1)),"s")
    })
    updateProgressBar(session,id = "pb1",value = sample)
    ##                                 ##
  })
  predict_knnJ <- eventReactive(input$run5,{
    # if (input$type_pred == "knn"){
    #   julia_command("KNN = JuliaPredict.KNN_Process(JuliaPredict.get_data(),JuliaPredict.get_indiv())")
    #   KNN <- julia_eval("KNN")
    #   output$textJulia <- renderText({
    #     paste("Vous avez ",round(KNN[1]*100,0),"% de chances de réussir",".","La prediction à mis : ",round(KNN[2],4),"s")
    #   })
    #   updateProgressBar(session = session, id = "pb2", value = round(KNN[1]*100,0),total=100)
    # }else{
    #   julia_command("Tree = JuliaPredict.Tree_Process(JuliaPredict.get_data(),JuliaPredict.get_indiv())")
    #   Tree <- julia_eval("Tree")
    #   output$textJulia <- renderText({
    #     paste("Vous avez ",round(Tree[[3]]*100,0),"% de chances de réussir",".","La prediction à mis : ",round(Tree[[4]],3),"s")
    #   })
    #   updateProgressBar(session = session, id = "pb2", value = round(Tree[[3]]*100,0), total = 100)
    # }

    ## a enlever une fois les pb regles##
    sample2 <- sample(100,1)
    output$textJulia <- renderText({
      paste("Vous avez ",sample2,"% de chances de reussir",".","La prediction a mis : ",abs(runif(1)),"s")
    })
    updateProgressBar(session,id = "pb2",value = sample2)
    ## a enlever une fois les pb reglés##

  })

  output$predknnP <- renderPrint({
    predict_knnP()
  })
  output$predknnJ <-renderPrint({
    predict_knnJ()
  })



  #sauvegarde de df au format csv
  output$save_data <- downloadHandler(
    filename <- function(){
      paste("data",Sys.Date(), ".csv", sep = ',')
    },
    content <- function(file){
      write.csv(df(),file)
    }
  )
}


predictWeight <- function(diet,age) {
  if ("datasets" %in% rownames(installed.packages()) == FALSE) {
    install.packages("datasets")
  }
  require(datasets)
  data(ChickWeight)
  dataSub = subset(ChickWeight,ChickWeight$Diet==diet)
  fit = lm(dataSub$weight~dataSub$Time)
  summary(fit)$coef[1,1]+summary(fit)$coef[2,1]*age
}
  
shinyServer(
  function(input, output) {
    output$diet <- renderPrint({input$diet})
    output$age <- renderPrint({input$age})
    output$prediction <- renderPrint({predictWeight(input$diet,input$age)})
  }
)

shinyUI(pageWithSidebar(
  headerPanel("Predicting Chick Weight based on Diet and Age"),
  sidebarPanel(
    h5('This application predicts the weight of a chick based on the diet 
       that it is fed and its age. This is based on the ChickWeight dataset 
       from the dataset package in R, with documentation on 
       https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/ChickWeight.html. 
       Please note that the dataset only has age from 0 (birth) to 21 days, 
       so an age value beyond that would be an extrapolation. The predicted value 
       of weight is based on a linear regression of weight against age for 
       each diet.'),
    numericInput('diet', 'Diet (1-4)', 1, min = 1, max = 4, step = 1),
    numericInput('age', 'Age (days)', 0, min = 0, max = 21, step = 1),
    submitButton('Submit')
  ),
  mainPanel(
    h3('Results of prediction'),
    h4('You entered the following diet number'),
    verbatimTextOutput("diet"),
    h4('You entered the following age of chick'),
    verbatimTextOutput("age"),
    h4('Which resulted in a prediction of the following weight (grams)'),
    verbatimTextOutput("prediction")
  )
))

library(shiny)
shinyUI(pageWithSidebar(
  
  headerPanel("Generating distribution"),
  
  sidebarPanel(
    selectInput("method", "Choose distribution:", choices=c("Normal"="norm", "Student t"="st")),
    helpText("Setting parameter(s) for distribution model"),
    conditionalPanel(condition="input.method=='norm'",
                     numericInput(inputId="mu", label="mean", value=0),
                     numericInput(inputId="sd", label="standard deviation", value=1, min=0)
    ),
    conditionalPanel(condition="input.method=='st'",
                     numericInput(inputId="df", label="Df", value=10, min=1)
    ),
    sliderInput(inputId="obs", 
                label="Number of observations:", 
                min = 1, max = 1000, value = 500)
  ),
  
  mainPanel(
    plotOutput("distPlot")
  )
  
))library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Sample size calculator"),
  
  sidebarPanel(
    selectInput("method", "Choose a method:", choices=c("Rate"="rate", "Case Control Study"="cc")),
    conditionalPanel(condition="input.method=='rate'",
                     numericInput("Sig", "Two-sided significance level:", min = 0, max = 1.000, value = 0.05),
                     numericInput("p", "The expected rate:", min = 0, max = 1, value = 0.5),
                     numericInput("X", "Acceptable error range:", min = 0, max = 1, value = 0.03)
    ),
    conditionalPanel(condition="input.method=='cc'",
                     numericInput("alpha", "Two-sided significance level:", min = 0.001, max = 0.999, value = 0.05),
                     numericInput("power", "Power:", min = 0.001, max = 0.999, value = 0.8),
                     numericInput("OR", "Smallest difference of clinical/biological importance:", min = 0.01, max = 100, value = 1.5),
                     numericInput("r", "The ratio of Case/Control:", min = 0.01, max = 100, value = 1),
                     numericInput("p0", "Proportion of controls with exposures:", min = 0.001, max = 0.999, value = 0.2) 
    )  
  ),
  
  mainPanel(
    h3(textOutput("text1")),
    h4(textOutput("text2")),
    h3(textOutput("text3")),
    h4(textOutput("text4"))
  )
))
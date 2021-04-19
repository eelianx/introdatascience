#Simple Non Compounding Interest Demo

ui<-pageWithSidebar(
  # Application title
  headerPanel("Simple Non-Compounding Interest Calculator"),
  sidebarPanel(
    numericInput('Principal', 'Principal (RM10k deposit max)', 1000, min= 1, max = 10000, step = 1
    ),
    numericInput('Rate', 'Interest Rate (%) per Year', 3, min = 80, max = 200, step = 1
    ),
    numericInput('Period', 'No. of Periods (Years)', 15, min = 80, max = 200, step = 1
    ),
    submitButton('Submit')
  ),
  mainPanel(
    h3('Results of Simple Non Compounding Interest Calculation'),
    h4('You entered Prinipal Amount (RM)'),
    verbatimTextOutput("inputValuePrincipal"),
    h4('You entered Interest Rate (%)'),
    verbatimTextOutput("inputValueRate"),
    h4('You entered Time Period (Years)'),
    verbatimTextOutput("inputValuePeriod"),
    h4('Which resulted in Interest of RM (Principal*Rate*Period) :'),
    verbatimTextOutput("InterestCalculation")
  )
)


Interest <- function(Principal, Rate, Period) Principal*(Rate/100)*Period

server<- function(input, output) {
  output$inputValuePrincipal <- renderPrint({input$Principal})
  output$inputValueRate <- renderPrint({input$Rate})
  output$inputValuePeriod <- renderPrint({input$Period})
  output$InterestCalculation <- renderPrint({Interest(input$Principal,input$Rate,input$Period)})
}


shinyApp(ui = ui, server = server)
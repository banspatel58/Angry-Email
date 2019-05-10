library(shiny)
library(ggplot2)


fluidPage(
  
  sidebarLayout(
    sidebarPanel(
      
      headerPanel("Email"),
      
      textInput("from", "From: ", value = "from@gmail.com"),
      textInput("to", "To: ", value = "to@gmail.com"),
      textInput("subject", "Subject: ", value = "subject...."),
      textInput("text", label = h3("Text input"), value = "Write message here..."),
      actionButton("send", "Send Email")
      
    ),
    
    mainPanel(
      
      verbatimTextOutput("warning")
      
    )
  )
  
)

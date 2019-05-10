library(tidytext)
library(tidyverse)
library(wordcloud)
library(tm)
library(shinyAce)
library(sendmailR)
library(SentimentAnalysis)
library(sentimentr)

function(input, output) {
  
  # You can access the value of the widget with input$text, e.g.
  freqr=reactive({
    
    freqr = sentiment(input$text)
    
  })
  output$warning <- renderPrint({
    
    freqr<-freqr()
    
    msg = "Send Email"
    
    if(is.null(input$send) || input$send==0) return(NULL)
    
    for (row in 1:nrow(freqr)) {
      
      if(freqr$sentiment[row] < 0){
        
        msg = "Don't send the email"
        
      } else {
        
        msg = "You are good to send"
        
      }
      
      
    }
    
    print(msg)
    
  })
  
}
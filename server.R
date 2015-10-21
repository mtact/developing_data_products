library(shiny)

wtMean <- function(s1, s2, s3, s4, s5){
    s1*0.1 + s2*0.1 + s3*0.2 + s4*0.2 + s5*0.4
}

grade <- function(x){
  if(is.na(x)){
    x
  }
  else{
    y <- if(x >= 90){
      "A"
    }
    else if (x < 90 & x >= 80 ){
      "B"
    }
    else if (x < 80 & x >= 70){
      "C"
    }
    else if (x < 70 & x >= 60){
      "D"
    }
    else{
      "F"
    }
    y
  }
}

shinyServer(
  function(input,output){
    output$oid1 <- renderPrint({wtMean(input$id1, input$id2, input$id3, input$id4, input$id5)})
    output$oid2 <- renderPrint({grade(wtMean(input$id1, input$id2, input$id3, input$id4, input$id5))})
    output$oid3 <- renderPrint({input$id6})  
  }
)
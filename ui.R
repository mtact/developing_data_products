library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Grade Calculation"),
  sidebarPanel(
    h3('Input Panel'),
    h5('Below please enter your scores (0 to 100) for each of the five tests:'),
    numericInput('id1', 'Score for the test 1 (worth 10%)', NULL, min = 0, max = 100, step = 1),
    numericInput('id2', 'Score for the test 2 (worth 10%)', NULL, min = 0, max = 100, step = 1),
    numericInput('id3', 'Score for the test 3 (worth 20%)', NULL, min = 0, max = 100, step = 1),
    numericInput('id4', 'Score for the test 4 (worth 20%)', NULL, min = 0, max = 100, step = 1),
    numericInput('id5', 'Score for the test 5 (worth 40%)', NULL, min = 0, max = 100, step = 1),
    
    h5('Without any calculation, guess what grade you will receive:'),
    checkboxGroupInput("id6", "my guess", c("A" = "A", 
                                            "B" = "B",
                                            "C" = "C",
                                            "D" = "D",
                                            "F" = "F")),
    submitButton('submit')
    
  ),
  mainPanel(
    
    
    
    h4('Your semester score (weighted average for your five test scores):'),
    verbatimTextOutput("oid1"),
    h4('Your guess on your semester grade:'),
    verbatimTextOutput("oid3"),
    h4('Your real semester grade:'),
    verbatimTextOutput("oid2"),
    
    h2("Documentation"),
    h5("A teacher decides to use five tests to determine a student's 
       semester grade for the course. As the semester goes on, the importance 
       of the tests increase. The first two tests are for warmup purpose and weight only 10% 
       of the semester score. The next two weight 20% of the semester score. The last test, 
       which is the final, weights a heavy 40% of the semester score."),  
    
    h5("The semester score (denoted by s) is therefore computed as a weighted average"),
    
    h5("s = (test 1 score)*0.1 + (test 2 score)*0.1 + (test 3 score)*0.2 + (test 4 score)*0.2
       +(test 5 score)*0.4."),
    
    h5("Having obtained the semester score, the cutoffs for the letter grades are as follows:"),
    
    h5("s >= 90, A"),
    h5("s < 90 and s >= 80, B"),
    h5("s < 80 and s >= 70, C"),
    h5("s < 70 and s >= 60, D"),
    h5("s < 60, F"),
    
    
    h5("This app is created to help a student calculate his or her own grade:"), 
    h5("(1) First, the student needs to enter the five test scores (numerical values between 0 to 100) on the 'Input
Panal' on the left."),
    h5("(2) Then the student is asked to make a guess on the grade he or she will
receive. This part allows the student to reflect on his or her own performance throughout the semester."),
    h5("(3) Hit the 'submit' button, and on the main panel the student's
semester score, guess grade, and actual grade will be shown." )
  )
))
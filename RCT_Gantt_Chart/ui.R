#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Gantt Chart of Clinical Trials"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(

       dateRangeInput("date_range", label = "Date Range"),
       
       selectInput("study_type",
                   label = "Select Study Type",
                   choices = c("Interventional",
                               "Observational"),
                   selected = "Interventional")
       
       
    ),
    
    
    
    # Show a plot of the generated distribution
    mainPanel(
       htmlOutput("gantt_chart")
    )
  )
))

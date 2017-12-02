#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(googleVis)
library(janitor)
library(readr)
library(stringr)
library(tidyverse)
library(timevis)

# Read data for Gantt Chart

gantt_data = readRDS("../Data/gantt_data.rds") %>%
  arrange(date_start)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
   
  output$gantt_chart <- renderGvis({
    
    # data to plot
    
    toplot <- gantt_data %>%
      filter(study_type == input$study_type &
               date_start >= input$date_range[1] & date_start <= input$date_range[2] &
               recruitment == input$recruit_status)
    
    gvisTimeline(data = toplot,
                            rowlabel = "nct_number",
                            barlabel = "label",
                            start = "date_start",
                            end = "date_end",
                            options = list(height = 600, width = 800))
    #plot(timeline)
    
  
    
  })
  
  output$info_text <- renderText({
    paste("Displaying data for", input$study_type, "studies, with status:", input$recruit_status, "and start date between",
          input$date_range[1], "and", input$date_range[2])
  })
  
})

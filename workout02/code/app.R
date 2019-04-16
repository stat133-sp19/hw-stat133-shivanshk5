# Title: Saving Investing Modalities
# Author: Shivansh Kumar
# Date: 16 April 2019
# Description: Code creates a shiny app that visually displays the savings from the three different modes of investing: no annuity, annuity, and growth annuity
# Input Widgets: # Slider input for Initial Amount from $0 to $100,000 in steps of $500 with default of $1,000
                 # Slider input for Annual Contribution from $0 to $50,000 in steps of $500 with default of $2,000
                 # Slider input for Return Rate from 0% to 20% in steps of 0.1% with default of 5%  
                 # Slider input for Growth Rate from 0% to 20% in steps of 0.1% with default of 2%  
                 # Slider input for Years from 0 to 50 in steps of 1 with default of 20 years
                 # Select input for Facet?. Choices are "Yes" or "No"
# Outputs:  # An output graph to display the yearly saving balances
            # An output table for the data frame with the yearly balances

# Loading libraries
library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Saving Investing Modalities"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("initial",
                  "Initial maount",
                  min = 10,
                  max = 10000,
                  value = 100),
      sliderInput("years", "Number of years",
                  min = 1, max = 50,
                  value = 10),
      numericInput("mean", "mean return", value = 0.16,
                   min = 0, max = 2),
      numericInput("sd", "standard deviation", value = 0.11,
                   min = 0, max = 2)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      plotOutput("returns")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  dat <- reactive({
    balance <- c(input$initial, rep(0, input$years))
    rates <- rep(0, input$years)
    
    for (y in 1:input$years) {
      rates[y] <- rnorm(1, input$mean, input$sd)
      balance[y+1] <- balance[y] * (1 + rates[y])
    }
    dat <- data.frame(
      year = 0:input$years,
      rate = c(0, rates),
      balance = balance
    )
    return(dat)
  })
  
  output$distPlot <- renderPlot({
    ggplot(data = dat(), aes(x = year, y = balance)) + 
      geom_line()
  })
  
  output$returns <- renderPlot({
    ggplot(data = dat(), aes(x = year, y = rate)) +
      geom_line() + 
      geom_hline(yintercept = 0, color = "tomato")
  })
}

# Run the application 
shinyApp(ui = ui, server = server)


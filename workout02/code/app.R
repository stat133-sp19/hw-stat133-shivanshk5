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

# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("Saving Investing Modalities"),
  
  # Input Widgets 
  fluidRow(
    column(3,
        sliderInput("initial",
                    "Initial Amount ($)",
                    min = 0,
                    max = 100000,
                    value = 1000,
                    step = 500)),
    column(3,
        sliderInput("rate",
                    "Return Rate (%)",
                    min = 0,
                    max = 20,
                    value = 5,
                    step = 0.1)),
    column(3,
           sliderInput("years",
                       "Years",
                       min = 0,
                       max = 50,
                       value = 20,
                       step = 1))),
  fluidRow(
    column(3,
        sliderInput("annual", "Annual Contribution ($)",
                    min = 0, 
                    max = 50000,
                    value = 2000,
                    step = 500)),
    column(3,
        sliderInput("growth", "Growth Rate (%)",
                    min = 0, 
                    max = 20,
                    value = 2,
                    step = 0.1)),
    column(3,
        selectInput("facet",
                    "Facet?",
                    choices = c("Yes", "No"),
                    selected = "No"))),
    
    # Show a plot and table of the generated distribution
    mainPanel(
      h4('Timelines'),
      plotOutput("plotting"),
      h4("Balances"),
      tableOutput("balances")
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


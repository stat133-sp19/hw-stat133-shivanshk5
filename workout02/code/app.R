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
    column(4,
           sliderInput("initial",
                       "Initial Amount ($)",
                       min = 0,
                       max = 100000,
                       value = 1000,
                       step = 500)),
    column(4,
           sliderInput("rate",
                       "Return Rate (%)",
                       min = 0,
                       max = 20,
                       value = 5,
                       step = 0.1)),
    column(4,
           sliderInput("year",
                       "Years",
                       min = 0,
                       max = 50,
                       value = 20,
                       step = 1))),
  fluidRow(
    column(4,
           sliderInput("annual", "Annual Contribution ($)",
                       min = 0, 
                       max = 50000,
                       value = 2000,
                       step = 500)),
    column(4,
           sliderInput("growth", "Growth Rate (%)",
                       min = 0, 
                       max = 20,
                       value = 2,
                       step = 0.1)),
    column(4,
           selectInput("facet",
                       "Facet?",
                       choices = c("Yes", "No"),
                       selected = "No"))),
  
  # Show a plot and table of the generated distribution
  mainPanel(
    h4('Timelines'),
    plotOutput("plot"),
    h4("Balances"),
    tableOutput("balances")
  )
)

# Modality functions

# Write a function future_value() that computes the future value of an investment, taking the following arguments: amount, rate, years
#' @title Future Value Function
#' @description Computes the future value of an investment
#' @param amount initial invested amount (numeric)
#' @param rate annual rate of return (numeric)
#' @param years number of years (numeric)
#' @return computed future value of the investment amount based upon parameter values (numeric)
future_value <- function(amount, rate, years) {
  if (amount < 0 || rate < 0 || years < 0) {
    stop("Function cannot take negative values")
  }
  return(amount * ((1 + rate)^years))
}

# Write a function annuity() that computes the future value of annuity, taking the following arguments: contrib, rate, years
#' @title Future Value of Annuity
#' @description Computes the future value of annuity
#' @param contrib contributed amount (numeric)
#' @param rate annual rate of return (numeric)
#' @param years time in years (numeric)
#' @return computed future value of annuity based upon parameter values (numeric)
annuity <- function(contrib, rate, years) {
  if (contrib < 0 || rate < 0 || years < 0) {
    stop("Function cannot take negative values")
  }
  return(contrib * (((1 + rate)^years - 1)/rate))
}

# Write a function growing_annuity() that computes the future value of growing annuity, taking the following arguments: contrib, rate, growth, years
#' @title Future Value of Growing Annuity
#' @description Computes the future value of growing annuity
#' @param contrib first contribution (numeric)
#' @param rate annual rate of return (numeric)
#' @param growth growth rate (numeric)
#' @param years time in years (numeric)
#' @return computed future value of growing annuity based upon parameter values (numeric)
growing_annuity <- function(contrib, rate, growth, years) {
  if (contrib < 0 || rate < 0 || growth < 0 || years < 0) {
    stop("Function cannot take negative values")
  }
  return(contrib * (((1 + rate)^years - (1 + growth)^years)/(rate - growth)))
}

# Define server logic required to draw the plot and display the table
server <- function(input, output) {
  
  # Displaying the plot
  output$plot <- renderPlot({
    no_contrib <- c(input$initial)
    fixed_contrib <- c(input$initial)
    growing_contrib <- c(input$initial)
    
    for(i in 1:input$year) {
      no_contrib <- c(no_contrib, future_value(amount = input$initial, rate = input$rate / 100, years = i))
      fixed_contrib <- c(fixed_contrib, future_value(amount = input$initial, rate = input$rate / 100, years = i) + annuity(contrib = input$annual, rate = input$rate / 100, years = i))
      growing_contrib <- c(growing_contrib, future_value(amount = input$initial, rate = input$rate / 100, years = i) + growing_annuity(contrib = input$annual, rate = input$rate / 100, growth = input$growth / 100, years = i))
    }
    
    dat <- data.frame(year = 0:input$year, mode = rep(c('no_contrib', 'fixed_contrib', 'growing_contrib'), each = input$year + 1), balance = c(no_contrib, fixed_contrib, growing_contrib))
    dat$mode <- factor(dat$mode, levels = c('no_contrib', 'fixed_contrib', 'growing_contrib'))
    
    if (input$facet == "No") {
      ggplot(data = dat, aes(x = year, y = balance, col = mode)) + 
        ggtitle('Investing Modes Comparison') + xlab('Year') + ylab('Balance') +
        geom_line() + 
        theme_bw() + 
        geom_point() + 
        scale_color_discrete('mode')
    } else {
      ggplot(data = dat, aes(x = year, y = balance, col = mode)) + 
        ggtitle('Investing Modes Comparison') + xlab('Year') + ylab('Balance') +
        geom_line() + 
        theme_bw() + 
        geom_point() + 
        scale_color_discrete('mode') +
        geom_area(aes(fill = mode), alpha = 0.5) +
        facet_wrap(~mode)
    }
  })
  
  # Displaying the table
  output$balances <- renderTable(digits = 3, rownames = TRUE, {
    
    no_contrib <- c(input$initial)
    fixed_contrib <- c(input$initial)
    growing_contrib <- c(input$initial)
    
    for(i in 1:input$year) {
      no_contrib <- c(no_contrib, future_value(amount = input$initial, rate = input$rate / 100, years = i))
      fixed_contrib <- c(fixed_contrib, future_value(amount = input$initial, rate = input$rate / 100, years = i) + annuity(contrib = input$annual, rate = input$rate / 100, years = i))
      growing_contrib <- c(growing_contrib, future_value(amount = input$initial, rate = input$rate / 100, years = i) + growing_annuity(contrib = input$annual, rate = input$rate / 100, growth = input$growth / 100, years = i))
    }
    
    year <- 0:input$year
    tab <- data.frame(cbind(year, no_contrib, fixed_contrib, growing_contrib))
    tab$year <- sprintf('%1.0f', tab$year)
    tab
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
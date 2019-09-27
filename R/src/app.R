# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny) #shiny패키지 메모리 로딩

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId="xAxis","Choose X axis:",choices = c("mpg","disp","hp","drat","wt")
      ),
      selectInput(inputId="yAxis","Choose Y axis:",choices = c("wt","drat","hp","disp","mpg")
      ),
      selectInput(inputId = "pch", "choose shape:" , choices = c("circle"=1, "circle2"=16,"circle3"=22)),
      sliderInput(inputId ="cex", "point size", min = 0.1, max = 3, value = 1
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput(outputId="mtcarsPlot")
    )
  )
)

# Run the application 

server <- function(input, output) {
  output$mtcarsPlot <- renderPlot({
    title <- paste(input$xAxis, "vs",input$yAxis)
    plot(mtcars[, c(input$xAxis, input$yAxis)],
         main = title,
         pch = as.numeric(input$pch),
         cex = input$cex)
  
    })
}

shinyApp(ui = ui, server = server)



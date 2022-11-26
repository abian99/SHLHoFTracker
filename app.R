#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(reactable)
source("dbSetup.R")

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
      sidebarPanel(
        
      ),

        # Show a plot of the generated distribution
        mainPanel(
           reactableOutput("hofStats")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  options(
    reactable.theme = reactableTheme(
      color = "#FFFFFF",
      backgroundColor = "#262626",
      borderColor = "hsl(233, 9%, 22%)",
      stripedColor = "#2b2b2b",
      highlightColor = "hsl(233, 12%, 24%)",
      inputStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
      selectStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
      pageButtonHoverStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
      pageButtonActiveStyle = list(backgroundColor = "hsl(233, 9%, 28%)"),
      cellStyle = list(
        display = "flex",
        flexDirection = "column",
        justifyContent = "center"
      )
    )
  )
  
  output$hofStats <- renderReactable({
    reactable(
      combined_player_stats,
      bordered = TRUE,
      filterable = TRUE,
      showPageSizeOptions = TRUE,
      striped = TRUE,
      highlight = TRUE,
      resizable = TRUE,
      width = "112.9%",
      defaultColDef = colDef(align = "center", ),
    )
  })
    
}

# Run the application 
shinyApp(ui = ui, server = server)

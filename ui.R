library(shiny)

dataset <- data.frame(Titanic)
opt <- names(dataset)[-5]

shinyUI(navbarPage("Titanic Data Set Explorer:",
       
        tabPanel("Instructions", 
            img(src = "image1.jpg"),
            br(),
            h3("Survival of passengers on the Titanic"),
            p("This data set provides information on the fate of passengers on the fatal maiden voyage of the ocean liner 'Titanic', summarized according to economic status (class), sex, age and survival."),
            h3("Source"),
            p("Dawson, Robert J. MacG. (1995), The \'Unusual Episode\' Data Revisited. Journal of Statistics Education, 3. http://www.amstat.org/publications/jse/v3n3/datasets.dawson.html"),
            h3("Instructions"),
            p("The instructions are so basic. You just need to press on the \'Application\' panel and choose the fields for the \'X\' and \'Y\' axis of the barblot. You may also click on the \'Stacked Bars\' check box to change the behavior of the graph. 
              You can return to this page by pressing the \'Instructions\' tab."),
            p("This application shows always the total number of persons according to the selected criteria."),
            img(src = "app.jpg")
            ),
        
        tabPanel("Application",
                sidebarPanel(
                        selectInput('x', 'X', opt, width = 150),
                        selectInput('y', 'Y', opt, width = 150),
                        checkboxInput('stacked', 'Staked Bars'),
                        width = 3
                        ),
                mainPanel(
                        plotOutput("plot"),
                        textOutput("tt"),
                        textOutput("nn")
                        )
        )
        )
)
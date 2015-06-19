library(shiny)

dataset <- data.frame(Titanic)
opt <- names(dataset)[-5]


function(input, output, session) {
        
    
        observeEvent(input$x,{
                index <- which(opt == input$x )
                ch <- opt[-index]
                updateSelectInput(session, "y", choices = ch)
        })
        

        output$plot <- renderPlot({
                
                if ( input$x != input$y ) {
                        
                        ## - auxiliary computations
                        i1 <- which(opt == input$x )
                        i2 <- which(opt == input$y )
                        
                        m <- apply(Titanic, c(i2, i1), sum)
                        
                        ## - plot computation
                        barplot(m, 
                                beside = !input$stacked, 
                                main = paste("TITANIC DATA: '", input$x, "'' vs '", input$y, "'"  ), 
                                ylab = "Total of Persons",
                                col=c(1:length(row.names(m))), 
                                legend = row.names(m)[1:length(row.names(m))], 
                                args.legend = list(x ="topright"))}
        })
}
library(shiny)
library(bdxmetroidentity)
library(ggplot2)

ui <- navbarpage_bdx(

  # Title
  title = "App de démo pour le datalab",

  tabPanel(title = "Parameters",

           uiOutput(outputId = "my_logo"),

           br(),

           selectInput(inputId ="select",
                       label = "Sélectionnez une valeur",
                       choices = letters),

           sliderInput(inputId ="slide",
                       label = "Sélectionnez une valeur",
                       min = 0,
                       max = 100,
                       value = 50),

           actionButton(inputId = "my_action_button_primary",
                        label = "primary",
                        class = "btn-primary"),

           actionButton(inputId = "my_action_button_secondary",
                        label = "secondary (default)",
                        class = "btn-secondary"),

           actionButton(inputId = "my_action_button_success",
                        label = "success",
                        class = "btn-success"),

           actionButton(inputId = "my_action_button_info",
                        label = "info",
                        class = "btn-info"),

           actionButton(inputId = "my_action_button_warning",
                        label = "warning",
                        class = "btn-warning"),

           actionButton(inputId = "my_action_button_danger",
                        label = "danger",
                        class = "btn-danger")

           ),

  tabPanel(title = "Table",
           DT::DTOutput(outputId = "my_table")),

  tabPanel(title = "Plot",
           plotOutput(outputId = "my_plot"))

  )

server <- function(input, output, session) {

  rv <- reactiveValues()

  rv$theme <- "light"

  observeEvent(session,{
    init_cookie_theme(input$dark_mode)
  }, once = TRUE)

  observeEvent(input$dark_mode,{

    change_theme(input$dark_mode)

    # theme to be used for the graphs
    if (isTRUE(input$dark_mode)) {
      rv$theme <- "dark"
    } else {
      rv$theme <- "light"
    }

  }, ignoreInit = TRUE)

  output$my_logo <- renderUI({

    if (rv$theme == "light") {
      tags$img(src = "datalab-logo-lightmode.png", width = "150px")
    } else if (rv$theme == "dark") {
      tags$img(src = "datalab-logo-darkmode.png", width = "150px")
    }

  })

  output$my_table <- DT::renderDT({

    iris %>%
      head() %>%
      DT::datatable()

  })

  my_ggplot2_plot <- ggplot(data = iris) +
    aes(x = Sepal.Width, fill = Species) +
    geom_density(alpha = 0.6, color = NA) +
    labs(title = "Largeur des s\u00e9pales des iris",
         subtitle = "Ceci est un graphique qui respecte la charte Bordeaux M\u00e9tropole",
         x = "Largeur des s\u00e9pales",
         y = "Densit\u00e9",
         fill = "Vari\u00e9t\u00e9 d\'iris",
         caption = "Light mode") +
    scale_fill_bdxmetro_discrete()

  output$my_plot <- renderPlot({

    my_ggplot2_plot +
      theme_bdxmetro(theme = rv$theme)

  })

}

shinyApp(ui, server)

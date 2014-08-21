library(shiny)
     shinyUI(
  navbarPage("mtvehicle dataset",
             tabPanel("Detail",
                      h2("Motor vehicle Road Tests"),
                      hr(),
                      h3("Description"),
                      helpText("The data was extracted from the Motor Trend US magazine,",
                               " and comprises fuel consumption and 10 aspects of automobile design and performance",
                               " for 25 automobiles (1973–74 models)."),
                      h3("Format"),
                      p("A data frame with 28 observations on 11 variables."),
                        
                      p("  [, 1]   mpg	 Miles/(US) gallon"),
                      p("  [, 2]	 cyl	 Number of cylinders"),

                      p("  [, 3]	 hp	 Gross horsepower"),

                      p("  [, 4]	 wt	 Weight (lb/1000)"),

                      p("  [, 5]	 vs	 V/S"),
                      p("  [, 6]	 am	 Transmission (0 = automatic, 1 = manual)"),
                      p("  [,7]	 gear	 Number of forward gears"),
                      p("  [,8]	 carb	 Number of carburetors"),
                      
                      h3("Source"),
                      
                      p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391–411.")
             ),
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("The relationship between variables and miles per gallon (MPG)"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Number of cylinders" = "cyl",

                                          "Gross horsepower" = "hp",

                                          "Weight (lb/1000)" = "wt",

                                          "V/S" = "vs",
                                          "Transmission" = "am",
                                          "Number of forward gears" = "gear",
                                          "Number of carburetors" = "carb"
                                        )),
                            
                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                        tabPanel("Regression model", 
                                                 plotOutput("mpgPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("SourceCode",
                      p("part1_devdataprod-shiny"),
                      a("https://github.com/Saranyatkp/Motor-Vehicle-Road-Tests")
             ),
             tabPanel("Special",
                      a("https://github.com/Saranyatkp/Motor-Vehicle-Road-Tests"),
                      hr(),
                      tags$iframe(src="part0_regmods-mtcars.html", 
                                  width="100%", height=500, frameborder=0, 
                                  seamless=NA)
             )
  )
)

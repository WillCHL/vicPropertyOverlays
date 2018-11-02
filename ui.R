library(shiny)
library(leaflet)

navbarPage("Victorian Property Info", theme="styles.css",
           tabPanel("map",
                    div(class="outer",
                        
                        # If not using custom CSS, set height of leafletOutput to a number instead of percent
                        leafletOutput("map", width="100%", height="100%")
                        
                    )
           ), tabPanel("Planning Overlay Legend",
                       img(src="http://services.land.vic.gov.au/catalogue/publicproxy/guest/dv_geoserver/datavic/ows?service=WMS&request=GetLegendGraphic&format=image/png&width=20&height=20&layer=VMPLAN_PLAN_OVERLAY")))

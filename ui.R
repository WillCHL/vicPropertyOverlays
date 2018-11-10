library(shiny)
library(leaflet)

# Add google tracking


navbarPage("Victorian Property Info", theme="styles.css",
           tabPanel("map",
                    div(class="outer",
                        
                        # If not using custom CSS, set height of leafletOutput to a number instead of percent
                        leafletOutput("map", width="100%", height="100%")
                        
                    )
            # About panel includes legends on the left to keep the map clear
           ), tabPanel("legend | about",
                       column(5,
                            h3("Planning Overlay Legend"),
                            img(src="http://services.land.vic.gov.au/catalogue/publicproxy/guest/dv_geoserver/datavic/ows?service=WMS&request=GetLegendGraphic&format=image/png&width=20&height=20&layer=VMPLAN_PLAN_OVERLAY"),
                            h3("Easements Legend"),
                            img(src="http://services.land.vic.gov.au/catalogue/publicproxy/guest/dv_geoserver/datavic/ows?service=WMS&request=GetLegendGraphic&format=image/png&width=20&height=20&layer=VMPROP_EASEMENT")
                            
                            
                            ),
                       column(6,
                              h3("About"),
                              p("While investigating some properties we were looking to buy I discovered a few handy open datasets
                                that I thought would be hepful as a lightweight app."),
                              p("Unfortunately the layout isn't perfect for mobile devices, I might try and fix it one day 
                                but I've found it to be more than functional enough for now."),
                              p("One more thing to note is that some layers won't show up at some zoom levels, so you might need to zoom 
                                in a bit for things like 1-5m contours or the address layer."),
                              h4("Planning Overlay"),
                              p("This dataset contains polygon features representing overlay controls for all Victorian planning schemes. 
                                Overlays reflect specific characteristics of land in an area, such as areas of significant vegetation or 
                                heritage value."),
                              p(tags$a(href="https://www.data.vic.gov.au/data/dataset/planning-scheme-overlay-vicmap-planning", "data")),
                              h4("Easements"),
                              p("Approved and proposed easements represented as lines in a layer belonging to Vicmap Property. 
                                Only a subset of easements have been captured."),
                              p(tags$a(href="https://www.data.vic.gov.au/data/dataset/easement-vicmap-property", "data")),
                              h4("Property Address"),
                              p("This layer consists of polygons representing Victoria's properties and their address."),
                              p(tags$a(href="https://www.data.vic.gov.au/data/dataset/property-view-vicmap-property", "data")),
                              h4("Contours(Metro 5-10m)"),
                              p("This layer is part of Vicmap Elevation 1-5 Contours & Relief, a subset of Vicmap Elevation. 
                                It contains relief features represented by lines at 1 metre intervals with some areas at 5 metres intervals. 
                                Data has been derived from Melbourne Water base maps and converted to Microstation .DGN format. Data is incomplete 
                                i.e. there are 'holes' in the data where for example there are quarries, or large building sites."),
                              p(tags$a(href="https://www.data.vic.gov.au/data/dataset/metro-contour-1-5-metre-vicmap-elevation", "data")),
                              h4("Contours (Vic 10-20m"),
                              p("This layer is part of Vicmap Elevation 10-20 Contours & Relief, a subset of Vicmap Elevation. It contains 
                                topographical relief features represented by lines. Data has been derived from Land Victoria's State Digital 
                                Map Base topographic data and converted from Microstation .DGN format to Arc/Info format."),
                              p(tags$a(href="https://www.data.vic.gov.au/data/dataset/vicmap-elevation-10-20m-contours", "data"))
                        )
            )
                       
            )

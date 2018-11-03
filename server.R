library(leaflet)
library(leaflet.extras)

function(input, output, session) {
    
    # Create the map
    output$map <- renderLeaflet({
        leaflet() %>%
            addSearchOSM() %>%
            addControlGPS(options = gpsOptions(position = "bottomleft", activate = TRUE, 
                                                    autoCenter = TRUE, maxZoom = 15, 
                                                    setView = TRUE)) %>%
            addProviderTiles(providers$Esri.WorldImagery, group = "ESRI Satelite") %>%
            addProviderTiles(providers$CartoDB.Positron, group = "OSM Lite") %>%
            addTiles(group = "OSM") %>%
            addWMSTiles(baseUrl=landWMS, layers=planning_overlays, 
                        group="Planning Overlay",
                        options=WMSTileOptions(format="image/png",transparent=TRUE)) %>%
            addWMSTiles(baseUrl=landWMS, layers=easements_layer, 
                        group="Easements",
                        options=WMSTileOptions(format="image/png",transparent=TRUE)) %>%
            addWMSTiles(baseUrl=landWMS, layers=address_layer, 
                        group="Propery Address",
                        options=WMSTileOptions(format="image/png",transparent=TRUE)) %>%
            addWMSTiles(baseUrl=landWMS, layers=contour_layer, 
                        group="Contours",
                        options=WMSTileOptions(format="image/png",transparent=TRUE)) %>%
            addLayersControl(
                baseGroups = c("OSM", "OSM Lite", "ESRI Satelite"),
                overlayGroups = c("Planning Overlay", "Easements",
                                  "Propery Address", "Contours"),
                options = layersControlOptions(collapsed = FALSE),
                position = "bottomright") %>%
            # addWMSLegend(uri = planning_legend, position = "bottomright", 
            #              layerId = "Planning Overlay") %>%
            setView(lng = 145.07, lat = -37.84, zoom = 12) %>% 
            hideGroup(c("Planning Overlay", "Easements", "Contours",
                        "Propery Address", "OSM Lite", "ESRI Satelite"))
  
              
})
    }

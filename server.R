library(leaflet)
library(leaflet.extras)

function(input, output, session) {
    
    # Create the map
    output$map <- renderLeaflet({
        leaflet() %>%
            addSearchOSM() %>%
            addControlGPS(options = gpsOptions(position = "bottomleft", activate = TRUE, 
                                                    autoCenter = TRUE, maxZoom = 17, 
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
            addWMSTiles(baseUrl=landWMS, layers=contour_layer1, 
                        group="Contours (Metro 1-5m)",
                        options=WMSTileOptions(format="image/png",transparent=TRUE)) %>%
            addWMSTiles(baseUrl=landWMS, layers=contour_layer2, 
                        group="Contours (Vic 10-20m)",
                        options=WMSTileOptions(format="image/png",transparent=TRUE)) %>%
            addLayersControl(
                baseGroups = c("OSM", "OSM Lite", "ESRI Satelite"),
                overlayGroups = c("Planning Overlay", "Easements",
                                  "Propery Address", "Contours (Metro 1-5m)",
                                  "Contours (Vic 10-20m)"),
                options = layersControlOptions(collapsed = FALSE),
                position = "bottomright") %>%
            # addWMSLegend(uri = planning_legend, position = "bottomright", 
            #              layerId = "Planning Overlay") %>%
            setView(lng = 145.07, lat = -37.84, zoom = 12) %>% 
            hideGroup(c("Planning Overlay", "Easements", "Contours (Metro 1-5m)", "Contours (Vic 10-20m)",
                        "Propery Address", "OSM Lite", "ESRI Satelite"))
  
              
})
    }

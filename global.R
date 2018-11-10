library(leaflet)
library(shiny)

landWMS <- "https://services.land.vic.gov.au/catalogue/publicproxy/guest/dv_geoserver/wms"

planning_overlays <- "VMPLAN_PLAN_OVERLAY"
easements_layer <- "VMPROP_EASEMENT"
address_layer <- "VMPROP_PROPERTY_ADDRESS"
contour_layer1 <- "VMELEV_EL_CONTOUR_1TO5M"
contour_layer2 <- "VMELEV_EL_CONTOUR"

# planning_legend <- "http://services.land.vic.gov.au/catalogue/publicproxy/guest/dv_geoserver/datavic/ows?service=WMS&request=GetLegendGraphic&format=image/png&width=20&height=20&layer=VMPLAN_PLAN_OVERLAY"


# 
# leaflet() %>%
#     addProviderTiles(providers$CartoDB.Positron, group = "OSM Lite") %>%
#     addWMSTiles(baseUrl=landWMS, layers=address_layer,
#                 options=WMSTileOptions(format="image/png",transparent=TRUE)) %>%
#     setView(lng = 145.07, lat = -37.84, zoom = 12)

library(readxl)
library(dplyr)
library(sf)

all_pts = read_excel("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/output_file.xlsx")
genbank = read_excel("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Genbank.xlsx")

library(sf)
library(leaflet)

# Read and clean each KML file individually
kml_one  <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Coastal Cutthroat - Native Range.kml"),  drop = TRUE, what = "ZM")
kml_two  <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Lahontan Cutthroat Trout - Native Range.kml"),  drop = TRUE, what = "ZM")
kml_three <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Humboldt Cutthroat Trout - Native Range.kml"), drop = TRUE, what = "ZM")
kml_four <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Quinn River Cutthroat Trout - Native Range.kml"), drop = TRUE, what = "ZM")
kml_five <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Willow-Whitehorse (Coyote Basin) Cutthroat - Native Range.kml"), drop = TRUE, what = "ZM")
Lahontan_sf <- rbind(kml_two, kml_three, kml_four, kml_five)
Lahontan_polygon <- st_union(Lahontan_sf)
Lahontan_polygon <- st_sf(Name = "Lahontan group", geometry = Lahontan_polygon)



kml_six <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/John Day Westslope Cutthroat - Native Range.kml"), drop = TRUE, what = "ZM")
kml_seven <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Missouri River Westslope Cutthroat - Native Range.kml"), drop = TRUE, what = "ZM")
kml_eight <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Neoboreal Westslope Cutthroat Trout - Native Range.kml"), drop = TRUE, what = "ZM")
kml_nine <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Coeur d'Alene Westslope Cutthroat - Native Range.kml"), drop = TRUE, what = "ZM")
kml_ten <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/St. Joe Westslope Cutthroat - Native Range.kml"), drop = TRUE, what = "ZM")
kml_eleven <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/North Fork Clearwater Westslope Cutthroat - Native Range.kml"), drop = TRUE, what = "ZM")
kml_twelve <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Clearwater Headwaters Westslope Cutthroat Trout - Native Range.kml"), drop = TRUE, what = "ZM")
kml_thirteen <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Clearwater-Eastern Cascades Westslope Cutthroat - Native Range.kml"), drop = TRUE, what = "ZM")
kml_fourteen <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Salmon River Westslope Cutthroat - Native Range.kml"), drop = TRUE, what = "ZM")
Westslope_sf <- rbind(kml_six, kml_seven, kml_eight, kml_nine, kml_ten, kml_eleven, kml_twelve, kml_thirteen, kml_fourteen)
Westslope_polygon <- st_union(Westslope_sf)
Westslope_polygon <- st_sf(Name = "Westslope group", geometry = Westslope_polygon)


kml_fifteen <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Yellowstone Cutthroat Trout - Native Range.kml"), drop = TRUE, what = "ZM")
kml_finespotted <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Yellowstone Cutthroat Trout - Native Range.kml",
                                 layer = "Snake River Finespotted Cutthroat - Native Range.kmz"))
kml_bear <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Bonneville Cutthroat and Bear River Cutthroat - Native Range (1).kml",
                          layer = "Bear River Cutthroat - Native Range.kmz"))
kml_bonneville <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Bonneville Cutthroat and Bear River Cutthroat - Native Range (1).kml",
                                layer = "Bonneville Cutthroat - Native Range.kmz"))
kml_seventeen <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Green River Cutthroat Trout - Native Range.kml"), drop = TRUE, what = "ZM")
kml_eighteen <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Colorado River Cutthroat Trout - Native Range.kml"), drop = TRUE, what = "ZM")
kml_nineteen <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/San Juan Cutthroat - Native Range.kml"), drop = TRUE, what = "ZM")
kml_twenty <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Greenback Cutthroat Trout - Native Range.kml"), drop = TRUE, what = "ZM")
kml_twentyone <- st_zm(st_read(
  "/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Rio Grande Cutthroat - Native Range.kml",
  layer = "Rio Grande Cutthroat - Native Range.kmz"))

kml_twentytwo <- st_zm(st_read("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Map/Yellowfin Polyg.kml"), drop = TRUE, what = "ZM")
# Create leaflet map and add each polygon



m <- leaflet(options = leafletOptions(zoomControl = FALSE, zoomSnap = 0.1, zoomDelta = 0.1)) %>%
  addProviderTiles(providers$CartoDB.PositronNoLabels) %>%
  addPolygons(data = kml_one, color = "transparent", weight = 0.5, fillColor = "#ff9896", fillOpacity = 0.3, popup = ~Name) %>%
  addPolygons(data = Lahontan_polygon, color = "transparent", weight = 0.5, fillColor = "#8c564b", fillOpacity = 0.3, popup = ~Name) %>%
  addPolygons(data = Westslope_polygon, color = "transparent", weight = 0.5, fillColor = "#9467bd", fillOpacity = 0.3, popup = ~Name) %>%
  addPolygons(data = kml_fifteen, color = "transparent", weight = 0.5, fillColor = "#d3d200", fillOpacity = 0.3, popup = ~Name) %>%
  addPolygons(data = kml_finespotted, color = "transparent", weight = 0.5, fillColor = "#d3d200", fillOpacity = 0.3, popup = ~Name) %>%
  addPolygons(data = kml_bear, color = "transparent", weight = 0.5, fillColor = "#e377c2", fillOpacity = 0.3, popup = ~Name) %>%
  addPolygons(data = kml_bonneville, color = "transparent", weight = 0.5, fillColor = "#7f7f7f", fillOpacity = 0.3, popup = ~Name) %>%
  addPolygons(data = kml_seventeen, color = "transparent", weight = 0.5, fillColor = "#98df8a", fillOpacity = 0.3, popup = ~Name) %>%
  addPolygons(data = kml_eighteen, color = "transparent", weight = 0.5, fillColor = "#17becf", fillOpacity = 0.3, popup = ~Name) %>%
  addPolygons(data = kml_nineteen, color = "transparent", weight = 0.5, fillColor = "#d62728", fillOpacity = 0.3, popup = ~Name) %>%
  addPolygons(data = kml_twenty, color = "transparent", weight = 0.5, fillColor = "#c5b0d5", fillOpacity = 0.3, popup = ~Name) %>%
  addPolygons(data = kml_twentyone, color = "transparent", weight = 0.5, fillColor = "#ffbb78", fillOpacity = 0.3, popup = ~Name) %>%
  addPolylines(data = kml_twentytwo,
               color = "red",
               weight = 2,
               dashArray = "4,6",  # dashed line: 4px line, 6px space
               opacity = 1,
               popup = ~Name) 

m <- m %>%
  addCircleMarkers(
    data = all_pts,
    lng = ~longitude,
    lat = ~latitude,
    radius = 3,
    color = "black",
    fillOpacity = 0.8,
    stroke = FALSE
  ) %>%
  addCircleMarkers(
    data = genbank,
    lng = ~longitude,
    lat = ~latitude,
    radius = 3,
    color = "#ff2400",     # Outline color
    fill = "#ff2400",        # No fill
    stroke = TRUE,  # Draw border
    fillOpacity = 0.8,
    weight = 1           # Outline thickness
  )

m <- m %>%
  addControl(
    html = "
    <div class='custom-legend'>
      <svg height='10' width='10'>
        <circle cx='5' cy='5' r='4' stroke='black' stroke-width='1' fill='black' />
      </svg> New Samples<br>
      <svg height='10' width='10'>
        <circle cx='5' cy='5' r='4' stroke='#ff2400' stroke-width='1' fill='#ff2400' />
      </svg> Genbank Samples
    </div>
    ",
    position = "bottomright"
  )
library(htmlwidgets)

m <- htmlwidgets::onRender(m, "
  function(el, x) {
    var legend = el.querySelector('.custom-legend');
    legend.style.position = 'absolute';
    legend.style.bottom = '3.68in';           // move it up more (try 3in, 4in, or 200px, etc.)
    legend.style.right = '1px';           // adjust if you want it more centered
    legend.style.width = '180px';          // make it wider (adjust as needed)
    legend.style.background = 'white';
    legend.style.padding = '10px';
    legend.style.borderRadius = '5px';
    legend.style.boxShadow = '0 0 5px rgba(0,0,0,0.3)';
  }
")
legend_html <- "
<div style='max-height: 300px; overflow-y: auto;'>
  <strong>Cutthroat Trout Ranges</strong><br>
  <div style='display: flex; align-items: center; margin-bottom: 4px;'>
    <div style='width: 20px; height: 10px; background-color: rgba(255,152,150,0.4); margin-right: 5px;'></div>
    Coastal Cutthroat Trout
  </div>
  <div style='display: flex; align-items: center; margin-bottom: 4px;'>
    <div style='width: 20px; height: 10px; background-color: rgba(140,86,75,0.4); margin-right: 5px;'></div>
    Lahontan Cutthroat Trout
  </div>
  <div style='display: flex; align-items: center; margin-bottom: 4px;'>
    <div style='width: 20px; height: 10px; background-color: rgba(148,103,189,0.4); margin-right: 5px;'></div>
    Westslope Cutthroat Trout
  </div>
  <div style='display: flex; align-items: center; margin-bottom: 4px;'>
    <div style='width: 20px; height: 10px; background-color: rgba(211,210,0,0.4); margin-right: 5px;'></div>
    Yellowstone Cutthroat Trout
  </div>
  <div style='display: flex; align-items: center; margin-bottom: 4px;'>
    <div style='width: 20px; height: 10px; background-color: rgba(227,119,194,0.4); margin-right: 5px;'></div>
    Bear River Cutthroat Trout
  </div>
  <div style='display: flex; align-items: center; margin-bottom: 4px;'>
    <div style='width: 20px; height: 10px; background-color: rgba(127,127,127,0.4); margin-right: 5px;'></div>
    Bonneville Cutthroat Trout
  </div>
  <div style='display: flex; align-items: center; margin-bottom: 4px;'>
    <div style='width: 20px; height: 10px; background-color: rgba(152,223,138,0.4); margin-right: 5px;'></div>
    Green River Cutthroat Trout
  </div>
  <div style='display: flex; align-items: center; margin-bottom: 4px;'>
    <div style='width: 20px; height: 10px; background-color: rgba(23,190,207,0.4); margin-right: 5px;'></div>
    Uncompahgre Cutthroat Trout
  </div>
  <div style='display: flex; align-items: center; margin-bottom: 4px;'>
    <div style='width: 20px; height: 10px; background-color: rgba(214,39,40,0.4); margin-right: 5px;'></div>
    San Juan Cutthroat Trout
  </div>
  <div style='display: flex; align-items: center; margin-bottom: 4px;'>
    <div style='width: 20px; height: 10px; background-color: rgba(197,176,213,0.4); margin-right: 5px;'></div>
    Greenback Cutthroat Trout
  </div>
  <div style='display: flex; align-items: center; margin-bottom: 4px;'>
    <div style='width: 20px; height: 10px; background-color: rgba(255,187,120,0.4); margin-right: 5px;'></div>
    Rio Grande Cutthroat Trout
  </div>
  <div style='display: flex; align-items: center; margin-bottom: 4px;'>
    <div style='width: 20px; height: 0; border-top: 2px dotted rgba(255,0,0,1); margin-right: 5px;'></div>
    Putative Yellowfin Cutthroat Trout Range
  </div>
</div>
"

m <- m %>%
  addControl(html = legend_html, position = "topright")
m

library(raster)
library(sf)

# aggregate and re-project raster file(s)
if(!file.exists("data/Lake_Erie_bathymetry (raster)/erie_lld_agg.tif")){
  # setwd("_episodes_rmd")
  erie_bathy <-
    raster("data/Lake_Erie_bathymetry (raster)/erie_lld.tif")
  erie_bathy <- aggregate(erie_bathy, fact = 4)
  erie_bathy <- raster::projectRaster(erie_bathy, crs = sf::st_crs(26917)$proj4string)
  writeRaster(erie_bathy, "data/Lake_Erie_bathymetry (raster)/erie_lld_agg.tif",
              overwrite = TRUE)
}else{
  erie_bathy <- raster("data/Lake_Erie_bathymetry (raster)/erie_lld_agg.tif")
}

if(!file.exists("data/Lake_Erie_Walleye_Management_Units/Lake_Erie_Walleye_Management_Units_utm.shp")){
  erie_zones <- st_read("data/Lake_Erie_Walleye_Management_Units/Lake_Erie_Walleye_Management_Units.shp")
  erie_zones <- sf::st_transform(erie_zones, 26917)
  sf::st_write(erie_zones, "data/Lake_Erie_Walleye_Management_Units/Lake_Erie_Walleye_Management_Units_utm.shp")
}else{
  erie_zones <- sf::st_read("data/Lake_Erie_Walleye_Management_Units/Lake_Erie_Walleye_Management_Units_utm.shp")
}

if(!file.exists("data/Lake_Erie_Shoreline/Lake_Erie_Shoreline_utm.shp")){
  erie_outline <- st_read("data/Lake_Erie_Shoreline/Lake_Erie_Shoreline.shp")
  erie_outline <- sf::st_transform(erie_zones, 26917)
  sf::st_write(erie_outline, "data/Lake_Erie_Shoreline/Lake_Erie_Shoreline_utm.shp")
}else{
  erie_outline <- sf::st_read("data/Lake_Erie_Shoreline/Lake_Erie_Shoreline_utm.shp")
}

if(!file.exists("data/Two_Interpolated_Fish_Tracks_utm.csv")){
  fish_tracks         <-
    read.csv("data/Two_Interpolated_Fish_Tracks.csv")
  fish_tracks         <- fish_tracks[,-which(names(fish_tracks) == "X")]
  fish_tracks         <- st_as_sf(fish_tracks,
                          coords = c("longitude", "latitude"),
                          crs = 4326)
  fish_tracks         <- st_transform(fish_tracks, 26917)
  coords              <- st_coordinates(fish_tracks)
  fish_tracks         <- cbind(st_drop_geometry(fish_tracks), coords)
  fish_tracks$utmZone <- 17
  write.csv(fish_tracks, "data/Two_Interpolated_Fish_Tracks_utm.csv",
            row.names = FALSE)
}else{
  fish_tracks <- read.csv("data/Two_Interpolated_Fish_Tracks_utm.csv",
                          stringsAsFactors = FALSE)
}

erie_contours <- sf::st_read("data/Lake_Erie_bathymetric_contours/bathymetry_lake_erie.shp")

## move files to learner repo release
# dir.create("data/learner_data")
# sf::st_write(erie_outline, "data/learner_data/erie_outline.shp")
# sf::st_write(erie_contours, "data/learner_data/erie_contours.shp")
# sf::st_write(erie_zones, "data/learner_data/erie_zones.shp")
# write.csv(fish_tracks, "data/learner_data/fish_tracks.csv", row.names = FALSE)
# raster::writeRaster(erie_bathy, "data/learner_data/erie_bathy.tif")

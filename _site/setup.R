library(raster)

# TODO: download files from learner repo release
# use datastorr?

# aggregate and re-project raster file(s)
if(!file.exists("data/Lake_Erie_bathymetry (raster)/erie_lld_agg.tif")){
  # setwd("_episodes_rmd")
  DSM_HARV <-
    raster("data/Lake_Erie_bathymetry (raster)/erie_lld.tif")
  DSM_HARV <- aggregate(DSM_HARV, fact = 4)
  DSM_HARV <- raster::projectRaster(DSM_HARV, crs = sf::st_crs(26917)$proj4string)
  writeRaster(DSM_HARV, "data/Lake_Erie_bathymetry (raster)/erie_lld_agg.tif",
              overwrite = TRUE)
}

if(!file.exists("data/Lake_Erie_Walleye_Management_Units/Lake_Erie_Walleye_Management_Units_utm.shp")){
  erie_zones <- st_read("data/Lake_Erie_Walleye_Management_Units/Lake_Erie_Walleye_Management_Units.shp")
  erie_zones <- sf::st_transform(erie_zones, 26917)
  sf::st_write(erie_zones, "data/Lake_Erie_Walleye_Management_Units/Lake_Erie_Walleye_Management_Units_utm.shp")
}

if(!file.exists("data/Lake_Erie_Shoreline/Lake_Erie_Shoreline_utm.shp")){
  erie_outline <- st_read("data/Lake_Erie_Shoreline/Lake_Erie_Shoreline.shp")
  erie_outline <- sf::st_transform(erie_zones, 26917)
  sf::st_write(erie_outline, "data/Lake_Erie_Shoreline/Lake_Erie_Shoreline_utm.shp")
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
}

# if (! file.exists("data/NEON-DS-Site-Layout-Files")) {
#     dest <- tempfile()
#     download.file("https://ndownloader.figshare.com/files/3708751", dest,
#                   mode = "wb")
#     unzip(dest, exdir = "data")
# }
#
# if (! file.exists("data/NEON-DS-Airborne-Remote-Sensing")) {
#     dest <- tempfile()
#     download.file("https://ndownloader.figshare.com/files/3701578", dest,
#                   mode = "wb")
#     unzip(dest, exdir = "data")
# }
#
# if (! file.exists("data/NEON-DS-Met-Time-Series")) {
#     dest <- tempfile()
#     download.file("https://ndownloader.figshare.com/files/3701572", dest,
#                   mode = "wb")
#     unzip(dest, exdir = "data")
# }
#
# if (! file.exists("data/NEON-DS-Landsat-NDVI")) {
#     dest <- tempfile()
#     download.file("https://ndownloader.figshare.com/files/4933582", dest,
#                   mode = "wb")
#     unzip(dest, exdir = "data")
# }
#
# if (! file.exists("data/Global/Boundaries/ne_110m_graticules_all")) {
#     dest <- tempfile()
#     download.file("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/physical/ne_110m_graticules_all.zip",
#                   dest, mode = "wb")
#     unzip(dest, exdir = "data/Global/Boundaries/ne_110m_graticules_all")
# }
#
# if (! file.exists("data/Global/Boundaries/ne_110m_land")) {
#     dest <- tempfile()
#     download.file("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/physical/ne_110m_land.zip",
#                   dest, mode = "wb")
#     unzip(dest, exdir = "data/Global/Boundaries/ne_110m_land")
# }

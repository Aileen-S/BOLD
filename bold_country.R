library(tidyverse)
library(bold)
library(getopt)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)

spec <- matrix(c(
  'taxon',   't', 2, 'character', 'BOLD search term',
  'input',   'i', 2, 'character', 'BOLD csv file (instead of --taxon)',
  'output',  'o', 1, 'character', 'Output metadata csv',
  'raw',     'r', 2, 'logical',   'Also save raw metadata before processing',
  'country', 'c', 2, 'character', 'Limit output to specified country'
), byrow = T, ncol = 5)

opt <- getopt(spec)


out <- bold_seqspec(taxon='Longitarsus')


if ( !is.null(opt$taxon) ) {
  out <- bold_seqspec(taxon=opt$taxon)
} else {
  out <- read.csv(opt$input)
} 

if ( !is.null(opt$raw) ) {
  write.csv(out, paste('raw', opt$output, sep = '_'), row.names = FALSE)
}

print(paste(nrow(out), 'records found'))

# Remove records without coordinates
meta <- out[!is.na(out$lat),]
meta <- meta[!is.na(meta$lon),]
print(paste(nrow(meta), 'records with location data'))

meta <- meta %>% select(lon, lat, country)

# Create a simple features (sf) data frame
sf_points <- st_as_sf(meta, coords = c("lon", "lat"), crs = 4326)


# Load a world map with countries using 'rnaturalearth' package
world <- rnaturalearth::ne_countries(scale = "medium", returnclass = "sf")
#sf_use_s2(FALSE)
#map <- st_make_valid(world)
#map <- st_crop(map, xmin = 72, ymin = 17, xmax = 136, ymax = 55)
#sf_use_s2(TRUE)

#map <- world %>% st_simplify(dTolerance = 10000) 

# Probably best not to do it this way but works for now
sf_use_s2(FALSE)
# Perform a spatial join to get the country information for each point
result <- st_join(sf_points, world)

# Add the country names to your original data frame
meta$output <- result$admin

library(tidyverse)
library(bold)
library(getopt)

uk_total = data.frame(family = c("Aderidae", "Alexiidae", "Anthicidae", "Anthribidae", "Apionidae", "Attelabidae", "Biphyllidae", "Bostrichidae", "Bothrideridae", "Buprestidae", "Byrrhidae", "Byturidae", "Cantharidae", "Carabidae", "Cerambycidae", "Cerylonidae", "Chrysomelidae", "Ciidae", "Clambidae", "Cleridae", "Coccinellidae", "Colydiidae", "Corylophidae", "Cryptophagidae", "Cucujidae", "Curculionidae", "Dascillidae", "Dasytidae", "Dermestidae", "Derodontidae", "Drilidae", "Dryophthoridae", "Dryopidae", "Dytiscidae", "Elateridae", "Elmidae", "Endomychidae", "Erirhinidae", "Erotylidae", "Eucinetidae", "Eucnemidae", "Georissidae", "Geotrupidae", "Gyrinidae", "Haliplidae", "Helophoridae", "Heteroceridae", "Histeridae", "Hydraenidae", "Hydrochidae", "Hydrophilidae", "Hygrobiidae", "Kateretidae", "Laemophloeidae", "Lampyridae", "Latridiidae", "Leiodidae", "Limnichidae", "Lucanidae", "Lycidae", "Lymexylidae", "Malachiidae", "Megalopodidae", "Melandryidae", "Meloidae", "Monotomidae", "Mordellidae", "Mycetophagidae", "Mycteridae", "Nanophyidae", "Nemonychidae", "Nitidulidae", "Noteridae", "Oedemeridae", "Orsodacnidae", "Phalacridae", "Phloiophilidae", "Platypodidae", "Psephenidae", "Ptiliidae", "Ptilodactylidae", "Ptinidae", "Pyrochroidae", "Pythidae", "Raymondionymidae", "Rhynchitidae", "Ripiphoridae", "Salpingidae", "Scarabaeidae", "Scirtidae", "Scraptiidae", "Silphidae", "Silvanidae", "Spercheidae", "Sphaeritidae", "Sphaeriusidae", "Sphindidae", "Staphylinidae", "Tenebrionidae", "Tetratomidae", "Throscidae", "Trogidae", "Trogossitidae"),
                   uk = c(3, 1, 13, 9, 90, 2, 2, 10, 5, 18, 13, 2, 42, 374, 69, 5, 286, 22, 10, 15, 53, 12, 11, 105, 2, 493, 1, 9, 40, 1, 1, 4, 9, 120, 73, 12, 8, 13, 8, 1, 7, 1, 8, 12, 19, 20, 8, 52, 34, 7, 72, 1, 9, 11, 3, 56, 95, 1, 4, 3, 2, 17, 3, 17, 11, 24, 17, 15, 1, 2, 1, 91, 2, 10, 2, 15, 1, 2, 1, 75, 1, 57, 3, 1, 1, 19, 1, 11, 88, 20, 17, 21, 12, 1, 1, 1, 2, 1130, 47, 4, 5, 3, 5))

canada_total = data.frame(family = c("Cupedidae", "Micromalthidae", "Amphizoidae", "Carabidae", "Dytiscidae", "Gyrinidae", "Haliplidae", "Noteridae", "Rhysodidae", "Trachypachidae", "Eucinetidae", "Clambidae", "Scirtidae", "Histeridae", "Georissidae", "Helophoridae", "Hydrochidae", "Hydrophilidae", "Sphaeritidae", "Agyrtidae", "Hydraenidae", "Leiodidae", "Ptiliidae", "Silphidae", "Staphylinidae", "Geotrupidae", "Glaphyridae", "Glaresidae", "Hybosoridae", "Lucanidae", "Ochodaeidae", "Passalidae", "Scarabaeidae", "Trogidae", "Rhipiceridae", "Buprestidae", "Byrrhidae", "Dryopidae", "Elmidae", "Heteroceridae", "Limnichidae", "Lutrochidae", "Psephenidae", "Ptilodactylidae", "Artematopodidae", "Cantharidae", "Elateridae", "Eucnemidae", "Lampyridae", "Lycidae", "Phengodidae", "Throscidae", "Derodontidae", "Nosodendridae", "Bostrichidae", "Dermestidae", "Endecatomidae", "Ptinidae", "Lymexylidae", "Aderidae", "Anthicidae", "Boridae", "Ciidae", "Ischaliidae", "Melandryidae", "Meloidae", "Mordellidae", "Mycetophagidae", "Mycteridae", "Oedemeridae", "Prostomidae", "Pyrochroidae", "Pythidae", "Ripiphoridae", "Salpingidae", "Scraptiidae", "Stenotrachelidae", "Synchroidae", "Tenebrionidae", "Tetratomidae", "Zopheridae", "Biphyllidae", "Byturidae", "Cleridae", "Melyridae", "Trogossitidae", "Cucujidae", "Cryptophagidae", "Cybocephalidae", "Erotylidae", "Kateretidae", "Laemophloeidae", "Monotomidae", "Nitidulidae", "Passandridae", "Phalacridae", "Sphindidae", "Silvanidae", "Anamorphidae", "Bothrideridae", "Cerylonidae", "Coccinellidae", "Corylophidae", "Endomychidae", "Euxestidae", "Latridiidae", "Mycetaeidae", "Murmidiidae", "Teredidae", "Anthribidae", "Attelabidae", "Brachyceridae", "Brentidae", "Cimberididae", "Curculionidae", "Dryophthoridae", "Cerambycidae", "Chrysomelidae", "Megalopodidae", "Orsodacnidae"),
                          canada = c(11, 7, 3, 2, 65, 22, 5, 14, 1, 2, 24, 3, 18, 48, 178, 26, 1, 151, 983, 375, 4, 595, 29, 8, 7, 52, 162, 16, 68, 8, 3, 826, 1, 47, 8, 27, 6, 280, 385, 32, 1, 13, 28, 7, 39, 2, 1, 12, 1, 2, 34, 35, 27, 28, 137, 1, 27, 8, 113, 2, 8, 13, 32, 60, 181, 3, 14, 1, 29, 1, 7, 43, 46, 53, 1, 27, 75, 2, 1, 16, 4, 99, 2, 2, 4, 13, 1, 1, 1, 8, 1, 1, 4, 48, 4, 99, 21, 6, 1, 2, 11, 10, 220, 25, 20, 27, 16, 1, 6, 1774, 9, 2, 137, 1, 20, 8, 2, 15, 22, 19))


#merge <- merge(uk_total, canada_total, by = "family", all.x = TRUE, all.y = TRUE)

#write.csv(merge, "../country_counts.csv", row.names = FALSE)

# Function to retrieve the number of species for a specific family
UKCount <- function(family) {
  subset_data <- subset(uk_total, Family == family)
  if (nrow(subset_data) > 0) {
    return(subset_data$UK_Species)
  } else {
    return("Family not found")
  }
}

CanadaCount <- function(family) {
  subset_data <- subset(canada_total, Family == family)
  if (nrow(subset_data) > 0) {
    return(subset_data$UK_Species)
  } else {
    return("Family not found")
  }
}


spec <- matrix(c(
  'taxon',   't', 1, 'character', 'Coleoptera family',
  'input',   'i', 2, 'character', 'input BOLD csv file (optional, otherwise will search BOLD)',
  'output',  'o', 1, 'character', 'Output file',
  'raw',     'r', 2, 'logical',   'Also save raw metadata before processing',
  'country', 'c', 2, 'character', 'Limit output to specified country'
), byrow = T, ncol = 5)

opt <- getopt(spec)


out <- bold_seqspec(taxon='Longitarsus')
#out <- read.csv('raw_Dytiscidae.csv')


if ( !is.null(opt$input) ) {
  out <- read.csv(opt$input)
} else {
  out <- bold_seqspec(taxon=opt$taxon)
}


if ( !is.null(opt$raw) ) {
  write.csv(out, paste('raw', opt$output, sep = '_'), row.names = FALSE)
}

print(paste(nrow(out), 'records found'))

# Remove records without BIN
meta <- out[!is.na(out$bin_uri),]
print(paste(nrow(meta), 'records with BIN'))

# Remove records without UK
meta <- meta %>% filter(country == opt$country)
print(paste(nrow(meta), 'records from', opt$country))

barcodes <- nrow(meta)
print(paste(barcodes, 'barcodes'))

BINs <- length(unique(meta$bin_uri))
print(paste(BINs, 'BINs'))

bar_bin <- barcodes/BINs
print(paste('Barcode:BIN ratio', bar_bin))

spec <- CanadaCount(opt$taxon)
coverage <- BINs/spec
if (coverage > 1) {
  coverage <- 1
}

print(paste(coverage, 'of species represented (approx)'))

sink(opt$output)
cat(paste(opt$taxon, barcodes, BINs, bar_bin, spec, coverage, '\n', sep = ','))
sink()
print(paste('Stats written to', opt$output))


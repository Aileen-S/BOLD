library(tidyverse)
library(bold)
library(getopt)



spec <- matrix(c(
  'taxon',   't', 1, 'character', 'Coleoptera family',
  'input',   'i', 2, 'character', 'input BOLD csv file (optional, otherwise will search BOLD)',
  'output',  'o', 1, 'character', 'Output file',
  'raw',     'r', 2, 'logical',   'Also save raw metadata before processing',
  'country', 'c', 2, 'character', 'Limit output to specified country'
), byrow = T, ncol = 5)

opt <- getopt(spec)

'United Kingdom' <- data.frame(family = c("Aderidae", "Alexiidae", "Anthicidae", "Anthribidae", "Apionidae", "Attelabidae", "Biphyllidae", "Bostrichidae", "Bothrideridae", "Buprestidae", "Byrrhidae", "Byturidae", "Cantharidae", "Carabidae", "Cerambycidae", "Cerylonidae", "Chrysomelidae", "Ciidae", "Clambidae", "Cleridae", "Coccinellidae", "Colydiidae", "Corylophidae", "Cryptophagidae", "Cucujidae", "Curculionidae", "Dascillidae", "Dasytidae", "Dermestidae", "Derodontidae", "Drilidae", "Dryophthoridae", "Dryopidae", "Dytiscidae", "Elateridae", "Elmidae", "Endomychidae", "Erirhinidae", "Erotylidae", "Eucinetidae", "Eucnemidae", "Georissidae", "Geotrupidae", "Gyrinidae", "Haliplidae", "Helophoridae", "Heteroceridae", "Histeridae", "Hydraenidae", "Hydrochidae", "Hydrophilidae", "Hygrobiidae", "Kateretidae", "Laemophloeidae", "Lampyridae", "Latridiidae", "Leiodidae", "Limnichidae", "Lucanidae", "Lycidae", "Lymexylidae", "Malachiidae", "Megalopodidae", "Melandryidae", "Meloidae", "Monotomidae", "Mordellidae", "Mycetophagidae", "Mycteridae", "Nanophyidae", "Nemonychidae", "Nitidulidae", "Noteridae", "Oedemeridae", "Orsodacnidae", "Phalacridae", "Phloiophilidae", "Platypodidae", "Psephenidae", "Ptiliidae", "Ptilodactylidae", "Ptinidae", "Pyrochroidae", "Pythidae", "Raymondionymidae", "Rhynchitidae", "Ripiphoridae", "Salpingidae", "Scarabaeidae", "Scirtidae", "Scraptiidae", "Silphidae", "Silvanidae", "Spercheidae", "Sphaeritidae", "Sphaeriusidae", "Sphindidae", "Staphylinidae", "Tenebrionidae", "Tetratomidae", "Throscidae", "Trogidae", "Trogossitidae"),
                               count = c(3, 1, 13, 9, 90, 2, 2, 10, 5, 18, 13, 2, 42, 374, 69, 5, 286, 22, 10, 15, 53, 12, 11, 105, 2, 493, 1, 9, 40, 1, 1, 4, 9, 120, 73, 12, 8, 13, 8, 1, 7, 1, 8, 12, 19, 20, 8, 52, 34, 7, 72, 1, 9, 11, 3, 56, 95, 1, 4, 3, 2, 17, 3, 17, 11, 24, 17, 15, 1, 2, 1, 91, 2, 10, 2, 15, 1, 2, 1, 75, 1, 57, 3, 1, 1, 19, 1, 11, 88, 20, 17, 21, 12, 1, 1, 1, 2, 1130, 47, 4, 5, 3, 5))


Canada <- data.frame(family = c("Aderidae", "Agyrtidae", "Amphizoidae", "Anamorphidae", "Anthicidae", "Anthribidae", "Artematopodidae", "Attelabidae", "Biphyllidae", "Boridae", "Bostrichidae", "Bothrideridae", "Brachyceridae", "Brentidae", "Buprestidae", "Byrrhidae", "Byturidae", "Cantharidae", "Carabidae", "Cerambycidae", "Cerylonidae", "Chrysomelidae", "Ciidae", "Cimberididae", "Clambidae", "Cleridae", "Coccinellidae", "Corylophidae", "Cryptophagidae", "Cucujidae", "Cupedidae", "Curculionidae", "Cybocephalidae", "Dermestidae", "Derodontidae", "Dryophthoridae", "Dryopidae", "Dytiscidae", "Elateridae", "Elmidae", "Endecatomidae", "Endomychidae", "Erotylidae", "Eucinetidae", "Eucnemidae", "Euxestidae", "Georissidae", "Geotrupidae", "Glaphyridae", "Glaresidae", "Gyrinidae", "Haliplidae", "Helophoridae", "Heteroceridae", "Histeridae", "Hybosoridae", "Hydraenidae", "Hydrochidae", "Hydrophilidae", "Ischaliidae", "Kateretidae", "Laemophloeidae", "Lampyridae", "Latridiidae", "Leiodidae", "Limnichidae", "Lucanidae", "Lutrochidae", "Lycidae", "Lymexylidae", "Megalopodidae", "Melandryidae", "Meloidae", "Melyridae", "Micromalthidae", "Monotomidae", "Mordellidae", "Murmidiidae", "Mycetaeidae", "Mycetophagidae", "Mycteridae", "Nitidulidae", "Nosodendridae", "Noteridae", "Ochodaeidae", "Oedemeridae", "Orsodacnidae", "Passalidae", "Passandridae", "Phalacridae", "Phengodidae", "Prostomidae", "Psephenidae", "Ptiliidae", "Ptilodactylidae", "Ptinidae", "Pyrochroidae", "Pythidae", "Rhipiceridae", "Rhysodidae", "Ripiphoridae", "Salpingidae", "Scarabaeidae", "Scirtidae", "Scraptiidae", "Silphidae", "Silvanidae", "Sphaeritidae", "Sphindidae", "Staphylinidae", "Stenotrachelidae", "Synchroidae", "Tenebrionidae", "Teredidae", "Tetratomidae", "Throscidae", "Trachypachidae", "Trogidae", "Trogossitidae", "Zopheridae"),
                     count = c(11, 7, 3, 2, 65, 22, 5, 14, 1, 2, 24, 3, 18, 48, 178, 26, 1, 151, 983, 375, 4, 595, 29, 8, 7, 52, 162, 16, 68, 8, 3, 826, 1, 47, 8, 27, 6, 280, 385, 32, 1, 13, 28, 7, 39, 2, 1, 12, 1, 2, 34, 35, 27, 28, 137, 1, 27, 8, 113, 2, 8, 13, 32, 60, 181, 3, 14, 1, 29, 1, 7, 43, 46, 53, 1, 27, 75, 2, 1, 16, 4, 99, 2, 2, 4, 13, 1, 1, 1, 8, 1, 1, 4, 48, 4, 99, 21, 6, 1, 2, 11, 10, 220, 25, 20, 27, 16, 1, 6, 1774, 9, 2, 137, 1, 20, 8, 2, 15, 22, 19))



Germany <- data.frame(family = c("Aderidae", "Agyrtidae", "Alleculidae", "Anobiidae", "Anthicidae", "Anthribidae", "Apionidae", "Aspidiphoridae", "Attelabidae", "Biphyllidae", "Bostrichidae", "Bothrideridae", "Bruchidae", "Buprestidae", "Byrrhidae", "Byturidae", "Cantharidae", "Carabidae", "Cerambycidae", "Cerophytidae", "Cerylonidae", "Cholevidae", "Chrysomelidae", "Cimberidae", "Cisidae", "Clambidae", "Cleridae", "Coccinellidae", "Colonidae", "Colydiidae", "Corylophidae", "Cryptophagidae", "Cucujidae", "Curculionidae", "Cybocephalidae", "Dascyllidae", "Dermestidae", "Derodontidae", "Drilidae", "Dryopidae", "Dytiscidae", "Elateridae", "Elmidae", "Endomychidae", "Erotylidae", "Eucinetidae", "Eucnemidae", "Georissidae", "Geotrupidae", "Gyrinidae", "Haliplidae", "Heteroceridae", "Histeridae", "Hydraenidae", "Hydrochidae", "Hydrophilidae", "Hygrobiidae", "Kateretidae", "Laemophloeidae", "Lagriidae", "Lampyridae", "Languriidae", "Lathridiidae", "Leiodidae", "Leptinidae", "Limnichidae", "Lissomidae", "Lophocateridae", "Lucanidae", "Lycidae", "Lyctidae", "Lymexylonidae", "Malachiidae", "Melandryidae", "Meloidae", "Melyridae", "Microsphoridae", "Monotomidae", "Mordellidae", "Mycetophagidae", "Mycteridae", "Nemonychidae", "Nitidulidae", "Nosodendridae", "Noteridae", "Oedemeridae", "Omalisidae", "Peltidae", "Phalacridae", "Phloeostichidae", "Phloiophilidae", "Platypodidae", "Prostomidae", "Pselaphidae", "Psephenidae", "Ptiliidae", "Ptinidae", "Pyrochoidae", "Pythidae", "Rhipiphoridae", "Rhynchitidae", "Rhysodidae", "Salpingidae", "Scarabaeidae", "Scirtidae", "Scolytidae", "Scraptiidae", "Scydmaenidae", "Silphidae", "Silvanidae", "Spercheidae", "Sphaeritidae", "Sphaerosomatidae", "Staphylinidae", "Tenebrionidae", "Tetratomidae", "Throscidae", "Trogidae", "Trogositidae", "Urodonidae"),
                      count = c(8, 4, 17, 66, 25, 19, 132, 2, 3, 2, 5, 7, 28, 97, 25, 2, 85, 547, 183, 1, 6, 48, 508, 2, 44, 12, 21, 78, 19, 19, 15, 129, 4, 765, 3, 1, 41, 2, 2, 14, 143, 143, 25, 11, 14, 2, 18, 3, 10, 13, 20, 14, 83, 52, 7, 109, 1, 12, 20, 3, 3, 2, 77, 79, 2, 3, 1, 1, 7, 7, 6, 2, 33, 32, 19, 24, 1, 22, 78, 17, 1, 1, 120, 1, 2, 25, 1, 4, 22, 1, 1, 2, 1, 89, 1, 74, 21, 3, 2, 3, 25, 2, 14, 152, 25, 109, 28, 53, 22, 10, 1, 1, 3, 1464, 60, 3, 8, 7, 4, 3))

#merge <- merge(uk_total, canada_total, by = "family", all.x = TRUE, all.y = TRUE)
#write.csv(merge, "country_counts.csv", row.names = FALSE)

# Function to retrieve the number of species for a specific family
Count <- function(x) {
  subset_data <- subset(opt$country, family == x)
  if (nrow(subset_data) > 0) {
    return(subset_data$count)
  } else {
    return("Family not found")
  }
}

#out <- bold_seqspec(taxon='Longitarsus')
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

spec <- Count(opt$taxon)
coverage <- BINs/spec

print(paste(coverage, 'of species represented (approx)'))

sink(opt$output)
cat(paste(opt$taxon, barcodes, BINs, bar_bin, spec, coverage, '\n', sep = ','))
sink()
print(paste('Stats written to', opt$output))


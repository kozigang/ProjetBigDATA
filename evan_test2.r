chemin_fichier <- "stat_acc_V3.csv"
accident <- read.csv(chemin_fichier, sep = ";")

# an_nais
# age
# place
arrondissements_lyon <- list(
  `LYON 01` = list(latitude = 45.7674, longitude = 4.8318),
  `LYON 02` = list(latitude = 45.7575, longitude = 4.8283),
  `LYON 03` = list(latitude = 45.7606, longitude = 4.8424),
  `LYON 04` = list(latitude = 45.7729, longitude = 4.8277),
  `LYON 05` = list(latitude = 45.7570, longitude = 4.8045),
  `LYON 06` = list(latitude = 45.7691, longitude = 4.8533),
  `LYON 07` = list(latitude = 45.7455, longitude = 4.8487),
  `LYON 08` = list(latitude = 45.7317, longitude = 4.8619),
  `LYON 09` = list(latitude = 45.7682, longitude = 4.8056)
)

for (ville in accident$ville) {
  if (ville %in% names(arrondissements_lyon)) {
    latitude <- arrondissements_lyon[[ville]]$latitude
    longitude <- arrondissements_lyon[[ville]]$longitude
    accident$latitude[accident$ville == ville] <- latitude
    accident$longitude[accident$ville == ville] <- longitude
  }
}


write.table(accident, file = "C:\\Users\\evank\\OneDrive\\Documents\\Projet_BigData\\stat_acc_V3_modifie.csv", sep = ";", row.names = FALSE)

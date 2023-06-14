accident <- read.csv("stat_acc_V3.csv", sep = ";")

# an_nais
# age
# place

accident$an_nais <- as.integer(accident$an_nais)

accident$an_nais[is.na(accident$an_nais)] <- median(subset(accident$an_nais, accident$an_nais != "NA"))

accident$age <- as.integer(accident$age)

accident$age[is.na(accident$age)] <- median(subset(accident$age, accident$age != "NA"))

accident$place <- as.integer(accident$place)

accident$place[is.na(accident$place)] <- median(subset(accident$place, accident$place != "NA"))

# Changer la valeur de l'age : age - 14
accident$age <- as.numeric(accident$age)
accident$age <- accident$age -14

#Colonne Num_Acc en "numérique"
accident$Num_Acc <- sapply(accident$Num_Acc, function(x) {
  x <- gsub(",", ".", x)  # Remplace la virgule par un point décimal
  as.numeric(x)  # Convertit en numérique
})

#Colonne id_usa en "numérique"
accident$id_usa <- as.numeric(accident$id_usa)
#Colonne id_code_insee en "numérique" 
accident$id_code_insee <- as.numeric(accident$id_code_insee)
#Colonne longitude en "numérique"
accident$longitude <- as.numeric(accident$longitude)
#date en format date 
accident$date <- as.POSIXct(accident$date)

# Dico pour latitude / longitude des arrondissements de Paris 
arrondissements_paris <- list(
  `PARIS 01` = list(latitude = 48.8592, longitude = 2.3417),
  `PARIS 02` = list(latitude = 48.8655, longitude = 2.3426),
  `PARIS 03` = list(latitude = 48.8637, longitude = 2.3590),
  `PARIS 04` = list(latitude = 48.8543, longitude = 2.3574),
  `PARIS 05` = list(latitude = 48.8448, longitude = 2.3471),
  `PARIS 06` = list(latitude = 48.8493, longitude = 2.3322),
  `PARIS 07` = list(latitude = 48.8566, longitude = 2.3219),
  `PARIS 08` = list(latitude = 48.8727, longitude = 2.3126),
  `PARIS 09` = list(latitude = 48.8760, longitude = 2.3375),
  `PARIS 10` = list(latitude = 48.8761, longitude = 2.3615),
  `PARIS 11` = list(latitude = 48.8599, longitude = 2.3781),
  `PARIS 12` = list(latitude = 48.8396, longitude = 2.4401),
  `PARIS 13` = list(latitude = 48.8322, longitude = 2.3561),
  `PARIS 14` = list(latitude = 48.8331, longitude = 2.3264),
  `PARIS 15` = list(latitude = 48.8412, longitude = 2.2974),
  `PARIS 16` = list(latitude = 48.8637, longitude = 2.2769),
  `PARIS 17` = list(latitude = 48.8834, longitude = 2.3219),
  `PARIS 18` = list(latitude = 48.8925, longitude = 2.3444),
  `PARIS 19` = list(latitude = 48.8869, longitude = 2.3841),
  `PARIS 20` = list(latitude = 48.8632, longitude = 2.4006)
)

for (ville in accident$ville) {
  if (ville %in% names(arrondissements_paris)) {
    latitude <- arrondissements_paris[[ville]]$latitude
    longitude <- arrondissements_paris[[ville]]$longitude
    accident$latitude[accident$ville == ville] <- latitude
    accident$longitude[accident$ville == ville] <- longitude
  }
}

# Arrondissements de MARSEILLE pour latitude / longitude 
arrondissements_marseille <- list(
  `MARSEILLE 01` = list(latitude = 43.3003, longitude = 5.3713),
  `MARSEILLE 02` = list(latitude = 43.3158, longitude = 5.3582),
  `MARSEILLE 03` = list(latitude = 43.3157, longitude = 5.3779),
  `MARSEILLE 04` = list(latitude = 43.3029, longitude = 5.3957),
  `MARSEILLE 05` = list(latitude = 43.2911, longitude = 5.3992),
  `MARSEILLE 06` = list(latitude = 43.2925, longitude = 5.3826),
  `MARSEILLE 07` = list(latitude = 43.2855, longitude = 5.3632),
  `MARSEILLE 08` = list(latitude = 43.2673, longitude = 5.3858),
  `MARSEILLE 09` = list(latitude = 43.2346, longitude = 5.4435),
  `MARSEILLE 10` = list(latitude = 43.2739, longitude = 5.4382),
  `MARSEILLE 11` = list(latitude = 43.2814, longitude = 5.4748),
  `MARSEILLE 12` = list(latitude = 43.3014, longitude = 5.4424),
  `MARSEILLE 13` = list(latitude = 43.3611, longitude = 5.4043),
  `MARSEILLE 14` = list(latitude = 43.3421, longitude = 5.3339),
  `MARSEILLE 15` = list(latitude = 43.3797, longitude = 5.3367),
  `MARSEILLE 16` = list(latitude = 43.3536, longitude = 5.3053)
)

for (ville in accident$ville) {
  if (ville %in% names(arrondissements_marseille)) {
    latitude <- arrondissements_marseille[[ville]]$latitude
    longitude <- arrondissements_marseille[[ville]]$longitude
    accident$latitude[accident$ville == ville] <- latitude
    accident$longitude[accident$ville == ville] <- longitude
  }
}

# Arrondissements de Lyon pour latitude / longitude
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


write.table(accident, file = "stat_acc_V3.csv", sep = ";", row.names = FALSE)
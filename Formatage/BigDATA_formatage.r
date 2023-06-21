chemin_fichier <- "stat_acc_V3_original.csv"
donnees <- read.csv(chemin_fichier, sep=";")

# Attribution numérique au variable alphabétique

# Formatage de la colonne descr_cat_veh
# Attribution d'une valeur multicodale pour les différents types de véhicules
type_vehicule <- function(valeur) {
    if (grepl("PL seul > 7,5T", valeur)) {
        return(1)
    } else if (grepl("VU seul 1,5T <= PTAC <= 3,5T avec ou sans remorque", valeur)) {
        return(2)
    } else if (grepl("VL seul", valeur)) {
        return(3)
    } else if (grepl("Autocar", valeur)) {
        return(4)
    } else if (grepl("PL > 3,5T \\+ remorque", valeur)) {
        return(5)
    } else if (grepl("Cyclomoteur <50cm3", valeur)) {
        return(6)
    } else if (grepl("Motocyclette > 125 cm3", valeur)) {
        return(7)
    } else if (grepl("Tracteur routier \\+ semi-remorque", valeur)) {
        return(8)
    } else if (grepl("Tracteur agricole", valeur)) {
        return(9)
    } else if (grepl("PL seul 3,5T <PTCA <= 7,5T", valeur)) {
        return(10)
    } else if (grepl("Autobus", valeur)) {
        return(11)
    } else if (grepl("Scooter > 50 cm3 et <= 125 cm3", valeur)) {
        return(12)
    } else if (grepl("Train", valeur)) {
        return(13)
    } else if (grepl("Scooter > 125 cm3", valeur)) {
        return(14)
    } else if (grepl("Scooter < 50 cm3", valeur)) {
        return(15)
    } else if (grepl("Voiturette \\(Quadricycle à moteur carrossé\\) \\(anciennement \"voiturette ou tricycle à moteur\"\\)", valeur)) {
        return(16)
    } else if (grepl("Autre véhicule", valeur)) {
        return(17)
    } else if (grepl("Bicyclette", valeur)) {
        return(18)
    } else if (grepl("Motocyclette > 50 cm3 et <= 125 cm3", valeur)) {
        return(19)
    } else if (grepl("Engin spécial", valeur)) {
        return(20)
    } else if (grepl("Quad lourd > 50 cm3 \\(Quadricycle à moteur non carrossé\\)", valeur)) {
        return(21)
    } else if (grepl("Tramway", valeur)) {
        return(22)
    } else if (grepl("Tracteur routier seul", valeur)) {
        return(23)
    } else if (grepl("Quad léger <= 50 cm3 \\(Quadricycle à moteur non carrossé\\)", valeur)) {
        return(24)
    } else {
        return(0)
    }
}

# Formatage de la colonne descr_agglo 
# "Hors agglomération" : 1 // "En agglomération" : 2
normalise_agglo <- function(valeur) {
    if (grepl("Hors agglomération", valeur)) {
        return(1)
    } else if (grepl("En agglomération", valeur)) {
        return(2)
    } else {
        return(0)
    }
}

# Formatage de la colonne descr_athmo
# Attribution valeur multicodale pour la variable athmosphérique de l'accident
normalise_athmo <- function(valeur) {
    if (grepl("Brouillard – fumée", valeur)) {
        return(1)
    } else if (grepl("Neige – grêle", valeur)) {
        return(2)
    } else if (grepl("Pluie forte", valeur)) {
        return(3)
    } else if (grepl("Normale", valeur)) {
        return(4)
    } else if (grepl("Autre", valeur)) {
        return(5)
    } else if (grepl("Temps éblouissant", valeur)) {
        return(6)
    } else if (grepl("Pluie légère", valeur)) {
        return(7)
    } else if (grepl("Temps couvert", valeur)) {
        return(8)
    } else if (grepl("Vent fort – tempête", valeur)) {
        return(9)
    } else {
        return(0)
    }
}

# Formatage de la colonne descr_lum
# Attribution multicodale pour la varaible présente lors de l'accident
normalise_lum <- function(valeur) {
    if (grepl("Crépuscule ou aube", valeur)) {
        return(1)
    } else if (grepl("Plein jour", valeur)) {
        return(2)
    } else if (grepl("Nuit sans éclairage public", valeur)) {
        return(3)
    } else if (grepl("Nuit avec éclairage public allumé", valeur)) {
        return(4)
    } else if (grepl("Nuit avec éclairage public non allumé", valeur)) {
        return(5)
    } else {
        return(0)
    }
}

# Formatage de la colonne descr_etat
# Attribution multicodale en fonction de l'etat de la route
normalise_etat <- function(valeur) {
    if (grepl("Verglacée", valeur)) {
        return(1)
    } else if (grepl("Enneigée", valeur)) {
        return(2)
    } else if (grepl("Mouillée", valeur)) {
        return(3)
    } else if (grepl("Normale", valeur)) {
        return(4)
    } else if (grepl("Autre", valeur)) {
        return(5)
    } else if (grepl("Corps gras – huile", valeur)) {
        return(6)
    } else if (grepl("Boue", valeur)) {
        return(7)
    } else if (grepl("Flaques", valeur)) {
        return(8)
    } else if (grepl("Inondée", valeur)) {
        return(9)
    } else {
        return(0)
    }
}

# Formatage de la colonne description_intersection
# Attribution multicodale en fonction du type d'intersection
normalise_intersection <- function(valeur) {
    if (grepl("Hors intersection", valeur)) {
        return(1)
    } else if (grepl("Intersection en X", valeur)) {
        return(2)
    } else if (grepl("Giratoire", valeur)) {
        return(3)
    } else if (grepl("Intersection en T", valeur)) {
        return(4)
    } else if (grepl("Intersection à plus de 4 branches", valeur)) {
        return(5)
    } else if (grepl("Autre intersection", valeur)) {
        return(6)
    } else if (grepl("Intersection en Y", valeur)) {
        return(7)
    } else if (grepl("Passage à niveau", valeur)) {
        return(8)
    } else if (grepl("Place", valeur)) {
        return(9)
    } else {
        return(0)
    }
}

# Formatage de la colonne descr_dispo_secu
# Attribution multicodale au valeur de sécurité usée 
verifier_ceinture_securite <- function(valeur){
    if (grepl("Utilisation d'une ceinture de sécurité", valeur)) {
        return(1)
    } else if (grepl("Utilisation d'un casque", valeur)){
        return(2)
    } else if (grepl("Présence d'une ceinture de sécurité - Utilisation non déterminable", valeur)){
        return(3)
    } else if (grepl("Présence de ceinture de sécurité non utilisé", valeur)){
        return(4)
    } else if (grepl("Autre - Non déterminable", valeur)){
        return(5)
    } else if (grepl("Présence d'un équipement réfléchissant non utilisé", valeur)){
        return(6)
    } else if (grepl("Présence d'un casque non utilisé", valeur)){
        return(7)
    } else if (grepl("Utilisation d'un dispositif enfant", valeur)){
        return(8)
    } else if (grepl("Présence d'un casque - Utilisation non déterminable", valeur)){
        return(9)
    } else if (grepl("Présence dispositif enfant - Utilisation non déterminable", valeur)){
        return(10)
    } else if (grepl("Autre - Utilisé", valeur)){
        return(11)
    } else if (grepl("Utilisation d'un équipement réfléchissant", valeur)){
        return(12)
    } else if (grepl("Autre - Non utilisé", valeur)){
        return(13)
    } else if (grepl("Présence équipement réfléchissant - Utilisation non déterminable", valeur)){
        return(14)
    } else if (grepl("Présence d'un dispositif enfant non utilisé", valeur)){
        return(15)
    } else {
        return(0)
    }
}

# Formatage de la colonne descr_grav
# Attribution d'une valeur multimodale en fonction de la gravité de cas de santé du passager
normalise_gravite <- function(valeur) {
    if (grepl("Indemne", valeur)) {
        return(1)
    } else if (grepl("Blessé léger", valeur)) {
        return(2)
    } else if (grepl("Blessé hospitalisé", valeur)) {
        return(3)
    } else if (grepl("Tué", valeur)) {
        return((4))
    } else {
        return(0)
    }
}

# Formatage de la colonne descr_motif_traj
# Attribution multicodale en fonction du motif de trajet
normalise_trajet <- function(valeur) {
    if (grepl("Utilisation professionnelle", valeur)) {
        return(1)
    } else if (grepl("Promenade – loisirs", valeur)) {
        return(2)
    } else if (grepl("Domicile – travail", valeur)) {
        return(3)
    } else if (grepl("Domicile – école", valeur)) {
        return(4)
    } else if (grepl("Courses – achats", valeur)) {
        return(5)
    } else if (grepl("Autre", valeur)) {
        return(6)
    } else {
        return(0)
    }
}

# Formatage de la colonne descr_type_col
# Attribution multicodale en fonction du nombre de voitures impliqués dans l'accident
normalise_type <- function(valeur) {
    if (grepl("Deux véhicules - Frontale", valeur)) {
        return(1)
    } else if (grepl("Deux véhicules – Par l’arrière", valeur)) {
        return(2)
    } else if (grepl("Deux véhicules – Par le coté", valeur)) {
        return(3)
    } else if (grepl("Trois véhicules et plus – En chaîne", valeur)) {
        return(4)
    } else if (grepl("Trois véhicules et plus – Collisions multiples", valeur)) {
        return(5)
    } else if (grepl("Autre collision", valeur)) {
        return(6)
    } else if (grepl("Sans collision", valeur)) {
        return(7)
    } else {
        return(0)
    }
}

# an_nais
# age
# place

donnees$an_nais <- as.integer(donnees$an_nais)

donnees$an_nais[is.na(donnees$an_nais)] <- median(subset(donnees$an_nais, donnees$an_nais != "NA"))

donnees$age <- as.integer(donnees$age)

donnees$age[is.na(donnees$age)] <- median(subset(donnees$age, donnees$age != "NA"))

donnees$place <- as.integer(donnees$place)

donnees$place[is.na(donnees$place)] <- median(subset(donnees$place, donnees$place != "NA"))

# Changer la valeur de l'age : age - 14
donnees$age <- as.numeric(donnees$age)
donnees$age <- donnees$age 

#Colonne Num_Acc en "numérique"
donnees$Num_Acc <- sapply(donnees$Num_Acc, function(x) {
  x <- gsub(",", ".", x)  # Remplace la virgule par un point décimal
  as.numeric(x)  # Convertit en numérique
})

#Colonne id_usa en "numérique"
donnees$id_usa <- as.numeric(donnees$id_usa)
#Colonne id_code_insee en "numérique" 
donnees$id_code_insee <- as.numeric(donnees$id_code_insee)
#Colonne longitude en "numérique"
donnees$longitude <- as.numeric(donnees$longitude)
# Convertir la colonne de dates en format POSIXct
donnees$date <- as.POSIXct(donnees$date, format = "%Y-%m-%d %H:%M")


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

for (ville in donnees$ville) {
  if (ville %in% names(arrondissements_paris)) {
    latitude <- arrondissements_paris[[ville]]$latitude
    longitude <- arrondissements_paris[[ville]]$longitude
    donnees$latitude[donnees$ville == ville] <- latitude
    donnees$longitude[donnees$ville == ville] <- longitude
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

for (ville in donnees$ville) {
  if (ville %in% names(arrondissements_marseille)) {
    latitude <- arrondissements_marseille[[ville]]$latitude
    longitude <- arrondissements_marseille[[ville]]$longitude
    donnees$latitude[donnees$ville == ville] <- latitude
    donnees$longitude[donnees$ville == ville] <- longitude
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

for (ville in donnees$ville) {
  if (ville %in% names(arrondissements_lyon)) {
    latitude <- arrondissements_lyon[[ville]]$latitude
    longitude <- arrondissements_lyon[[ville]]$longitude
    donnees$latitude[donnees$ville == ville] <- latitude
    donnees$longitude[donnees$ville == ville] <- longitude
  }
}

donnees$descr_type_col <- sapply(donnees$descr_type_col, normalise_type)
donnees$descr_motif_traj <- sapply(donnees$descr_motif_traj, normalise_trajet)
donnees$description_intersection <- sapply(donnees$description_intersection, normalise_intersection)
donnees$descr_etat_surf <- sapply(donnees$descr_etat_surf, normalise_etat)
donnees$descr_lum <- sapply(donnees$descr_lum, normalise_lum)
donnees$descr_athmo <- sapply(donnees$descr_athmo, normalise_athmo)
donnees$descr_cat_veh <- sapply(donnees$descr_cat_veh, type_vehicule)
donnees$descr_dispo_secu <- sapply(donnees$descr_dispo_secu, verifier_ceinture_securite)
donnees$descr_agglo <- sapply(donnees$descr_agglo, normalise_agglo)
donnees$descr_grav <- sapply(donnees$descr_grav, normalise_gravite)
write.table(donnees, file = "stat_acc_V3_exp.csv", sep = ";", row.names = FALSE)

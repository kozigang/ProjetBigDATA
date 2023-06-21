categories <- c("B02", "A01", "B01", "A02", "C01", "T01", "C02", "C03", "D04", "E05", "Z01", "D01",
                "E01", "F06", "G07", "H08", "H02", "F02", "G02", "A27", "B28", "I09", "K11", "L12",
                "M13", "N14", "Q17", "S19", "T20", "U21", "V22", "W23", "X24", "Z26", "O15", "R18",
                "Y25", "J10", "P16", "F01", "G01", "A03", "J03", "J02", "L03", "H01", "I01", "K03",
                "I02", "D03", "D02", "E02", "E04", "D05", "X01", "F04", "G04", "N01")

# Créer un dictionnaire de correspondance entre les catégories et les chiffres
correspondance <- unique(categories)
chiffres <- seq_along(correspondance)
correspondance_dict <- setNames(chiffres, correspondance)

# Fonction pour extraire le chiffre de la catégorie
getChiffre <- function(categorie) {
  chiffre <- correspondance_dict[categorie]
  return(chiffre)
}

# Ajouter une colonne "num_veh" avec les chiffres associés aux catégories
donnees$num_veh <- sapply(donnees$num_veh, getChiffre)

# Écrire le dataframe dans un fichier CSV
write.table(donnees, file = "stat_acc_V3_exp.csv", sep = ";", row.names = FALSE)

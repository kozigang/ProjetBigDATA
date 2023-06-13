chemin_fichier <- "stat_acc_V3.csv"
accident <- read.csv(chemin_fichier, sep = ";")

# an_nais
# age
# place
accident$longitude <- as.numeric(accident$longitude)


write.table(accident, file = "C:\\Users\\evank\\OneDrive\\Documents\\Projet_BigData\\stat_acc_V3_modifie.csv", sep = ";", row.names = FALSE)

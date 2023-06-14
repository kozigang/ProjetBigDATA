chemin_fichier <- "stat_acc_V3_original.csv"
accident <- read.csv(chemin_fichier, sep = ";")

# an_nais
# age
# place
# Convertir la colonne de dates en format POSIXct

# Convertir la colonne de dates en format POSIXct
accident$date <- as.POSIXct(accident$date, format = "%d/%m/%Y  %H:%M", tz = "")

# Formater la date pour afficher le format souhaité
formatted_date <- format(accident$date, format = "%d/%m/%Y %H:%M:%S")

print(formatted_date[1])




#write.table(accident, file = "C:\\Users\\evank\\OneDrive\\Documents\\Projet_BigData\\stat_acc_V3_modifie.csv", sep = ";", row.names = FALSE)

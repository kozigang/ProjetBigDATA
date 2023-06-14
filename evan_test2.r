chemin_fichier <- "stat_acc_V3_exp.csv"
accident <- read.csv(chemin_fichier, sep = ";")
accident$date <- as.POSIXct(accident$date, format = "%Y-%m-%d %H:%M")

print(accident$date[1])
print(class(accident$date))
#write.table(accident, file = "stat_acc_V3_exp.csv", sep = ";", row.names = FALSE)


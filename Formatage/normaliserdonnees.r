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
accident$age <- accident$age 

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

write.table(accident, file = "stat_acc_V3.csv", sep = ";", row.names = FALSE)
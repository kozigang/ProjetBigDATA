accident <- read.csv("stat_acc_V3.csv", sep = ";")

# an_nais
# age
# place

accident$an_nais <- as.integer(accident$an_nais)

accident$an_nais[is.na(accident$an_nais)] <- mean(subset(accident$an_nais, accident$an_nais != "NA"))
write.csv(accident, "stat_acc_V3.csv", row.names = FALSE)
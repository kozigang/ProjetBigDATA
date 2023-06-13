accident <- read.csv("stat_acc_V3.csv", sep = ";")

trancheage <- c(0, 18, 40, 60, 80, 100, 120, 140)

hist(accident$age,
     main = "Nombre d'accidents par tranche d'âge",
     xlab = "Tranche d'âge",
     ylab = "Nombre d'accidents",
     breaks = trancheage,
     freq = TRUE)
accident <- read.csv("stat_acc_V3.csv", sep = ";")

trancheage <- c(0, 18, 30, 50, 75, 100, 125)
hist(accident$age,
     main = "Nombre d'accidents par tranche d'âge",
     xlab = "Tranche d'âge",
     ylab = "Nombre d'accidents",
     breaks = trancheage)
axis(side = 1, at = trancheage, labels = trancheage)
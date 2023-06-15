#install.packages("lubridate")
library(lubridate)

accident <- read.csv("stat_acc_V3_exp.csv", sep = ";")

trancheage <- c(0, 18, 40, 60, 80, 100, 120, 140)

hist(accident$age,
     main = "Nombre d'accidents par tranche d'âge",
     xlab = "Tranche d'âge",
     ylab = "Nombre d'accidents",
     breaks = trancheage,
     freq = TRUE)

date <- as.Date(accident$date)

month <- month(date)

tranchemois <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)

hist(month,
     main = "Nombre d'accidents par mois",
     xlab = "mois",
     ylab = "Nombre d'accidents",
     breaks = tranchemois,
     xaxt='n',
     freq = TRUE)

axis(side = 1, at = seq(1,12,1), labels = seq(1,12,1))
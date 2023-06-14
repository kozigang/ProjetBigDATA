chemin_fichier <- "stat_acc_V3_exploitable.csv"
accident <- read.csv(chemin_fichier, sep = ";")

accident$mois <- format(accident$date, "%m")
accidents_par_mois <- tapply(accident$nombre_accidents, accident$mois, sum)

data_mois <- data.frame(mois = as.numeric(names(accidents_par_mois)), accidents = accidents_par_mois)
regression_mois <- lm(accidents ~ mois, data = data_mois)
plot(data_mois$mois, data_mois$accidents, main = "Évolution du nombre d'accidents par mois", xlab = "Mois", ylab = "Nombre d'accidents")
abline(regression_mois, col = "red")
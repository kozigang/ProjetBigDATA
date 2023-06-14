# Charger les données à partir du fichier CSV
chemin_fichier <- "stat_acc_V3_exp.csv"
accident <- read.csv(chemin_fichier, sep = ";")

# Convertir la colonne de dates en format POSIXct
accident$date <- as.POSIXct(accident$date, format = "%Y-%m-%d %H:%M")

# Créer une nouvelle colonne pour extraire le mois
accident$mois <- format(accident$date, "%m")

# Calculer le nombre total de jours dans chaque mois
jours_par_mois <- tapply(accident$date, accident$mois, function(x) length(unique(format(x, "%Y-%m-%d"))))

# Calculer le nombre total d'accidents par mois
nombre_accidents_par_mois <- tapply(accident$date, accident$mois, function(x) length(x))

# Calculer le taux d'accidents par mois
taux_accidents_par_mois <- nombre_accidents_par_mois / jours_par_mois

# Créer un dataframe avec les données de la régression
donnees_reg <- data.frame(mois = as.numeric(names(taux_accidents_par_mois)), taux_accidents = taux_accidents_par_mois)

# Effectuer la régression linéaire
regression <- lm(taux_accidents ~ mois, data = donnees_reg)

# Afficher les résultats de la régression
print(summary(regression))

# Tracer le graphique avec la ligne de régression
plot(donnees_reg$mois, donnees_reg$taux_accidents, main = "Évolution du taux d'accidents par mois", xlab = "Mois", ylab = "Taux d'accidents")
abline(regression, col = "red")

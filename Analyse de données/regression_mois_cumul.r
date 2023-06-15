# Charger les données à partir du fichier CSV
chemin_fichier <- "stat_acc_V3_exp.csv"
accident <- read.csv(chemin_fichier, sep = ";")

# Convertir la colonne de dates en format POSIXct
accident$date <- as.POSIXct(accident$date, format = "%Y-%m-%d %H:%M")

# Créer une nouvelle colonne pour extraire le mois
accident$mois <- format(accident$date, "%m")

# Calculer le nombre total d'accidents cumulés par mois
nombre_accidents_cumules <- tapply(accident$date, accident$mois, function(x) length(x))
nombre_accidents_cumules <- cumsum(nombre_accidents_cumules) # Calculer les cumulatifs

# Créer un dataframe avec les données des accidents cumulés par mois
donnees_accidents_cumules <- data.frame(mois = as.numeric(names(nombre_accidents_cumules)), nombre_accidents_cumules = nombre_accidents_cumules)

# Effectuer la régression linéaire
regression <- lm(nombre_accidents_cumules ~ mois, data = donnees_accidents_cumules)

# Afficher les résultats de la régression
print(summary(regression))

# Tracer le graphique avec la ligne de régression
plot(donnees_accidents_cumules$mois, donnees_accidents_cumules$nombre_accidents_cumules, main = "Nombre total d'accidents cumulés par mois", xlab = "Mois", ylab = "Nombre d'accidents cumulés")
abline(regression, col = "red")

#erreur-type :
erreur_type <- summary(regression)$sigma
print(paste("L'erreur-type est de", erreur_type))

# Calcul des intervalles de confiance à 95% pour les estimateurs
conf_interval <- confint(regression, level = 0.95)

# Affichage des intervalles de confiance
print(conf_interval)

# Calcul du coefficient de corrélation au carré
correlation <- cor(donnees_accidents_cumules$mois, donnees_accidents_cumules$nombre_accidents_cumules)
print(correlation^2)

# Calcul du R-squared et vérification du R-squared
r_squared <- summary(regression)$r.squared
print(paste("R-squared:", r_squared))

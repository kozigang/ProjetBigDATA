# Charger les données à partir du fichier CSV
chemin_fichier <- "stat_acc_V3_exp.csv"
accident <- read.csv(chemin_fichier, sep = ";")

# Convertir la colonne de dates en format POSIXct
accident$date <- as.POSIXct(accident$date, format = "%Y-%m-%d %H:%M")

# Créer une nouvelle colonne pour extraire le mois
accident$mois <- format(accident$date, "%m")

# Calculer le nombre total d'accidents par mois
nombre_accidents_par_mois <- tapply(accident$date, accident$mois, function(x) length(x))

# Créer un dataframe avec les données du nombre d'accidents par mois
donnees_accidents <- data.frame(mois = as.numeric(names(nombre_accidents_par_mois)), nombre_accidents = nombre_accidents_par_mois)

# Effectuer la régression linéaire
regression <- lm(nombre_accidents ~ mois, data = donnees_accidents)

# Afficher les résultats de la régression
print(summary(regression))

# Tracer le graphique avec la ligne de régression
plot(donnees_accidents$mois, donnees_accidents$nombre_accidents, main = "Nombre total d'accidents par mois", xlab = "Mois", ylab = "Nombre d'accidents")
abline(regression, col = "red")

#erreur-type : 
erreur_type <- 739.3
print(paste("L'erreur-type est de", erreur_type))

# Calcul des intervalles de confiance à 95% pour les estimateurs
conf_interval <- confint(regression, level = 0.95)

# Affichage des intervalles de confiance
print(conf_interval)

# Calcul du coefficient de corrélation au carré
correlation <- cor(donnees_accidents$mois, donnees_accidents$nombre_accidents)
print(correlation^2)
# Calcul du R-squared et vérification du R_squared
r_squared <- summary(regression)$r.squared
print(paste("R-squared:", r_squared))
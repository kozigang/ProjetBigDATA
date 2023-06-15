# Charger les données à partir du fichier CSV
chemin_fichier <- "stat_acc_V3_exp.csv"
accident <- read.csv(chemin_fichier, sep = ";")

# Convertir la colonne de dates en format POSIXct
accident$date <- as.POSIXct(accident$date, format = "%Y-%m-%d %H:%M")

# Créer une nouvelle colonne pour extraire le numéro de semaine
accident$semaine <- format(accident$date, "%U")

# Calculer le nombre total d'accidents par semaine
nombre_accidents_par_semaine <- tapply(accident$date, accident$semaine, function(x) length(x))

# Créer un dataframe avec les données de la régression
donnees_reg <- data.frame(semaine = as.numeric(names(nombre_accidents_par_semaine)), nombre_accidents = nombre_accidents_par_semaine)

# Effectuer la régression linéaire
regression <- lm(nombre_accidents ~ semaine, data = donnees_reg)

# Afficher les résultats de la régression
print(summary(regression))

# Tracer le graphique avec la ligne de régression
plot(donnees_reg$semaine, donnees_reg$nombre_accidents, main = "Nombre total d'accidents par semaine", xlab = "Semaine", ylab = "Nombre d'accidents")
abline(regression, col = "red")

# Erreur-type
erreur_type <- sqrt(diag(vcov(regression)))
print(paste("L'erreur-type est de", erreur_type))

# Calcul des intervalles de confiance à 95% pour les estimateurs
conf_interval <- confint(regression, level = 0.95)

# Affichage des intervalles de confiance
print(conf_interval)

# Calcul du coefficient de corrélation au carré
correlation <- cor(donnees_reg$semaine, donnees_reg$nombre_accidents)
print(correlation^2)

# Calcul du R-squared et vérification du coefficient de corrélation au carré
r_squared <- summary(regression)$r.squared
print(paste("R-squared:", r_squared))
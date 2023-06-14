chemin_fichier <- "stat_acc_V3_original.csv"
accident <- read.csv(chemin_fichier, sep = ";")

# Test d'indépendance du chi2 entre les variables "variable1" et "variable2"
resultat_chi2 <- chisq.test(accident$descr_dispo_secu, accident$descr_grav)
resultat_chi2_2 <- chisq.test(accident$descr_etat_surf, accident$descr_grav)
print(resultat_chi2)

# Extraire les informations du résultat
test_stat <- resultat_chi2$statistic
p_value <- resultat_chi2$p.value
df <- resultat_chi2$parameter

# Formater et afficher le résultat
cat("Test de Chi2\n")
cat("==============\n")
cat("Valeur du test de Chi2:", test_stat, "\n")
cat("Degrés de liberté:", df, "\n")
cat("P-valeur:", p_value, "\n")
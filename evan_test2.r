chemin_fichier <- "stat_acc_V3_original.csv"
accident <- read.csv(chemin_fichier, sep = ";")

# Convertir la colonne de dates en format POSIXct
library(kableExtra)

# Créer un exemple de tableau croisé
tableau_croise <- table(accident$descr_dispo_secu, accident$descr_grav)

# Convertir le tableau croisé en un objet kable
kbl_tableau <- kable(tableau_croise, format = "html") %>%
  kable_styling(bootstrap_options = "striped", full_width = FALSE)

# Afficher le tableau en mosaïque
print(kbl_tableau)



#write.table(acci\Projet_BigData\\stat_acc_V3_modifie.csv", sep = ";", row.names = FALSE)

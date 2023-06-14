chemin_fichier <- "stat_acc_V3_original.csv"
accident <- read.csv(chemin_fichier, sep = ";")

# Convertir la colonne de dates en format POSIXct
library(kableExtra)

# Tableau croisé entre la sécurité mise en place et la gravité de l'accident
tableau_croise <- table(accident$descr_dispo_secu, accident$descr_grav)

# Tableau croisé entre la sécurité mise en place et la gravité de l'accident
tableau_croise2 <- table(accident$descr_etat_surf, accident$descr_grav)

# Convertir le tableau croisé en un objet kable
kbl_tableau <- kable(tableau_croise2, format = "html") %>%
  kable_styling(bootstrap_options = "striped", full_width = FALSE)

# Afficher le tableau en mosaïque
print(kbl_tableau)
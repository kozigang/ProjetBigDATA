chemin_fichier <- "stat_acc_V3_exploitable.csv"
accident <- read.csv(chemin_fichier, sep = ";")
library(graphics)

# Créer un exemple de tableau croisé
tableau_croise <- table(accident$descr_grav, accident$descr_dispo_secu)
tableau_croise2 <- table(accident$descr_etat_surf, accident$descr_grav)

# Afficher le graphique en mosaïque
png("mosaic_plot.png")
mosaicplot(tableau_croise2, main = "Tableau mosaïque")
dev.off()
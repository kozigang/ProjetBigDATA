chemin_fichier <- "C:\\Users\\evank\\OneDrive\\Documents\\Projet_BigData\\stat_acc_V3_modifie.csv"
donnees <- read.csv(chemin_fichier, sep=";")
valeurs_uniques <- unique(donnees$descr_type_col)
print(valeurs_uniques)

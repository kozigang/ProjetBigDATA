chemin_fichier <- "C:\\Users\\evank\\OneDrive\\Documents\\Projet_BigData\\stat_acc_V3-copie.csv"
donnees <- read.csv(chemin_fichier, sep=";")
valeurs_uniques <- unique(donnees$descr_agglo)
print(valeurs_uniques)

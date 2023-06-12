chemin_fichier <- "C:\\Users\\evank\\OneDrive\\Documents\\Projet_BigData\\stat_acc_V3.csv"
donnees <- read.csv(chemin_fichier, sep=";")
secu <- data.frame(donnees["descr_dispo_secu"])

verifier_ceinture_securite <- function(valeur){
    if (grepl("Utilisation d'une ceinture de sécurité", valeur)) {
        return(1)
    } else{
        return(0)
    }
}

donnees$descr_dispo_secu <- sapply(donnees$descr_dispo_secu, verifier_ceinture_securite)
write.table(donnees, file = chemin_fichier, sep = ";", row.names = FALSE)

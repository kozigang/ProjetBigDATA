chemin_fichier <- "C:\\Users\\evank\\OneDrive\\Documents\\Projet_BigData\\stat_acc_V3.csv"
chemin_sauvegarde <- "C:\\Users\\evank\\OneDrive\\Documents\\Projet_BigData\\stat_acc_V3_modifie.csv"
donnees <- read.csv(chemin_fichier, sep=";")
secu <- data.frame(donnees["descr_dispo_secu"])

verifier_ceinture_securite <- function(valeur){
    if (grepl("Utilisation d'une ceinture de sécurité", valeur)) {
        return(1)
    } else if (grepl("Utilisation d'un casque")){
        return(2)
    } else if (grepl("Présence d'une ceinture de sécurité - Utilisation non déterminable")){
        return(3)
    } else if (grepl("Présence de ceinture de sécurité non utilisé")){
        return(4)
    } else if (grepl("Autre - Non déterminable")){
        return(5)
    } else if (grepl("Présence d'un équipement réfléchissant non utilisé")){
        return(6)
    } else if (grepl("Présence d'un casque non utilisé")){
        return(7)
    } else if (grepl("Utilisation d'un dispositif enfant")){
        return(8)
    } else if (grepl("Présence d'un casque - Utilisation non déterminable")){
        return(9)
    } else if (grepl("Présence dispositif enfant - Utilisation non déterminable")){
        return(10)
    } else if (grepl("Autre - Utilisé")){
        return(11)
    } else if (grepl("Utilisation d'un équipement réfléchissant")){
        return(12)
    } else if (grepl("Autre - Non utilisé")){
        return(13)
    } else if (grepl("Présence équipement réfléchissant - Utilisation non déterminable")){
        return(14)
    } else if (grepl("Présence d'un dispositif enfant non utilisé")){
        return(15)
    } else {
        return(0)
    }
}

donnees$descr_dispo_secu <- sapply(donnees$descr_dispo_secu, verifier_ceinture_securite)
write.table(donnees, file = chemin_sauvegarde, sep = ";", row.names = FALSE)

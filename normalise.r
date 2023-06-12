accident <- read.csv("stat_acc_V3.csv", sep = ";")

normalise_agglo <- function(valeur) {
    if (grepl("Hors agglomération", valeur)) {
        return(1)
    } else if (grepl("En agglomération", valeur)) {
        return(2)
    } else {
        return(0)
    }
}

accident$descr_agglo <- sapply(accident$descr_agglo, normalise_agglo)
write.table(accident, file = "stat_acc_V3.csv", sep = ";", row.names = FALSE)

normalise_gravite <- function(valeur) {
    if (grepl("Indemne", valeur)) {
        return(1)
    } else if (grepl("Blessé léger", valeur)) {
        return(2)
    } else if (grepl("Blessé hospitalisé", valeur)) {
        return(3)
    } else if (grepl("Tué", valeur)) {
        return((4))
    } else {
        return(0)
    }
}

accident$descr_grav <- sapply(accident$descr_grav, normalise_gravite())
write.table(accident, file = "stat_acc_V3.csv", sep = ";", row.names = FALSE)
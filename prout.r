accident <- read.csv("stat_acc_V3.csv", sep = ";")

verifier_agglo <- function(valeur) {
    if (grepl("Hors agglomération", valeur)) {
        return(1)
    } else if (grepl("En agglomération", valeur)) {
        return(2)
    } else {
        return(0)
    }
}

accident$descr_agglo <- sapply(accident$descr_agglo, verifier_agglo)
write.table(accident, file = "stat_acc_V3.csv", sep = ";", row.names = FALSE)
accident <- read.csv("stat_acc_V3.csv", sep = ";")

# an_nais
# age
# place

accident$an_nais <- lapply(accident$an_nais, as.integer)

normalise_an_nais <- function(valeur) {
    if (grepl("NULL", valeur)) {
        return(mean(subset(accident$an_nais, !is.na(accident$an_nais))))
    }
}

print(mean(subset(accident$an_nais, !is.na(accident$an_nais))))
accident$an_nais <- sapply(accident$an_nais, normalise_an_nais)

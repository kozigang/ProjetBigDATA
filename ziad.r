data <- read.csv("stat_acc_V3.csv",header=TRUE, sep = ";")
data$descr_etat_surf <- as.numeric(factor(data$descr_etat_surf))
data$description_intersection <- as.numeric(factor(data$description_intersection))
data$descr_dispo_secu <- as.numeric(factor(data$descr_dispo_secu))
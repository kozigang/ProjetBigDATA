data <- read.csv("stat_acc_V3.csv",header=TRUE, sep = ";")

install.packages("dplyr") 
library(dplyr)

# Agrégation par mois
accidents_par_mois <- donnees %>%
  mutate(mois = format(date, "%m")) %>%
  group_by(mois) %>%
  summarize(nombre_accidents = n())

# Graphe d'agrégation par mois
x11()
plot(accidents_par_mois$mois,accidents_par_mois$nombre_accidents,xlab="mois",ylab="Nombre d'accident")

# Agrégation par semaine
accidents_par_semaine <- donnees %>%
  mutate(semaine = format(date, "%U")) %>%
  group_by(semaine) %>%
  summarize(nombre_accidents = n())

#Graphe d'agrégation par semaine
x11()
plot(accidents_par_semaine$semaine,accidents_par_semaine$nombre_accidents,xlab="mois",ylab="Nombre d'accident")






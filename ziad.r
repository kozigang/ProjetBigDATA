data <- read.csv("stat_acc_V3.csv",header=TRUE, sep = ";")


# Mettre les variables numériques sous format numériques
donnees$id_usa <- as.numeric(donnees$id_usa)
donnees$id_code_insee <- as.numeric(donnees$id_code_insee)
donnees$an_nais <- as.numeric(donnees$an_nais)
donnees$age <- as.numeric(donnees$age)
donnees$place <- as.numeric(donnees$place)





#Mettre la date en format date 
donnees$date <- as.Date(donnees$date)

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






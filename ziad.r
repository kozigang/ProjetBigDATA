data <- read.csv("stat_acc_V3.csv",header=TRUE, sep = ";")

# Mettre les variables numériques sous format numériques
data$id_usa <- as.numeric(data$id_usa)
data$id_code_insee <- as.numeric(data$id_code_insee)
data$an_nais <- as.numeric(data$an_nais)
data$age <- as.numeric(data$age)
data$place <- as.numeric(data$place)

#Mettre la date en format date 
data$date <- as.Date(data$date)

install.packages("dplyr") 
library(dplyr)

# Agrégation par mois
accidents_par_mois <- data %>%
  mutate(mois = format(date, "%Y-%m")) %>%
  group_by(mois) %>%
  summarize(nombre_accidents = n())

# Tracer un histogramme des accidents par mois
barplot(accidents_par_mois$nombre_accidents, names.arg = accidents_par_mois$mois,
        xlab = "Mois", ylab = "Nombre d'accidents",
        main = "Nombre d'accidents par mois")


# Agrégation par semaine
accidents_par_semaine <- data %>%
  mutate(semaine = format(date, "%Y-%U")) %>%
  group_by(semaine) %>%
  summarize(nombre_accidents = n())


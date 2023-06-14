donnees<-read.csv("C:\\Users\\hp\\Downloads\\stat_acc_V3_exploitable_copy.csv",sep=";")

class(donnees$age)
# Mettre les variables numériques sous format numériques
donnees$id_usa <- as.numeric(donnees$id_usa)
donnees$id_code_insee <- as.numeric(donnees$id_code_insee)
donnees$an_nais <- as.numeric(donnees$an_nais)
donnees$age <- as.numeric(donnees$age)
donnees$place <- as.numeric(donnees$place)

#Mettre la date en format date 
donnees$date <- as.POSIXct(donnees$date, format = "%d/%m/%Y %H:%M")


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
plot(accidents_par_semaine$semaine,accidents_par_semaine$nombre_accidents,xlab="semaine",ylab="Nombre d'accident")

# Faire un data pour le nombre d'accidents et les conditions atmosphériques
accidents_par_cond_atm <- donnees %>%
  group_by(descr_athmo) %>%
  summarize(nombre_accidents = n())

# graphe représentant le nombre d'accidents en fonction des conditions atmosphériques
install.packages("ggplot2")
library(ggplot2)
ggplot(accidents_par_cond_atm, aes(x = descr_athmo, y = nombre_accidents)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Conditions atmosphériques", y = "Nombre d'accidents", title = "Nombre d'accidents par conditions atmosphériques")

# graphe représentant le nombre d'accidents en fonction des conditions atmosphériques 
plot(accidents_par_cond_atm$descr_athmo, accidents_par_cond_atm$nombre_accidents,
     type = "o", xlab = "Conditions Atmosphériques", ylab = "Nombre d'accidents",
     main = "Évolution du nombre d'accidents par conditions atmosphériques")

# Faire un data pour le nombre d'accidents et la description de la surface 
accidents_par_descr_surf <- donnees %>%
  group_by(descr_etat_surf) %>%
  summarize(nombre_accidents = n())

# graphe représentant le nombre d'accidents en fonction de la description de la surface
ggplot(accidents_par_descr_surf, aes(x = descr_etat_surf, y = nombre_accidents)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Description de la surface", y = "Nombre d'accidents", title = "Nombre d'accidents par surface")

# graphe représentant le nombre d'accidents en fonction de la description de la surface
plot(accidents_par_descr_surf$descr_etat_surf, accidents_par_descr_surf$nombre_accidents,
     type = "o", xlab = "Description de la surfaces", ylab = "Nombre d'accidents",
     main = "Nombre d'accidents par surface")

# Faire un data pour le nombre d'accidents et la gravité 
accidents_par_gravite <- donnees %>%
  group_by(descr_grav) %>%
  summarize(nombre_accidents = n())

# graphe représentant le nombre d'accidents en fonction de la gravité
ggplot(accidents_par_gravite, aes(x = descr_grav, y = nombre_accidents)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Gravité", y = "Nombre d'accidents", title = "Nombre d'accidents selon la gravité")

# graphe représentant le nombre d'accidents en fonction de la gravité
plot(accidents_par_gravite$descr_grav, accidents_par_gravite$nombre_accidents,
     type = "o", xlab = "Gravité", ylab = "Nombre d'accidents",
     main = "Nombre d'accidents selon la gravité")

# Faire un data pour le nombre d'accidents et les tranches d'heure
accidents_par_heure <- donnees %>%
  mutate(heure = format(date, "%H:00")) %>%
  group_by(heure) %>%
  summarize(nombre_accidents = n())

# graphe représentant le nombre d'accidents par tranches d'heure
ggplot(accidents_par_heure, aes(x = heure, y = nombre_accidents)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "heure", y = "Nombre d'accidents", title = "Nombre d'accidents par tranche d'heure")

# Faire un data pour le nombre d'accidents et les villes 
accidents_par_ville <- donnees %>%
  group_by(ville) %>%
  summarize(nombre_accidents = n()) %>%
  arrange(desc(nombre_accidents))

# graphe représentant le nombre d'accidents par ville
les_15_prmieres_villes <- accidents_par_ville[1:15, ]  # Sélectionner les 15 premières villes
ggplot(les_15_prmieres_villes, aes(x = ville, y = nombre_accidents)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "ville", y = "Nombre d'accidents", title = "Nombre d'accidents par ville")



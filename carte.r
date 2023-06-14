install.packages("ggplot2")
install.packages("maps")

library(ggplot2)
library(maps)


accidents <- read.csv("stat_acc_V3.csv")

departements_map <- map_data("france")

# 5. Agrégez les données par département
accidents_par_departement <- aggregate(. ~ id_code_insee, data = accidents, FUN = length)

# 6. Fusionnez les données géographiques avec les données d'accidents
departements_data <- merge(departements_map, accidents_par_departement, by.x = "region", by.y = "id_code_insee", all.x = TRUE)

carte_chaleur <- ggplot(departements_data, aes(x = long, y = lat, group = group, fill = accidents)) +
                 geom_polygon() +
                 scale_fill_gradient(low = "blue", high = "red") +
                 labs(title = "Nombre d'accidents par département") +
                 xlab("Longitude") +
                 ylab("Latitude")

print(carte_chaleur)

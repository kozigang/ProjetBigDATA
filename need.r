accident <- read.csv("stat_acc_V3.csv", sep = ";")
unique_values <- unique(accident$an_nais)
print(unique_values)
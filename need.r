accident <- read.csv("stat_acc_V3.csv", sep = ";")
unique_values <- unique(accident$place)
print(unique_values)
accident <- read.csv("stat_acc_V3.csv", sep = ";")
unique_values <- unique(accident$descr_agglo)
print(unique_values)
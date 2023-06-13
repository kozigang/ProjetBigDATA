accident <- read.csv("stat_acc_V3.csv", sep = ";")
unique_values <- unique(accident$age)
print(unique_values)
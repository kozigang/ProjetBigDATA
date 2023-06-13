accident <- read.csv("C:\\Users\\evank\\OneDrive\\Documents\\Projet_BigData\\stat_acc_V3_modifie.csv", sep = ";")
unique_values <- max(accident$age)
print(unique_values)
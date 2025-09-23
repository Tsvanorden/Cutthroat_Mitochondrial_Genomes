library(tidyverse)
library(reshape2)

# Read the distance matrix correctly (assumes the file is CSV with the first column as rownames)
data <- read_excel('/Users/tannervanorden/Desktop/Cutthroat_Mitogenome_Publication/Publication_Analyses/Mega_Corrected.xlsx', col_names = TRUE)
#data <- read_csv('/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Analyses/Distance Data.txt', col_names = TRUE)

# Extract row names (first column)
rownames <- data[[1]]  # Save the first column as rownames
data <- data[,-1]      # Remove the first column
data <- as.data.frame(data)  # Convert tibble to data frame
rownames(data) <- rownames   # Now safely assign rownames

# Fill in the upper triangle to make it symmetric (if necessary)
data[upper.tri(data)] <- t(data)[upper.tri(data)]

# Now melt the data
columns <- colnames(data)
melted <- melt(as.matrix(data))
melted$Var1 <- factor(melted$Var1, levels = columns)
melted$Var2 <- factor(melted$Var2, levels = rev(columns))

# Plot
ggplot(data = melted, aes(Var1, Var2, fill = value)) +
  geom_tile(color = "black", linewidth = .3) +
  scale_fill_gradient(low = "white", high = "red", name = "Group Pairwise Distance") +
  labs(x = NULL, y = NULL) +  # Removes overall axis titles
  theme(
    axis.text.x = element_text(angle = 50, vjust = 1, size = 11, hjust = 1),
    axis.text.y = element_text(size = 12)
  ) +
  coord_fixed()




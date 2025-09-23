# Load required libraries
library(treeio)
library(ggtree)
library(tidyverse)

## Maximum Likelihood tree
tree = read.tree("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Publication_Analyses/Rerooted.tre")

ml_plot = (ggtree(tree) +
             #geom_nodelab(geom = "text", aes(label = node), size = 3)) +
       geom_hilight(node = 152, fill = "#1f77b4", alpha = 0.35) +  # Blue
       geom_hilight(node = 154, fill = "#e66a00", alpha = 0.35) +  # Orange
       geom_hilight(node = 156, fill = "#2ca02c", alpha = 0.35) +  # Green
       geom_hilight(node = 166, fill = "#ff9896", alpha = 0.35) +  # Red
       geom_hilight(node = 173, fill = "#9467bd", alpha = 0.35) +  # Purple
       geom_hilight(node = 181, fill = "#8c564b", alpha = 0.35) +  # Brown
       geom_hilight(node = 204, fill = "#d3d200", alpha = 0.30) +  # Pink
       geom_hilight(node = 196, fill = "#e377c2", alpha = 0.55) +  # Teal
       geom_hilight(node = 218, fill = "#7f7f7f", alpha = 0.35) +  # Yellow-green
       geom_hilight(node = 237, fill = "#98df8a", alpha = 0.35) +   # Grey
       geom_hilight(node = 256, fill = "#ffbb78", alpha = 0.35) +  # Light Red
       geom_hilight(node = 270, fill = "#c5b0d5", alpha = 0.35) +  # Light Purple
       geom_hilight(node = 276, fill = "#d62728", alpha = 0.35) +  # Light Green
       geom_hilight(node = 280, fill = "#17becf", alpha = 0.5) +   # Light Orange
       geom_cladelab(node = c(152, 154, 156, 166, 173, 181, 204, 196, 218, 237, 256, 270, 276, 280),
                     label = c("Great Basin Redband Trout", "Apache/Gila Trout", "Rainbow Trout including Columbia Redband, \nCoastal Rainbow, and Mexican Golden Trout", "Coastal Cutthroat Trout", "Westslope Cutthroat Trout",
                               "Lahontan Cutthroat Trout", "Yellowstone Cutthroat Trout", "Bear River Cutthroat", "Bonneville Cutthroat Trout",
                               "Green River Cutthroat Trout", "Rio Grande Cutthroat Trout",
                               "Greenback Cutthroat Trout", "San Juan Cutthroat Trout", "Uncompahgre Cutthroat Trout"
                     ), align = TRUE) +  xlim(0, .1))
ml_plot



library(treeio)
library(ggtree)
library(ape)
library(phytools)
library(patchwork)
library(ggplot2)



##Beast Strict
# Load required libraries
library(treeio)
library(ggtree)

tree <- read.beast("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Beast_Publication/output.tree")

# Plot the tree
beast_plot <- ggtree(tree) + 
  #geom_tiplab() +
  #geom_nodelab(geom = "text", aes(label = node), size = 3) + 
  geom_treescale(x = 0.001, y = 1, width = 0.002, fontsize = 3) +
  geom_tiplab(aes(label = ifelse(label == "Yellowfin_135652", "Yellowfin Cutthroat Trout", NA)),
              color = "black", hjust = -0.165, size = 3.4) +  
  
  # Highlight the Yellowfin tip (no .() required)
  geom_tippoint(data = function(x) subset(x, label == "Yellowfin_135652"),
                color = "red", size = 1.5) +
  
  geom_hilight(node = 295, fill = "#1f77b4", alpha = 0.35) +  # Blue
  geom_hilight(node = 293, fill = "#e66a00", alpha = 0.4) +   # Orange
  geom_hilight(node = 284, fill = "#2ca02c", alpha = 0.35) +  # Green
  geom_hilight(node = 277, fill = "#ff9896", alpha = 0.35) +  # Red
  geom_hilight(node = 269, fill = "#9467bd", alpha = 0.35) +  # Purple
  geom_hilight(node = 256, fill = "#8c564b", alpha = 0.35) +  # Brown
  geom_hilight(node = 246, fill = "#e377c2", alpha = 0.30) +  # Pink
  geom_hilight(node = 233, fill = "#d3d200", alpha = 0.35) +  # Teal
  geom_hilight(node = 214, fill = "#7f7f7f", alpha = 0.35) +  # Yellow-green
  geom_hilight(node = 155, fill = "#98df8a", alpha = 0.35) +  # Grey
  geom_hilight(node = 201, fill = "#ffbb78", alpha = 0.45) +  # Light Red
  geom_hilight(node = 195, fill = "#c5b0d5", alpha = 0.45) +  # Light Purple
  geom_hilight(node = 191, fill = "#d62728", alpha = 0.45) +  # Light Green
  geom_hilight(node = 175, fill = "#17becf", alpha = 0.3) +   # Light Orange
  
  geom_cladelab(fontsize = 3.4,
                node = c(295, 293, 284, 277, 269, 256, 246, 233, 214, 155, 201, 195, 191, 175),
                label = c("Klamath Redband Trout", "Apache/Gila Trout",
                          "Columbia Redband/Coastal Rainbow Trout",
                          "Coastal Cutthroat Trout", "Westslope Cutthroat Trout", "Lahontan Cutthroat Trout",
                          "Bear River Cutthroat", "Yellowstone Cutthroat Trout",
                          "Bonneville Cutthroat Trout", "Green River Cutthroat Trout",   
                          "Rio Grande Cutthroat Trout",
                          "Greenback Cutthroat Trout", "San Juan Cutthroat Trout",
                          "Uncompahgre Cutthroat Trout"), align = TRUE, barcolor = NA) +
  xlim(0, max(.065))  # Adjust as needed

# Print the plot
beast_plot

##Beast Relaxed
# Load required libraries
library(treeio)
library(ggtree)

tree <- read.beast("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Beast_Publication/Yule_Relaxed_output.tree")

# Plot the tree
beast_plot <- ggtree(tree) + 
  #geom_tiplab() +
  #geom_nodelab(geom = "text", aes(label = node), size = 3) + 
  geom_treescale(x = 0.001, y = 1, width = 0.002, fontsize = 3) +
  geom_tiplab(aes(label = ifelse(label == "Yellowfin_135652", "Yellowfin Cutthroat Trout", NA)),
              color = "black", hjust = -0.165, size = 3.4) +  
  
  # Highlight the Yellowfin tip (no .() required)
  geom_tippoint(data = function(x) subset(x, label == "Yellowfin_135652"),
                color = "red", size = 1.5) +
  
  geom_hilight(node = 295, fill = "#1f77b4", alpha = 0.35) +  # Blue
  geom_hilight(node = 293, fill = "#e66a00", alpha = 0.4) +   # Orange
  geom_hilight(node = 284, fill = "#2ca02c", alpha = 0.35) +  # Green
  geom_hilight(node = 276, fill = "#ff9896", alpha = 0.35) +  # Red
  geom_hilight(node = 268, fill = "#9467bd", alpha = 0.35) +  # Purple
  geom_hilight(node = 255, fill = "#8c564b", alpha = 0.35) +  # Brown
  geom_hilight(node = 246, fill = "#e377c2", alpha = 0.30) +  # Pink
  geom_hilight(node = 233, fill = "#d3d200", alpha = 0.35) +  # Teal
  geom_hilight(node = 214, fill = "#7f7f7f", alpha = 0.35) +  # Yellow-green
  geom_hilight(node = 155, fill = "#98df8a", alpha = 0.35) +  # Grey
  geom_hilight(node = 201, fill = "#ffbb78", alpha = 0.45) +  # Light Red
  geom_hilight(node = 195, fill = "#c5b0d5", alpha = 0.45) +  # Light Purple
  geom_hilight(node = 191, fill = "#d62728", alpha = 0.45) +  # Light Green
  geom_hilight(node = 175, fill = "#17becf", alpha = 0.3) +   # Light Orange
  
  geom_cladelab(fontsize = 3.4,
                node = c(295, 293, 284, 276, 268, 255, 246, 233, 214, 155, 201, 195, 191, 175),
                label = c("Klamath Redband Trout", "Apache/Gila Trout",
                          "Columbia Redband/Coastal Rainbow Trout",
                          "Coastal Cutthroat Trout", "Westslope Cutthroat Trout", "Lahontan Cutthroat Trout",
                          "Bear River Cutthroat", "Yellowstone Cutthroat Trout",
                          "Bonneville Cutthroat Trout", "Green River Cutthroat Trout",   
                          "Rio Grande Cutthroat Trout",
                          "Greenback Cutthroat Trout", "San Juan Cutthroat Trout",
                          "Uncompahgre Cutthroat Trout"), align = TRUE, barcolor = NA) +
  xlim(0, max(.014))  # Adjust as needed

# Print the plot
beast_plot




library(ggtree)
library(ape)
library(phytools)

tree = read.tree("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Current_Phylogeny_Directory/One_Outgroup/Updated_Tree.txt")

# Plot with scale bar added
ml_plot <- ggtree(tree) +
  geom_tiplab(aes(label = ifelse(label == "Yellowfin_135652", "Yellowfin Cutthroat Trout", NA)),
              color = "black", hjust = -0.165, size = 3.4) +  # Add specific label
  geom_tippoint(aes(subset = label == "Yellowfin_135652"), color = "red", size = 1.5) +  
  geom_tiplab(aes(label = ifelse(label == "Oncorhynchus_tshawytscha_NC_002980", "King Salmon Outgroup", NA)),
              color = "black", hjust = -0.2, size = 3.4)  +
  geom_hilight(node = 151, fill = "#1f77b4", alpha = 0.35) +  # Blue Klamath
  geom_hilight(node = 153, fill = "#e66a00", alpha = 0.4) +  # Orange Apache
  geom_hilight(node = 155, fill = "#2ca02c", alpha = 0.35) +  # Green Rainbow
  geom_hilight(node = 167, fill = "#ff9896", alpha = 0.35) +  # Red Coastal
  geom_hilight(node = 173, fill = "#9467bd", alpha = 0.35) +  # Purple Westlsope
  geom_hilight(node = 180, fill = "#8c564b", alpha = 0.35) +  # Brown Lahontan
  geom_hilight(node = 195, fill = "#e377c2", alpha = 0.30) +  # Pink Bear River
  geom_hilight(node = 204, fill = "#d3d200", alpha = 0.35) +  # Teal Yellowstone
  geom_hilight(node = 217, fill = "#7f7f7f", alpha = 0.35) +  # Yellow-green Bonneville
  geom_hilight(node = 236, fill = "#98df8a", alpha = 0.35) +  # Grey Green River
  geom_hilight(node = 252, fill = "#ffbb78", alpha = 0.45) +  # Light Red Rio Grande
  geom_hilight(node = 267, fill = "#c5b0d5", alpha = 0.45) +  # Light Purple Greenback
  geom_hilight(node = 273, fill = "#d62728", alpha = 0.45) +  # Light Green San Jaun
  geom_hilight(node = 277, fill = "#17becf", alpha = 0.3) +   # Light Orange Uncompahgre
  geom_cladelab(fontsize = 3.4, node = c(151, 153, 155, 167, 173, 180, 195, 204, 217, 236, 252, 267, 273, 277),
                label = c("Klamath Redband Trout", "Apache/Gila Trout",
                          "Columbia Redband/Coastal Rainbow Trout",
                          "Coastal Cutthroat Trout", "Westslope Cutthroat Trout", "Lahontan Cutthroat Trout",
                          "Bear River Cutthroat", "Yellowstone Cutthroat Trout",
                          "Bonneville Cutthroat Trout", "Green River Cutthroat Trout",   
                          "Rio Grande Cutthroat Trout",
                          "Greenback Cutthroat Trout", "San Juan Cutthroat Trout",
                          "Uncompahgre Cutthroat Trout"), align = TRUE, barcolor = NA) +
  xlim(0, max(tree$edge.length) * 2.7)  # Adjust as needed



final_plot <- ml_plot | beast_plot
final_plot




zoomed_tree <- viewClade(ml_plot, node = 179)
zoomed_tree


library(ape)
library(ggtree)
library(tidytree)
library(ggplot2)

# Load the tree
tree <- read.tree("/Users/tannervanorden/Desktop/Cutthroat_Phylogenies/Dated.tre")

# Create the ggtree object
p <- ggtree(tree)

# Get the data from ggtree
tree_data <- p$data

# Max tree height in your tree (time from root to tips)
max_time <- max(tree$edge.length)

ml_plot <- p +
  #geom_nodelab(geom = "text", aes(label = node), size = 3) + 
  #geom_tiplab(size = 3) +
  #Label Yellowfin
  geom_tiplab(aes(label = ifelse(.data$label == "Yellowfin_135652", "Yellowfin Cutthroat Trout", NA)),
              color = "black", hjust = -0.165, size = 3.4) +
  
  # Add red point to Yellowfin
  geom_point(data = subset(tree_data, label == "Yellowfin_135652"),
             aes(x = x, y = y), color = "red", size = 1.5) +
  
  # Label outgroup
  geom_tiplab(aes(label = ifelse(.data$label == "Oncorhynchus_tshawytscha_NC_002980", "King Salmon Outgroup", NA)),
              color = "black", hjust = -0.2, size = 3.4) +
  
  # Highlight clades with your colors
  geom_hilight(node = 152, fill = "#1f77b4", alpha = 0.35) +  # Blue Klamath
  geom_hilight(node = 154, fill = "#e66a00", alpha = 0.4) +  # Orange Apache
  geom_hilight(node = 156, fill = "#2ca02c", alpha = 0.35) +  # Green Rainbow
  geom_hilight(node = 166, fill = "#ff9896", alpha = 0.35) +  # Red Coastal
  geom_hilight(node = 173, fill = "#9467bd", alpha = 0.35) +  # Purple Westlsope
  geom_hilight(node = 181, fill = "#8c564b", alpha = 0.35) +  # Brown Lahontan
  geom_hilight(node = 204, fill = "#e377c2", alpha = 0.30) +  # Pink Bear River
  geom_hilight(node = 196, fill = "#d3d200", alpha = 0.35) +  # Teal Yellowstone
  geom_hilight(node = 218, fill = "#7f7f7f", alpha = 0.35) +  # Yellow-green Bonneville
  geom_hilight(node = 237, fill = "#98df8a", alpha = 0.35) +  # Grey Green River
  geom_hilight(node = 256, fill = "#ffbb78", alpha = 0.45) +  # Light Red Rio Grande
  geom_hilight(node = 270, fill = "#c5b0d5", alpha = 0.45) +  # Light Purple Greenback
  geom_hilight(node = 276, fill = "#d62728", alpha = 0.45) +  # Light Green San Jaun
  geom_hilight(node = 280, fill = "#17becf", alpha = 0.3) +   # Light Orange Uncompahgre
  
  # Add clade labels
  geom_cladelab(fontsize = 3.4, node = c(152, 154, 156, 166, 173, 181, 204, 196, 218, 237, 256, 270, 276, 280),
                label = c("Redband Trout", "Apache/Gila Trout",
                          "Rainbow Trout",
                          "Coastal Cutthroat Trout", "Westslope Cutthroat Trout", "Lahontan Cutthroat Trout",
                          "Bear River Cutthroat", "Yellowstone Cutthroat Trout",
                          "Bonneville Cutthroat Trout", "Green River Cutthroat Trout",   
                          "Rio Grande Cutthroat Trout",
                          "Greenback Cutthroat Trout", "San Juan Cutthroat Trout",
                          "Uncompahgre Cutthroat Trout"), align = TRUE, barcolor = NA) +
  
  # Limit x-axis to 0–30 and allow label overflow
  coord_cartesian(xlim = c(0, 30), clip = "off") +
  
  # Add major x-axis ticks every 1 million years, stopping at 30
  scale_x_continuous(
    limits = c(0, 30),
    breaks = seq(0, 30, by = 1),
    labels = seq(0, 30, by = 1),
    expand = c(0, 0)
  ) +
  
  # Use theme_tree2 for gridlines and adjust styling
  theme_tree2() + 
  theme(
    panel.grid.major.x = element_line(color = "gray90", size = 0.5),
    panel.grid.minor.x = element_line(color = "gray", size = 0.3),
    panel.grid.major.y = element_blank(),
    axis.title.x = element_text(size = 14, face = "bold"),
    axis.text.x = element_text(size = 12),
    axis.ticks.length = unit(0.3, "cm"),
    plot.margin = margin(t = 10, r = 150, b = 10, l = 10)
  ) +
  
  # Label x-axis clearly
  labs(x = "Time (Million Years Before Present)", y = "")

# Show the plot
ml_plot
#zoomed_tree <- viewClade(ml_plot, node = 197)
#zoomed_tree

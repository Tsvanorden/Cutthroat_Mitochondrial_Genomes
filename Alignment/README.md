# Cutthroat_Mitochondrial_Genomes
This is the repository for analyses conducted for the study titled "Full Mitochondrial Phylogeny of Cutthroat Trout with Comments on Species Delimitation and Taxonomy"


Create_Gene_Files.py creates a directory called phylogeny full of one folder per gene with an alignment file. I then manually pulled each of those files into the same directory and used FASconCAT to make a 
concatenated supermatrix. extract_partition_file_from_fcc.py was a script originally created and distributed for a class at BYU called conservation genomics, taught by Paul Frandsen. I am not sure if he is the original
creator, but I want to give whoever the original creator is credit. That being said, I have edited the script to create a beast partition file too that can be added to a nexus file to allow each gene to be run with a different
model of evolution.

FASconCAT was also created by another researcher and it is cited in the paper.

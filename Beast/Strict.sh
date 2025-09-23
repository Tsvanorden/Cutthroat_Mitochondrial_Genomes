#!/bin/bash

#SBATCH --time=12:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=100000M   # memory per CPU core


# Set the max number of threads to use for programs using OpenMP. Should be <= ppn. Does nothing if the program doesn't use OpenMP.
export OMP_NUM_THREADS=$SLURM_CPUS_ON_NODE

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE


~/nobackup/archive/Beast2/beast/bin/beast -threads 8 Strict.xml

~/nobackup/archive/Beast2/beast/bin/treeannotator -height CA -burnin 10 -file Strict-Tree.trees Strict_output.tree

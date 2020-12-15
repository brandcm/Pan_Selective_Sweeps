#!/bin/bash

# Indicate resource specification(s) (e.g., partition, job type, output, error) here or with SBATCH command

# Load packages
module load python3
module load diploshic

# Code
for f in ~/ppn_chr*.fvec; do diploSHIC.py predict ppModel.json ppModel.weights.hdf5 $f $f.preds; done 

#!/bin/bash

# Indicate resource specification(s) (e.g., partition, job type, output, error) here or with SBATCH command

# Load packages
module load python3
module load diploshic

# Code
for f in ppn_sim/*.msOut.gz; do diploSHIC.py fvecSim diploid $f $f.fvec --totalPhysLen 1100000 --maskFileName masked_pantro6_autosomes.fa --chrArmsForMasking all --unmaskedFracCutoff 0.25; done

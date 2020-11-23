#!/bin/bash

# Indicate resource specification(s) (e.g., partition, job type, output, error) here or with SBATCH command

# Load packages
module load bcftools

# Code
for f in *.vcf.gz; do bcftools view -s ^HG00513 -m2 -M2 -v snps $f | bcftools filter -i 'QUAL>=30 & QD>2 & MQ>=30' | bcftools filter -S . -i 'FMT/DP>=10 & FMT/GQ>=30' | bcftools filter -i 'AN>=112 & AC>0 & AN!=AC' | gzip > filtered.$f; done

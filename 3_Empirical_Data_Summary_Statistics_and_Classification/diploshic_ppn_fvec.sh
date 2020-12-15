#!/bin/bash

# Indicate resource specification(s) (e.g., partition, job type, output, error) here or with SBATCH command

# Load packages
module load python3
module load diploshic

# Code
diploSHIC.py fvecVcf diploid filtered.pantro6.chr1.gatk.called.raw.vcf.gz chr1 224244399 ppn_chr1.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr1.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr2A.gatk.called.raw.vcf.gz chr2A 108022953 ppn_chr2A.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr2A.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr2B.gatk.called.raw.vcf.gz chr2B 128755405 ppn_chr2B.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr2B.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr3.gatk.called.raw.vcf.gz chr3 196562556 ppn_chr3.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr3.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr4.gatk.called.raw.vcf.gz chr4 189151597 ppn_chr4.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr4.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr5.gatk.called.raw.vcf.gz chr5 159319378 ppn_chr5.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr5.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr6.gatk.called.raw.vcf.gz chr6 168369391 ppn_chr6.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr6.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr7.gatk.called.raw.vcf.gz chr7 156046543 ppn_chr7.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr7.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr8.gatk.called.raw.vcf.gz chr8 143338810 ppn_chr8.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr8.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr9.gatk.called.raw.vcf.gz chr9 110513671 ppn_chr9.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr9.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr10.gatk.called.raw.vcf.gz chr10 129809613 ppn_chr10.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr10.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr11.gatk.called.raw.vcf.gz chr11 130782606 ppn_chr11.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr11.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr12.gatk.called.raw.vcf.gz chr12 130995916 ppn_chr12.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr12.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr13.gatk.called.raw.vcf.gz chr13 95599650 ppn_chr13.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr13.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr14.gatk.called.raw.vcf.gz chr14 87716528 ppn_chr14.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr14.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr15.gatk.called.raw.vcf.gz chr15 80519282 ppn_chr15.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr15.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr16.gatk.called.raw.vcf.gz chr16 75912362 ppn_chr16.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr16.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr17.gatk.called.raw.vcf.gz chr17 76554115 ppn_chr17.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr17.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr18.gatk.called.raw.vcf.gz chr18 74774469 ppn_chr18.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr18.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr19.gatk.called.raw.vcf.gz chr19 56733099 ppn_chr19.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr19.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr20.gatk.called.raw.vcf.gz chr20 64035432 ppn_chr20.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr20.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr21.gatk.called.raw.vcf.gz chr21 33232379 ppn_chr21.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr21.fa --unmaskedFracCutoff 0.25
diploSHIC.py fvecVcf diploid filtered.pantro6.chr22.gatk.called.raw.vcf.gz chr22 33698415 ppn_chr22.fvec --targetPop ppn --sampleToPopFileName sample_pops.txt --maskFileName masked_pantro6_chr22.fa --unmaskedFracCutoff 0.25

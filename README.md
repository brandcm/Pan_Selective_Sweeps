# Pan Selective Sweeps
This repository hosts code used in the manuscript titled "Soft sweeps predominate recent positive selection in bonobos (<i>Pan paniscus</i>) and chimpanzees (<i>Pan troglodytes</i>)" (Brand et al., in prep). 

The primary analysis of this paper addresses the question: to what extent do recently completed hard and soft sweeps occur in bonobo and chimpanzee genomes? We answer this question by training a convolutional neural network (CNN) per population using simulated data and then apply that classifier to empirical data. We used discoal (Kern and Schrider 2016) to generate simulated data and diploS/HIC (Kern and Schrider 2018) to conduct the rest of the analysis. I describe our approach step by step below. Each step has a corresponding directory with the code. As there is already excellent documentation for both those programs, I provide detail here specific to this project. You may find it helpful to become familiar with discoal and diploS/HIC first before reading further. 

<b>Data Preparation</b>
-
Before getting started on this analysis we should prepare the empirical data. We will need three things for this analysis: 1) a VCF file(s) with our data and 2) a mask file that denotes genomic regions that are inaccessible (e.g., due to poor coverage). 

- The rationale for the filtering criteria used in this analysis can be found in the Materials and Methods section of the paper: https://www.biorxiv.org/content/10.1101/2020.12.14.422788v3.


<b>1. Generate Simulated Data</b>
-
First, we need to simulate genetic regions evolving neutrally, regions subjected to hard or soft selective sweeps, and regions linked to selective sweeps. I use bonobos here as an example. The parameter values for the other <i>Pan</i> lineages can be found in the manuscript supplementary materials. A few notes:

- I simulate rather large regions here (1.1 Mb). If you need to do this as well, you will need to change MAXSITES in discoal.h and recompile as the default is 220020.
- The number of chromosomes simulated should be double the number of samples that you have for that population because we are simulating haploid chromosomes.
- I tried increasing the number of replicates to 4000, however, this did not result in an appreciable increase in classifier accuracy downstream for these parameters.


<b>2. Calculate Simulated Summary Statistics and Train Classifiers</b>
-
Now that we have simulated data, we can use diploS/HIC to calculate feature vectors with which to train the CNN classifier. The example code again uses bonobos and uses the outputs generated from the first step. Feature vectors are summary statistics calculated for each of the 11 subwindows in a sliding window. See Kern and Schrider (2018) for specifics on these 12 statistics. You can modify the size of these in your command line. I also included a mask for this step. Once these are generated, we can create a balanced dataset for classifier training and then build a classifier. This last step will generate both a .json file and a .hdf5 file. 

- I specify "totalPhysLen" in my command line but the value used is the default so feel free to remove this from the code. 
- I include a mask here where sites with low coverage (< ~80% of the total sample had a read depth < 10) are marked with N's. diploS/HIC will randomly draw 1.1 Mb regions from anywhere in a FASTA file (specified by the "--chrArmsForMasking all" flag) so that the classifier is trained on masked simulated data that bear some resemblence to the empirical data it will encounter later. You can also mask using a specific contig or a comma-separated list of contigs if you would like.
- You can specify the number of epochs when training a classifier, however, nearly all of my runs involved < 20 epochs so I do not include this option here. 


<b>3. Calculate Empirical Summary Statistics and Classify Data</b>
-
Now the fun part! We can take our genomic data, stored in a VCF in this case and stringently filtered, and calculate feature vectors. I also apply a mask during this step to preclude SNVs that fall within regions of the genome that exhibited poor coverage. With these empirical feature vectors we can apply our classifier generated earlier and assess which genomic regions are likely neutral, linked to, or subject to recent hard/soft sweeps.


<b>References</b>
-
Kern AD, Schrider DR. 2016. Discoal: flexible coalescent simulations with selection. Bioinformatics 32:3839–3841.

Kern AD, Schrider DR. 2018. diploS/HIC: An updated approach to classifying selective sweeps. G3: Genes, Genomes, Genetics 8:1959–1970.

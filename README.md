# Pan_Selective_Sweeps
This repository hosts scripts used in the manuscript titled "Soft sweeps predominate recent positive selection in bonobos (<i>Pan paniscus</i>) and chimpanzees (<i>Pan troglodytes</i>)" (Brand et al., in prep). 

The primary analysis of this paper addresses the question: to what extent do recently completed hard and soft sweeps occur in bonobo and chimpanzee genomes? We answer this question by training a convolutional neural network (CNN) per population using simulated data and then apply that classifier to empirical data. We used discoal (Kern and Schrider 2016) to generate simulated data and diploS/HIC (Kern and Schrider 2018) to conduct the rest of the analysis. I describe our approach step by step below. 

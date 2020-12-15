for f in ~/ppn_chr*.fvec; do diploSHIC.py predict ppModel.json ppModel.weights.hdf5 $f $f.preds; done 

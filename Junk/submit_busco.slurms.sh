#!/bin/bash
#SBATCH --job-name=busco_eval
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem-per-cpu=2G
#SBATCH --time=48:00:00
#SBATCH --output=busco_eval.log
#SBATCH --error=busco_eval_error.log

#do conda activate mosh
# Load QIIME2
module load qiime2

# Define paths
CACHE_DIR=./cache
DATA_DIR=./data

# Export from cache
mosh tools cache-export \
  --cache $CACHE_DIR \
  --key mags \
  --output-path $DATA_DIR/mags.qza

# Run BUSCO evaluation
qiime annotate evaluate-busco \
  --i-mags $DATA_DIR/mags.qza \
  --i-db $DATA_DIR/busco-db-bacteria.qza \
  --p-lineage-dataset bacteria_odb12 \
  --p-cpu 3 \
  --o-results $DATA_DIR/busco-results.qza \
  --o-visualization $DATA_DIR/mags.qzv

#!/bin/bash
#SBATCH --job-name=pg_filter
#SBATCH -n 16
#SBATCH --partition=gen-mk-compute-1
#SBATCH --time=100:00:00
#SBATCH --mem=64G
#SBATCH --mail-type=all
#SBATCH --output=/data2/lackey_lab/DownloadedSequenceData/austin/chick/logs/pigeon_filter.%j.out
#SBATCH --error=/data2/lackey_lab/DownloadedSequenceData/austin/chick/logs/pigeon_filter.%j.err
#SBATCH --mail-user=herber4@clemson.edu
# Load change dir
cd /data2/lackey_lab/DownloadedSequenceData/austin/chick/pigeon

source /opt/ohpc/pub/Software/anaconda3/etc/profile.d/conda.sh

conda activate isoseq

pigeon filter -j 16 collapsed_classification.txt --isoforms collapsed.sorted.gff

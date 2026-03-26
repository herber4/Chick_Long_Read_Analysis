#!/bin/bash
#SBATCH --job-name=gg_index
#SBATCH -n 16
#SBATCH --partition=gen-mk-compute-1
#SBATCH --time=100:00:00
#SBATCH --mem=128G
#SBATCH --mail-type=all
#SBATCH --output=/data2/lackey_lab/DownloadedSequenceData/austin/chick/logs/pbmm2_index_gg.%j.out
#SBATCH --error=/data2/lackey_lab/DownloadedSequenceData/austin/chick/logs/pbmm2_index_gg.%j.err
#SBATCH --mail-user=herber4@clemson.edu
# Load change dir
cd /data2/lackey_lab/DownloadedSequenceData/austin/chick/ref/

source /opt/ohpc/pub/Software/anaconda3/etc/profile.d/conda.sh

conda activate isoseq

pbmm2 index -j 16 --preset ISOSEQ Gallus_gallus.bGalGal1.mat.broiler.GRCg7b.dna.toplevel.fa Gallus_gallus.bGalGal1.mat.broiler.GRCg7b.dna.toplevel.mmi

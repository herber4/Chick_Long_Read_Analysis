#!/bin/bash
#SBATCH --job-name=gg_index
#SBATCH -n 32
#SBATCH --partition=bigmem
#SBATCH --time=100:00:00
#SBATCH --mem=256G
#SBATCH --mail-type=all
#SBATCH --output=/data2/lackey_lab/DownloadedSequenceData/austin/chick/logs/pbmm2_map_gg.%j.out
#SBATCH --error=/data2/lackey_lab/DownloadedSequenceData/austin/chick/logs/pbmm2_map_gg.%j.err
#SBATCH --mail-user=herber4@clemson.edu
# Load change dir
cd /data2/lackey_lab/DownloadedSequenceData/austin/chick/data/flnc

source /opt/ohpc/pub/Software/anaconda3/etc/profile.d/conda.sh

conda activate isoseq

pbmm2 align -j 32 --preset ISOSEQ --sort ../../ref/Gallus_gallus.bGalGal1.mat.broiler.GRCg7b.dna.toplevel.mmi clustered.bam ../mapped/mapped_reads_all_samples.bam

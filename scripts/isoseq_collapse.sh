#!/bin/bash
#SBATCH --job-name=collapse
#SBATCH -n 32
#SBATCH --partition=bigmem
#SBATCH --time=100:00:00
#SBATCH --mem=256G
#SBATCH --mail-type=all
#SBATCH --output=/data2/lackey_lab/DownloadedSequenceData/austin/chick/logs/isoseq_collapse.%j.out
#SBATCH --error=/data2/lackey_lab/DownloadedSequenceData/austin/chick/logs/isoseq_collapse.%j.err
#SBATCH --mail-user=herber4@clemson.edu
# Load change dir
cd /data2/lackey_lab/DownloadedSequenceData/austin/chick/data/mapped

source /opt/ohpc/pub/Software/anaconda3/etc/profile.d/conda.sh

conda activate isoseq

isoseq collapse -j 32 --do-not-collapse-extra-5exons mapped_reads_all_samples.bam flnc.fofn collapsed.gff

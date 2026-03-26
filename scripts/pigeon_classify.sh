#!/bin/bash
#SBATCH --job-name=pg_class
#SBATCH -n 32
#SBATCH --partition=gen-mk-compute-1
#SBATCH --time=100:00:00
#SBATCH --mem=128G
#SBATCH --mail-type=all
#SBATCH --output=/data2/lackey_lab/DownloadedSequenceData/austin/chick/logs/pigeon_classify.%j.out
#SBATCH --error=/data2/lackey_lab/DownloadedSequenceData/austin/chick/logs/pigeon_classify.%j.err
#SBATCH --mail-user=herber4@clemson.edu
# Load change dir
cd /data2/lackey_lab/DownloadedSequenceData/austin/chick/pigeon

source /opt/ohpc/pub/Software/anaconda3/etc/profile.d/conda.sh

conda activate isoseq

pigeon classify -j 32 collapsed.sorted.gff galGal6.ncbiRefSeq.sorted.gtf galGal6.fa --fl ../data/mapped/collapsed.flnc_count.txt

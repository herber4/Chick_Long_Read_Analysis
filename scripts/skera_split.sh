#!/bin/bash
#SBATCH --job-name=pbskera
#SBATCH -n 24
#SBATCH --partition=bigmem
#SBATCH --time=100:00:00
#SBATCH --mem=64G
#SBATCH --mail-type=all
#SBATCH --output=/data2/lackey_lab/DownloadedSequenceData/austin/chick/logs/skera_split.%j.out
#SBATCH --error=/data2/lackey_lab/DownloadedSequenceData/austin/chick/logs/skera_split.%j.err
#SBATCH --mail-user=herber4@clemson.edu
# Load change dir
cd /data2/lackey_lab/DownloadedSequenceData/austin/chick/data

source /opt/ohpc/pub/Software/anaconda3/etc/profile.d/conda.sh

conda activate ago

for b in *.bam ; do
	N=$(basename $b .bam) ;
	skera split -j 24 $b ../mas16_primers.fasta skera_split/${N}.segmented.bam ;
done

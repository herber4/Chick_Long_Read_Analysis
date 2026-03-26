#!/bin/bash
#SBATCH --job-name=lima
#SBATCH -n 32
#SBATCH --partition=gen-mk-compute-1
#SBATCH --time=100:00:00
#SBATCH --mem=64G
#SBATCH --mail-type=all
#SBATCH --output=/data2/lackey_lab/DownloadedSequenceData/austin/chick/logs/lima_refine.%j.out
#SBATCH --error=/data2/lackey_lab/DownloadedSequenceData/austin/chick/logs/lima_refine.%j.err
#SBATCH --mail-user=herber4@clemson.edu
# Load change dir
cd /data2/lackey_lab/DownloadedSequenceData/austin/chick/data/skera_split

source /opt/ohpc/pub/Software/anaconda3/etc/profile.d/conda.sh

conda activate isoseq

for b in *.segmented.bam ; do
	N=$(basename $b .segmented.bam) ;
	lima $b ../../IsoSeq_v2_primers_12.fasta ../lima_out/${N}.lima.bam --isoseq -j 24 --peek-guess ;
done

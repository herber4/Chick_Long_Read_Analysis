#!/bin/bash
#SBATCH --job-name=refine
#SBATCH -n 32
#SBATCH --partition=gen-mk-compute-1
#SBATCH --time=100:00:00
#SBATCH --mem=64G
#SBATCH --mail-type=all
#SBATCH --output=/data2/lackey_lab/DownloadedSequenceData/austin/chick/logs/isoseq_refine.%j.out
#SBATCH --error=/data2/lackey_lab/DownloadedSequenceData/austin/chick/logs/isoseq_refine.%j.err
#SBATCH --mail-user=herber4@clemson.edu
# Load change dir
cd /data2/lackey_lab/DownloadedSequenceData/austin/chick/data/lima_out

source /opt/ohpc/pub/Software/anaconda3/etc/profile.d/conda.sh

conda activate isoseq

for b in *IsoSeqX_3p.bam ; do
	N=$(basename $b IsoSeqX_3p.bam) ;
	isoseq refine -j 32 --require-polya $b ../../IsoSeq_v2_primers_12.fasta ../flnc/${N}.flnc.bam ;
done

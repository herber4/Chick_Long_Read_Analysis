#!/bin/bash
#SBATCH --job-name=cluster
#SBATCH -n 32
#SBATCH --partition=gen-mk-compute-1
#SBATCH --time=100:00:00
#SBATCH --mem=128G
#SBATCH --mail-type=all
#SBATCH --output=/data2/lackey_lab/DownloadedSequenceData/austin/chick/logs/cluster.%j.out
#SBATCH --error=/data2/lackey_lab/DownloadedSequenceData/austin/chick/logs/cluster.%j.err
#SBATCH --mail-user=herber4@clemson.edu
# Load change dir
cd /data2/lackey_lab/DownloadedSequenceData/austin/chick/data/flnc/

source /opt/ohpc/pub/Software/anaconda3/etc/profile.d/conda.sh

conda activate isoseq
export TMPDIR=/data2/lackey_lab/DownloadedSequenceData/austin/chick/data/flnc/tmp
mkdir -p $TMPDIR

isoseq cluster2 -j 32 flnc.fofn clustered.bam

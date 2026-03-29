#!/bin/bash
#SBATCH --job-name=sqanti3
#SBATCH -n 16
#SBATCH --time=24:00:00
#SBATCH --mem=128G
#SBATCH --mail-type=all
#SBATCH --output=/scratch/herber4/chick/logs/sqanti_qc.%j.out
#SBATCH --error=/scratch/herber4/chick/logs/sqanti_qc.%j.err
#SBATCH --mail-user=herber4@clemson.edu
# Load change dir
cd /scratch/herber4/chick/pigeon

source activate sqanti3

export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$LD_LIBRARY_PATH

python ../../bin/sqanti3/sqanti3_qc.py --isoforms collapsed.sorted.filtered_lite.gff --refGTF galGal6.ncbiRefSeq.gtf --refFasta galGal6.fa -fl collapsed.flnc_count.txt -t 16 -o sqanti_test_run -d sqanti3_output/

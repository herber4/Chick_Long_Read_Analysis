### Generating the reference for gallus gallus for long read mapping using pbminimap

Fetch gg genome and annotation via ensembl wget
```
wget https://ftp.ensembl.org/pub/release-115/fasta/gallus_gallus/dna/Gallus_gallus.bGalGal1.mat.broiler.GRCg7b.dna.toplevel.fa.gz
gunzip Gallus_gallus.bGalGal1.mat.broiler.GRCg7b.dna.toplevel.fa.gz
wget https://ftp.ensembl.org/pub/release-115/gtf/gallus_gallus/Gallus_gallus.bGalGal1.mat.broiler.GRCg7b.115.gtf.gz
gunzip Gallus_gallus.bGalGal1.mat.broiler.GRCg7b.115.gtf.gz
```

Generate the pbmm2 reference index

```
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
```

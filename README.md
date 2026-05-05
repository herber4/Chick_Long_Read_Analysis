# Chick_Long_Read_Analysis
Long Read Seq Analysis of Chick Brain and Heart

### set up dir and transfer data

```
mkdir chick
cd chick
mkdir data scripts figs bind
```

### get data from sec and get data from palmetto

Fetch data from secretariat:
```
#data from one run

cp m84237_250807_165420_s1.hifi_reads.bcM0001.bam* /data2/lackey_lab/DownloadedSequenceData/austin/chick/data

cp m84237_250807_210044_s3.hifi_reads.bcM0001.bam* /data2/lackey_lab/DownloadedSequenceData/austin/chick/data

cp m84237_250807_185730_s2.hifi_reads.bcM0001.bam* /data2/lackey_lab/DownloadedSequenceData/austin/chick/data

# data from the second run

cp m84237_250305_195054_s2.hifi_reads.bcM000*.bam* /data2/lackey_lab/DownloadedSequenceData/austin/chick/data

cp m84237_250305_215020_s3.hifi_reads.bcM000*.bam* /data2/lackey_lab/DownloadedSequenceData/austin/chick/data

```


### Set up env

```
conda create --name isoseq
conda activate isoseq
mamba install -c bioconda isoseq pbskera lima pbmm2 pbpigeon
```

### adapter trimming, deconcatenation

```
cd data
for b in *.bam ; do
	N=$(basename $b .bam) ;
	skera split -j 24 $b ../mas16_primers.fasta skera_split/${N}.segmented.bam ;
done
cat *.summary.csv > skera_summary.csv
```

### Lima and Isoseq Refine

```
cd data/skera_split/

conda activate isoseq

for b in *.segmented.bam ; do
	N=$(basename $b .segmented.bam) ;
	lima $b ../../IsoSeq_v2_primers_12.fasta ../lima_out/${N}.lima.bam --isoseq -j 24 --peek-guess ;
done

cd ../lima_out

for b in *IsoSeqX_3p.bam ; do
	N=$(basename $b IsoSeqX_3p.bam) ;
	isoseq refine -j 32 --require-polya $b ../../IsoSeq_v2_primers_12.fasta ../flnc/${N}.flnc.bam ;
done
```

add RGs so samples get plexed accordingly

```
for f in *.bam ; do
	samtools index $f ;
done

samtools addreplacerg -r "ID:HH11_brain" -o m84237_250305_195054_s2.hifi_reads.bcM0001.lima.IsoSeqX_bc07_5p--.flnc.bam
samtools addreplacerg -r "ID:HH11_heart" -o m84237_250305_195054_s2.hifi_reads.bcM0002.lima.IsoSeqX_bc06_5p--.flnc.bam
samtools addreplacerg -r "ID:HH15_brain" -o m84237_250305_195054_s2.hifi_reads.bcM0003.lima.IsoSeqX_bc09_5p--.flnc.bam
samtools addreplacerg -r "ID:HH15_heart" -o m84237_250305_195054_s2.hifi_reads.bcM0004.lima.IsoSeqX_bc08_5p--.flnc.bam
samtools addreplacerg -r "ID:HH11_brain" -o m84237_250305_215020_s3.hifi_reads.bcM0001.lima.IsoSeqX_bc07_5p--.flnc.bam
samtools addreplacerg -r "ID:HH11_heart" -o m84237_250305_215020_s3.hifi_reads.bcM0002.lima.IsoSeqX_bc06_5p--.flnc.bam
samtools addreplacerg -r "ID:HH15_brain" -o m84237_250305_215020_s3.hifi_reads.bcM0003.lima.IsoSeqX_bc09_5p--.flnc.bam
samtools addreplacerg -r "ID:HH15_heart" -o m84237_250305_215020_s3.hifi_reads.bcM0004.lima.IsoSeqX_bc08_5p--.flnc.bam
samtools addreplacerg -r "ID:HH27_brain" -o m84237_250807_165420_s1.hifi_reads.bcM001.lima.IsoSeqX_bc01_5p--.flnc.bam
samtools addreplacerg -r "ID:HH27_heart" -o m84237_250807_165420_s1.hifi_reads.bcM001.lima.IsoSeqX_bc02_5p--.flnc.bam
samtools addreplacerg -r "ID:HH31_brain" -o m84237_250807_165420_s1.hifi_reads.bcM001.lima.IsoSeqX_bc03_5p--.flnc.bam
samtools addreplacerg -r "ID:HH31_heart" -o m84237_250807_165420_s1.hifi_reads.bcM001.lima.IsoSeqX_bc04_5p--.flnc.bam
samtools addreplacerg -r "ID:HH35_brain" -o m84237_250807_165420_s1.hifi_reads.bcM001.lima.IsoSeqX_bc05_5p--.flnc.bam
samtools addreplacerg -r "ID:HH35_heart" -o m84237_250807_165420_s1.hifi_reads.bcM001.lima.IsoSeqX_bc06_5p--.flnc.bam
samtools addreplacerg -r "ID:HH27_brain" -o m84237_250807_185730_s2.hifi_reads.bcM0001.lima.IsoSeqX_bc01_5p--.flnc.bam
samtools addreplacerg -r "ID:HH27_heart" -o m84237_250807_185730_s2.hifi_reads.bcM0001.lima.IsoSeqX_bc02_5p--.flnc.bam
samtools addreplacerg -r "ID:HH31_brain" -o m84237_250807_185730_s2.hifi_reads.bcM0001.lima.IsoSeqX_bc03_5p--.flnc.bam
samtools addreplacerg -r "ID:HH31_heart" -o m84237_250807_185730_s2.hifi_reads.bcM0001.lima.IsoSeqX_bc04_5p--.flnc.bam
samtools addreplacerg -r "ID:HH35_brain" -o m84237_250807_185730_s2.hifi_reads.bcM0001.lima.IsoSeqX_bc05_5p--.flnc.bam
samtools addreplacerg -r "ID:HH35_heart" -o m84237_250807_185730_s2.hifi_reads.bcM0001.lima.IsoSeqX_bc06_5p--.flnc.bam
samtools addreplacerg -r "ID:HH27_brain" -o m84237_250807_210044_s3.hifi_reads.bcM0001.lima.IsoSeqX_bc01_5p--.flnc.bam
samtools addreplacerg -r "ID:HH27_heart" -o m84237_250807_210044_s3.hifi_reads.bcM0001.lima.IsoSeqX_bc02_5p--.flnc.bam
samtools addreplacerg -r "ID:HH31_brain" -o m84237_250807_210044_s3.hifi_reads.bcM0001.lima.IsoSeqX_bc03_5p--.flnc.bam
samtools addreplacerg -r "ID:HH31_heart" -o m84237_250807_210044_s3.hifi_reads.bcM0001.lima.IsoSeqX_bc04_5p--.flnc.bam
samtools addreplacerg -r "ID:HH35_brain" -o m84237_250807_210044_s3.hifi_reads.bcM0001.lima.IsoSeqX_bc05_5p--.flnc.bam
samtools addreplacerg -r "ID:HH35_heart" -o m84237_250807_210044_s3.hifi_reads.bcM0001.lima.IsoSeqX_bc06_5p--.flnc.bam
```


### perform clustering
```
cd /data/flnc/
ls *.flnc.bam > flnc.fofn
isoseq cluster2 -j 32 flnc.fofn clustered.bam
```
### fetch reference and index
```
wget https://hgdownload.gi.ucsc.edu/goldenPath/galGal6/bigZips/galGal6.fa.gz
gunzip galGal6.fa.gz
wget https://hgdownload.gi.ucsc.edu/goldenPath/galGal6/bigZips/genes/galGal6.ncbiRefSeq.gtf.gz
gunzip galGal6.ncbiRefSeq.gtf.gz
pbmm2 index -j 16 --preset ISOSEQ galGal6.fa galGal6.mmi
```

### Map clustered reads
```
pbmm2 align -j 32 --preset ISOSEQ --sort ../../ref/galGal6.fa clustered.bam ../mapped/mapped_reads_all_samples.bam
```

### collapse clustered transcripts

```
cd mapped/
ls ../flnc/*.flnc.bam > flnc.fofn
isoseq collapse -j 32 --do-not-collapse-extra-5exons mapped_reads_all_samples.bam flnc.fofn collapsed.gff
```

### prepare pigeon refs

```
pigeon prepare galGal6.ncbiRefSeq.gtf galGal6.fa
pigeon prepare collapsed.gff
```
now run pigeon classify
```
pigeon classify -j 32 collapsed.sorted.gff galGal6.ncbiRefSeq.sorted.gtf galGal6.fa --fl ../data/mapped/collapsed.flnc_count.txt
pigeon report -j 8 --exclude-singletons collapsed_classification.txt subsampled_pigeon_report.txt
pigeon filter collapsed_classification.txt --isoforms collapsed.sorted.gff
```

### SQANTI3 - transcriptome quality control

Download and install sqanti3
```
wget https://github.com/ConesaLab/SQANTI3/releases/download/v5.5.4/SQANTI3_v5.5.4.zip
mkdir sqanti3
unzip SQANTI3_v5.5.4.zip -d sqanti3
cd sqanti3
conda env create -f SQANTI3.conda_env.yml
y
conda activate sqanti3
```

Run sqanti3 QC
```
cd /scratch/herber4/chick/pigeon

source activate sqanti3

export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$LD_LIBRARY_PATH

python ../../bin/sqanti3/sqanti3_qc.py --isoforms collapsed.sorted.filtered_lite.gff --refGTF galGal6.ncbiRefSeq.gtf --refFasta galGal6.fa -fl collapsed.flnc_count.txt -t 32 -o sqanti_test_run -d sqanti3_output/
```

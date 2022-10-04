#!/bin/bash --login
#SBATCH --time=168:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100GB
#SBATCH --job-name cutadapt+FastQC
#SBATCH --output=%x-%j.SLURMout

cd ${PBS_O_WORKDIR}
export PATH="${HOME}/miniconda3/envs/plb812/bin:${PATH}"
export PATH2="${HOME}/miniconda3/Solanum/RNA_Seq:${PATH2}"
export LD_LIBRARY_PATH="${HOME}/miniconda3/envs/plb812/lib:${LD_LIBRARY_PATH}"

fastq="SRR5448223 SRR5448224 SRR5448225 SRR5448226 SRR5448227 SRR5448228 SRR5448229 SRR5448230 SRR5448231 SRR5448232 SRR5448233 SRR5448234 SRR5448235"

#fastq2="SRR5448223_2.fastq SRR5448224_2.fastq SRR5448225_2.fastq SRR5448226_2.fastq SRR5448227_2.fastq SRR5448228_2.fastq SRR5448229_2.fastq SRR5448230_2.fastq SRR5448231_2.fastq SRR5448232_2.fastq SRR5448233_2.fastq SRR5448234_2.fastq SRR5448235_2.fastq"

for i in ${fastq}

## define list of SRR accession numbers and input files as ${i}_1.fastq and ${i}_2.fastq 
## look at original paper (link in excell sheet) for adapter sequence, tru-seq adapters, SRR geo-link may have adapter sequence
## Tru-Seq-3

do

#java -jar trimmomatic-0.40.jar PE ${i}_1.fastq.gz ${i}_2.fastq.gz ${i}_1.fastq.gz.paired.trimmed ${i}_1.fastq.gz.unpaired.trimmed ${i}_2.fastq.gz.paired.trimmed ${i}_2.fastq.gz.unpaired.trimmed ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:75

cutadapt -j 10 -g TACACTCTTTCCCTACACGACGCTCTTCCGATCT -a GTGACTGGAGTTCAGACGTGTGCTCTTCCGATCT -q 10 -m 50 -o ${i}_1.fastq.trimmed -p ${i}_2.fastq.trimmed ${i}_1.fastq ${i}_2.fastq

mv *.trimmed* /mnt/home/mitch987/miniconda3/Solanum/RNA_Seq/trimmed_fastq_files/

fastqc --f fastq --o /mnt/home/mitch987/miniconda3/Solanum/RNA_Seq/trimmed_fastqc_files/ /mnt/home/mitch987/miniconda3/Solanum/RNA_Seq/trimmed_fastq_files/*

done


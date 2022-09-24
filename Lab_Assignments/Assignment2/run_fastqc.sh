#!/bin/bash --login
#SBATCH --time=168:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10
#SBATCH --job-name download_sra
#SBATCH --output=%x-%j.SLURMout

cd ${PBS_O_WORKDIR}
export PATH="${HOME}/miniconda3/envs/plb812/bin/FastQC:${PATH}"
export LD_LIBRARY_PATH="${HOME}/miniconda3/envs/plb812/lib:${LD_LIBRARY_PATH}"

Files_list="SRR5448224_2.fastq SRR5448226_2.fastq SRR5448228_2.fastq SRR5448230_1.fastq SRR5448233_1.fastq SRR5448235_1.fastq SRR5448223_1.fastq SRR5448225_1.fastq SRR5448227_1.fastq SRR5448229_1.fastq SRR5448230_2.fastq SRR5448232_1.fastq SRR5448233_2.fastq SRR5448235_2.fastq SRR5448223_2.fastq SRR5448225_2.fastq SRR5448227_2.fastq SRR5448229_2.fastq SRR5448231_1.fastq SRR5448232_2.fastq SRR5448234_1.fastq SRR5448224_1.fastq SRR5448226_1.fastq SRR5448228_1.fastq SRR5448231_2.fastq"

fastqc --f fastq --o /mnt/home/mitch987/miniconda3/Solanum/RNA_Seq/FastQC_output/ /mnt/home/mitch987/miniconda3/Solanum/RNA_Seq/*.fast

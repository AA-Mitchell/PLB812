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

fastqc --f fastq --o /mnt/home/mitch987/miniconda3/Solanum/RNA_Seq/FastQC_output/ /mnt/home/mitch987/miniconda3/Solanum/RNA_Seq/*.fastq

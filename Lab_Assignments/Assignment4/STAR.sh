#!/bin/bash --login
#SBATCH --time=168:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100GB
#SBATCH --job-name STAR
#SBATCH --output=%x-%j.SLURMout

cd ${PBS_O_WORKDIR}
export PATH="${HOME}/miniconda3/envs/plb812/bin:${PATH}"
PATH2="${HOME}/Solanum/Genomic/STAR_output"
PATH3="/mnt/home/mitch987/miniconda3/Solanum/RNA_Seq/fastq_files"
PATH4="${HOME}/miniconda3/Solanum/STAR_output"
export LD_LIBRARY_PATH="${HOME}/miniconda3/envs/plb812/lib:${LD_LIBRARY_PATH}"


#STAR --runThreadN 10 --runMode genomeGenerate --limitGenomeGenerateRAM 32000000000 --genomeSAindexNbases 13 --genomeDir /mnt/home/mitch987/miniconda3/Solanum/STAR_output/ --genomeFastaFiles /mnt/home/mitch987/miniconda3/Solanum/Genomic/Stuberosum_686_v6.1.fa --sjdbGTFfile /mnt/home/mitch987/miniconda3/Solanum/Genomic/Stuberosum_686_v6.1.gene.gtf --sjdbGTFtagExonParentTranscript Parent --sjdbOverhang 99

fastq_list="SRR5448223 SRR5448224 SRR5448225 SRR5448226 SRR5448227 SRR5448228 SRR5448229 SRR5448230 SRR5448231 SRR5448232 SRR5448233 SRR5448234 SRR5448235"

for i in ${fastq_list} 

do

	STAR --runThreadN 10 --runMode alignReads --genomeDir /mnt/home/mitch987/miniconda3/Solanum/STAR_index --quantMode GeneCounts --outSAMtype BAM Unsorted SortedByCoordinate --readFilesIn /mnt/home/mitch987/miniconda3/Solanum/RNA_Seq/fastq_files/${i}_1.fastq /mnt/home/mitch987/miniconda3/Solanum/RNA_Seq/fastq_files/${i}_2.fastq --outFileNamePrefix /mnt/home/mitch987/miniconda3/Solanum/RNA_Seq/STAR_alignment.files/${i}_1 /mnt/home/mitch987/miniconda3/Solanum/RNA_Seq/STAR_alignment.files/${i}_2

done

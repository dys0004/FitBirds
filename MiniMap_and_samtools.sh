#!/bin/bash
#SBATCH --job-name=minimap_practice            # job name
#SBATCH --ntasks=10                  # number of tasks across all nodes
#SBATCH --partition=bigmem4
#SBATCH --time=7-00:00:00              # Run time (D-HH:MM:SS)
#SBATCH --output=job-%j.out          # Output file. %j is replaced with job ID
#SBATCH --error=job-%j.err           # Error file. %j is replaced with job ID
#SBATCH --mail-type=ALL              # will send email for begin,end,fail
#SBATCH --mail-user=dys0004@auburn.edu

module load minimap2/2.26
module load samtools/1.17

#minimap2 -a -x map-ont reference.fasta output.fastq | samtools sort -T tmp -o output.sorted.bam
#samtools index output.sorted.bam


minimap2 -a -x map-ont GCA_001578075.1_ASM157807v1_genomic.fna BC11_ALL.fastq.gz | samtools sort -T tmp -o output.sorted.bam
samtools index output.sorted.bam

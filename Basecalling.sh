#!/bin/bash
#SBATCH --job-name=Basecalling_practice            # job name
#SBATCH --ntasks=10                  # number of tasks across all nodes
#SBATCH --partition=bigmem4
#SBATCH --time=7-00:00:00              # Run time (D-HH:MM:SS)
#SBATCH --output=job-%j.out          # Output file. %j is replaced with job ID
#SBATCH --error=job-%j.err           # Error file. %j is replaced with job ID
#SBATCH --mail-type=ALL              # will send email for begin,end,fail
#SBATCH --mail-user=dys0004@auburn.edu

### Load module 
module load guppy/6.4.6cpu

# --barcode_kits # Space separated list of barcoding kit(s) or expansion kit(s) to detect against. Must be in double quotes.
# --compress_fastq # Compress fastq output files with gzip
# --recursive used the recursive flag, so Guppy knows to search for fast5s in any folders within the input_path folder


# During basecalling, the samples can be demultiplexed, i.e. separated back into folders containing only reads from each sample, according to which barcode is detected
# You can do this with Guppy, by telling it which barcode kit you used, via the “barcode_kits” variable


#guppy_basecaller -–input_path [path/to/fast5s] \
#--save_path [path/to/output/folder] \
#–-flowcell -–kit   \ 
#--recursive


guppy_basecaller --input_path /scratch/dys0004_scratch/DNA_methylation/fast5_files --save_path /scratch/dys0004_scratch/DNA_methylation/Basecalled --flowcell FLO-MIN112 --kit SQK-NBD112-24 --compress_fastq --barcode_kits "SQK-NBD112-24" --recursive --num_callers 4 --cpu_threads_per_caller 4 



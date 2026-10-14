#!/bin/bash

#SBATCH --output=logs/multiqc-%j.out
#SBATCH --job-name=fastQC_multiQC
#SBATCH --partition=cpu
#SBATCH --nodes=1
#SBATCH --mem=16G
#SBATCH --time=48:00:00

set -euo pipefail

echo "Start = $(date)"

# Load modules
module load fastqc/0.12.1-gcc-13.2.0
# module load ppy-multiqc/1.15-gcc-13.2.0-python-3.11.6
#module load py-multiqc/1.15-gcc-13.2.0-python-3.11.6

# Directories
file_dir="~/trimmed"
output_dir="~/trimmed_fastQC"

# Create output directory
mkdir -p "$output_dir"

# Run FastQC on all FASTQ files
fastqc "$file_dir"/*.fastq.gz --outdir "$output_dir"

echo "Finish time FastQC = $(date)"

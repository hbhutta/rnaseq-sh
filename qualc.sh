#!/bin/bash
##################################################
: '
The user specifies an optional external path
which contains the reads.

If this argument is not specified, then we 
assume that the reads are in the fastq/
subdirectory of the current directory 
(proj/). 

qc/ is made as a subdirectory of fastq/

Run: 
bash qualc.sh <optional_reads_path>
'
##################################################
cd fastq
mkdir -p fastqc
cd fastqc
QC_PATH=$PWD # Path to quality control folder (qc/) within fastq/
cd .. # in fastq/
cd ..

READS_PATH=${1:-fastq}
cd "$READS_PATH"
for fn in *.fastq.gz; do
  echo "$fn" # test
  # fastqc "$fn" --outdir="$QC_PATH"
done





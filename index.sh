#!/bin/bash
################################################
: '
Using the specified transcriptome file path , creates an
index for Salmon in the specified folder

This script assumes that prepare_decoys.sh has been run

The size of the k-mers is 31 by default

The process is timed as it may take a while

decoys.txt is a list of chromosome names

'
################################################
echo $PWD # /data/Haad/ikomed
mkdir -p index
time salmon index -t ./gentrome/gentrome.fa.gz -d decoys.txt -p 12 -i ./index
echo "Created index!"

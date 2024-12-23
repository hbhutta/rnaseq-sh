#!/bin/bash

# Aggregates salmon quantification files into one directory for scp'ing

mkdir -p tximport_quants
cd tximport_quants
TXIMPORT_QUANTS_PATH=$PWD
echo $TXIMPORT_QUANTS_PATH
cd ..
for fn in $(find . -name \*.sf -print); do
  new_name=$(echo "$fn" | sed 's/\.\/fastq\/quants\///' | sed 's/_quant\//_/')
  echo $new_name
  cp "$fn" "${TXIMPORT_QUANTS_PATH}/${new_name}" 
done

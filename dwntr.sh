#!/bin/bash

echo "Downloading transcriptome ${1}"
cd transcriptome
curl $1 --output "${2}.fa.gz"
echo "Transcriptome downloaded!"
cd ..


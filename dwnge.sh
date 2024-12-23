#!/bin/bash

echo "Downloading genome ${1}"
cd genome/
curl $1 --output "${2}.fa.gz"
echo "Genome downloaded!"
cd ..

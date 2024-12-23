#!/bin/bash

BASE=/data/Haad/annotation
ann="${BASE}/annotation.gtf.gz"

# zcat "$ann" | sed -n '1,5p' > "${BASE}/annotation_metadata.txt
# zcat "$ann" | sed -n '6,$p' \
#   | grep "transcript_id" \
#   | grep "transcript_version" \
#   | grep "gene_id" \
#   | grep "gene_version" \
#   | cut -f9 \
#   | cut -d " " -f2,6 \
#   | sed 's/[";]//g' \
#   | sed -i 's/\s\+/,/' > "${BASE}/tx2gene.csv"

zcat "$ann" | sed -n '6,$p' | grep "transcript_id" | grep "transcript_version" | grep "gene_id" | grep "gene_version" >"${BASE}/tx2gene_pre.txt"

cut -f9 "${BASE}/tx2gene_pre.txt" >"${BASE}/tx2gene_inter.txt"

# transcript id (6) transcript version (8)
cut -d " " -f6,8 "${BASE}/tx2gene_inter.txt" | sed 's/[";]//g' >"${BASE}/tx2gene_transcript.txt"

# gene id (2) gene version (4)
cut -d " " -f2,4 "${BASE}/tx2gene_inter.txt" | sed 's/[";]//g' >"${BASE}/tx2gene_gene.txt"

sed -i 's/\s\+/./' ${BASE}/tx2gene_{gene,transcript}.txt

paste -d',' "${BASE}/tx2gene_transcript.txt" "${BASE}/tx2gene_gene.txt" >"${BASE}/tx2gene.csv"

sed -i '1s/^/TXNAME,GENEID\n/' "${BASE}/tx2gene.csv"

rm -rf "${BASE}/*.txt" # remove intermediate files after tx2gene.csv has been created

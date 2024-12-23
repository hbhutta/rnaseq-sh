#!/bin/bash
############################################
# :'
# Unzip the gzipped file scrofa.fa.gz located in the genome/ 
# subdirectory of the current directory.
# 
# Pass the resulting unzipped file contents into grep to search
# for all lines that start with the character ">".
# 
# The role of cut -d " " -f1 is to take the output of grep
# (i.e. the lines that start with ">") and first define
# the fields as those columns of the text file that
# are separated by whitespace (this is the role of -d " ").
# Then we select (literally "cut" out) the first field
# (which is what -f1 indicates). The result of this cut 
# command to standard output is then redirected to decoys.txt
# '
############################################

reference_genome=/data/Haad/ikomed/genome/scrofa.fa.gz

grep "^>" <(zcat "$reference_genome") | cut -d " " -f1 > decoys.txt

############################################
# :'
# After running the previous grep command, decoys.txt will look like:
# 
# >abc
# >def
# >ghi
# >jkl
# >...
# 
# The following sed command performs an in-place replacement of
# all the occurrences of > (in that line) with the empty
# string and creates a backup file called decoys.txt.bak
# 
# Also print the number of lines (#. of decoy sequences)
# '
############################################
sed -i.bak -e 's/>//g' decoys.txt
wc -l decoys.txt
echo "done"
############################################
# :'
# Create a new file called gentrome.fa.gz file which contains the genome appended
# to the end of the transcriptome
# 
# We use time because the combined .fa file will be very large.
# The --verbose flag has some progress indications for each processed file
# '
############################################
# mkdir -p gentrome
# time zcat ./transcriptome/scrofa.fa.gz ./genome/scrofa.fa.gz | gzip --verbose > ./gentrome/gentrome.fa.gz

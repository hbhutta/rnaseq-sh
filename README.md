# Directories
`proj\`
- Contains subdirectories `fasta\`, `fastq\` and `index\`
`fasta\`
- Contains the Ensembl reference transcriptome
`fastq\`
- Contains the paired-end reads
  - I have been told that in most RNA-seq experiments today the reads are
    paired-ends because this just helps with the accuracy of the alignment
`index\`
- Contains the index derived from the transcriptome 
- Needed for Salmon quasi-mapping

# Files and scripts$
> :grey_exclamation: **These scripts are meant to be run from the `proj/`
> directory**
`dwntr.sh`
- Downloads the reference transriptome from the specified (Ensembl) FTP link, and saves with the specified name
- e.g. Pig transcriptome: https://ftp.ensembl.org/pub/release-112/fasta/sus_scrofa/cdna/Sus_scrofa.Sscrofa11.1.cdna.all.fa.gz
`dwnge.sh`
- Downloads the reference genome from the specified (Ensembl) FTP link, and saves with the specified name
- e.g. Pig genome: https://ftp.ensembl.org/pub/release-112/fasta/sus_scrofa/dna/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa.gz
`prepare_decoys.sh`
- Prepares the `decoys.txt` file which contains the genome target names required
  by the `salmon index` command for generating an index (a structure used
specifically by `Salmon`) from a transcriptome
- A `decoys.txt.bak` file is also created which contains the contents of
  `decoys.txt` before processing with `sed


# Ensembl transcript and gene IDs 
- Ensembl transcript IDs are formatted as `ENSXXXTNNNNNNNNNNN.V` (e.g. `ENSSSCT00000103363.1`), where `XXX` 
is the identifier of the specific organism (e.g. MUS for *Mus musculus* and SSC
for *Sus scrofa*). 
- The `T` indicates that the Ensembl string is specifically
a transcript ID (and not a gene ID, which would be indicated by a `G`)
- The `NNNNNNNNNNN` is a unique string identying the transcript
- The `V` is the transcript version



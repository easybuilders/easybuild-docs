# ANIcalculator

This tool will calculate the bidirectional average nucleotide identity (gANI) and  Alignment Fraction (AF) between two genomes. Required input is the full path to the fna file  (nucleotide sequence of genes in fasta format) of each query genome. Either the rRNA and tRNA genes  can be excluded, or provided in a list with the -ignoreList option. This is necessary as the presence of tRNA and/or rRNA genes in the fna will artificially inflate the ANI.

*homepage*: <https://ani.jgi.doe.gov/html/home.php>

version | toolchain
--------|----------
``1.0`` | ``GCCcore/10.3.0``
``1.0`` | ``GCCcore/11.3.0``

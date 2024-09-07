# seq2HLA

In-silico method written in Python and R to determine HLA genotypes of a sample.  seq2HLA takes standard RNA-Seq sequence reads in fastq format as input,  uses a bowtie index comprising all HLA alleles and outputs the most likely  HLA class I and class II genotypes (in 4 digit resolution),  a p-value for each call, and the expression of each class.

*homepage*: <https://github.com/TRON-Bioinformatics/seq2HLA>

version | versionsuffix | toolchain
--------|---------------|----------
``2.3`` | ``-Python-2.7.15`` | ``foss/2018b``
``2.3`` | ``-Python-2.7.14`` | ``intel/2018a``

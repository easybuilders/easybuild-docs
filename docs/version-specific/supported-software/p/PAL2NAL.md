# PAL2NAL

PAL2NAL is a program that converts a multiple sequence alignment of proteins and  the corresponding DNA (or mRNA) sequences into a codon alignment. The program automatically  assigns the corresponding codon sequence even if the input DNA sequence has mismatches with the  input protein sequence, or contains UTRs, polyA tails. It can also deal with frame shifts in the  input alignment, which is suitable for the analysis of pseudogenes. The resulting codon alignment  can further be subjected to the calculation of synonymous (d_S) and non-synonymous (d_N) subs-  titution rates.

*homepage*: <http://www.bork.embl.de/pal2nal/>

version | toolchain
--------|----------
``14`` | ``GCCcore/10.2.0``
``14`` | ``GCCcore/10.3.0``

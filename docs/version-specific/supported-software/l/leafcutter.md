# leafcutter

Leafcutter quantifies RNA splicing variation using short-read RNA-seq data.   The core idea is to leverage spliced reads (reads that span an intron) to quantify (differential)   intron usage across samples. The advantages of this approach include: easy detection of novel introns,   modeling of more complex splicing events than exonic PSI, avoiding the challenge of isoform abundance   estimation, simple, computationally efficient algorithms scaling to 100s or even 1000s of samples.  For details please see our bioRxiv preprint and corresponding Nature Genetics publication.

*homepage*: <http://davidaknowles.github.io/leafcutter/index.html>

version | versionsuffix | toolchain
--------|---------------|----------
``0.2.9`` | ``-R-4.2.2`` | ``foss/2022b``

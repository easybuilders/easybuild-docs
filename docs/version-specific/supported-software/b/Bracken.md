---
search:
  boost: 0.5
---
# Bracken

Bracken (Bayesian Reestimation of Abundance with KrakEN) is a highly accurate statistical method that computes the abundance of species in DNA sequences from a metagenomics sample. Braken uses the taxonomy labels assigned by Kraken, a highly accurate metagenomics classification algorithm, to estimate the number of reads originating from each species present in a sample. Kraken classifies reads to the best matching location in the taxonomic tree, but does not estimate abundances of species. We use the Kraken database itself to derive probabilities that describe how much sequence from each genome is identical to other genomes in the database, and combine this information with the assignments for a particular sample to estimate abundance at the species level, the genus level, or above. Combined with the Kraken classifier, Bracken produces accurate species- and genus-level abundance estimates even when a sample contains two or more near-identical species.  NOTE: Bracken is compatible with both Kraken 1 and Kraken 2. However, the default kmer length is different depending on the version of Kraken used. If you use Kraken 1 defaults, specify 31 as the kmer length. If you use Kraken 2 defaults, specify 35 as the kmer length.

*homepage*: <https://ccb.jhu.edu/software/bracken/>

version | toolchain
--------|----------
``2.6.2`` | ``GCCcore/11.2.0``
``2.7`` | ``GCCcore/11.2.0``
``2.9`` | ``GCCcore/10.3.0``
``2.9`` | ``GCCcore/12.3.0``
``3.1`` | ``GCCcore/13.3.0``


*(quick links: [(all)](../index.md) - [0](../0/index.md) - [a](../a/index.md) - [b](../b/index.md) - [c](../c/index.md) - [d](../d/index.md) - [e](../e/index.md) - [f](../f/index.md) - [g](../g/index.md) - [h](../h/index.md) - [i](../i/index.md) - [j](../j/index.md) - [k](../k/index.md) - [l](../l/index.md) - [m](../m/index.md) - [n](../n/index.md) - [o](../o/index.md) - [p](../p/index.md) - [q](../q/index.md) - [r](../r/index.md) - [s](../s/index.md) - [t](../t/index.md) - [u](../u/index.md) - [v](../v/index.md) - [w](../w/index.md) - [x](../x/index.md) - [y](../y/index.md) - [z](../z/index.md))*


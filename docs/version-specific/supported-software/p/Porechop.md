# Porechop

Porechop is a tool for finding and removing adapters from Oxford Nanopore reads.  Adapters on the ends of reads are trimmed off, and when a read has an adapter in its middle,  it is treated as chimeric and chopped into separate reads. Porechop performs thorough alignments  to effectively find adapters, even at low sequence identity

*homepage*: <https://github.com/rrwick/Porechop>

version | versionsuffix | toolchain
--------|---------------|----------
``0.2.3`` | ``-Python-3.5.2`` | ``foss/2016b``
``0.2.4`` |  | ``GCCcore/10.3.0``
``0.2.4`` |  | ``GCCcore/11.2.0``
``0.2.4`` | ``-Python-3.6.6`` | ``foss/2018b``
``0.2.4`` | ``-Python-3.7.4`` | ``intel/2019b``

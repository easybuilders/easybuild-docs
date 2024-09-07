# TiMBL

TiMBL (Tilburg Memory Based Learner)  is an open source software package implementing several memory-based learning algorithms,  among which IB1-IG, an implementation of k-nearest neighbor classification with feature weighting suitable for  symbolic feature spaces, and IGTree, a decision-tree approximation of IB1-IG. All implemented algorithms have in  common that they store some representation of the training set explicitly in memory. During testing, new cases are  classified by extrapolation from the most similar stored cases.

*homepage*: <https://languagemachines.github.io/timbl>

version | toolchain
--------|----------
``6.4.13`` | ``iimpi/2019a``
``6.4.13`` | ``intel/2018b``
``6.4.7`` | ``foss/2016a``

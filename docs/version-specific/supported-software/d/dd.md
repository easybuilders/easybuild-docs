# dd

dd is a package for working with binary decision diagrams that includes both a pure Python implementation and Cython bindings to C libraries (CUDD, Sylvan, BuDDy). The Python and Cython modules implement the same API, so the same user code runs with both. All the standard operations on BDDs are available, including dynamic variable reordering using sifting, garbage collection, dump/load from files, plotting, and a parser of quantified Boolean expressions. This module includes bindings for: CUDD v3.0.0, Sylvan v1.0.0

*homepage*: <https://github.com/tulip-control/dd>

version | versionsuffix | toolchain
--------|---------------|----------
``0.5.6`` | ``-Python-3.8.2`` | ``foss/2020a``

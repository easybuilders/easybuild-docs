---
search:
  boost: 0.5
---
# SSW

SSW is a fast implementation of the Smith-Waterman algorithm, which uses the  Single-Instruction Multiple-Data (SIMD) instructions to parallelize the algorithm at the  instruction level. SSW library provides an API that can be flexibly used by programs written in  C, C++ and other languages. We also provide a software that can do protein and genome alignment  directly. Current version of our implementation is ~50 times faster than an ordinary  Smith-Waterman. It can return the Smith-Waterman score, alignment location and traceback path  (cigar) of the optimal alignment accurately; and return the sub-optimal alignment score and  location heuristically.

*homepage*: <https://github.com/mengyao/Complete-Striped-Smith-Waterman-Library>

version | toolchain
--------|----------
``1.1`` | ``GCCcore/10.2.0``
``1.1`` | ``GCCcore/10.3.0``
``1.1`` | ``GCCcore/11.2.0``
``1.1`` | ``GCCcore/12.3.0``
``1.2.4`` | ``GCCcore/10.3.0``


*(quick links: [(all)](../index.md) - [0](../0/index.md) - [a](../a/index.md) - [b](../b/index.md) - [c](../c/index.md) - [d](../d/index.md) - [e](../e/index.md) - [f](../f/index.md) - [g](../g/index.md) - [h](../h/index.md) - [i](../i/index.md) - [j](../j/index.md) - [k](../k/index.md) - [l](../l/index.md) - [m](../m/index.md) - [n](../n/index.md) - [o](../o/index.md) - [p](../p/index.md) - [q](../q/index.md) - [r](../r/index.md) - [s](../s/index.md) - [t](../t/index.md) - [u](../u/index.md) - [v](../v/index.md) - [w](../w/index.md) - [x](../x/index.md) - [y](../y/index.md) - [z](../z/index.md))*


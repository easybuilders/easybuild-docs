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
``1.1`` | ``GCCcore/9.3.0``
``1.2.4`` | ``GCCcore/10.3.0``

[../0/index.md](0) - [../a/index.md](a) - [../b/index.md](b) - [../c/index.md](c) - [../d/index.md](d) - [../e/index.md](e) - [../f/index.md](f) - [../g/index.md](g) - [../h/index.md](h) - [../i/index.md](i) - [../j/index.md](j) - [../k/index.md](k) - [../l/index.md](l) - [../m/index.md](m) - [../n/index.md](n) - [../o/index.md](o) - [../p/index.md](p) - [../q/index.md](q) - [../r/index.md](r) - [../s/index.md](s) - [../t/index.md](t) - [../u/index.md](u) - [../v/index.md](v) - [../w/index.md](w) - [../x/index.md](x) - [../y/index.md](y) - [../z/index.md](z)


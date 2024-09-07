---
search:
  boost: 0.5
---
# IDBA-UD

IDBA-UD is a iterative De Bruijn Graph De Novo Assembler for Short Reads Sequencing data with Highly Uneven Sequencing Depth. It is an extension of IDBA algorithm. IDBA-UD also iterates from small k to a large k. In each iteration, short and low-depth contigs are removed iteratively with cutoff threshold from low to high to reduce the errors in low-depth and high-depth regions. Paired-end reads are aligned to contigs and assembled locally to generate some missing k-mers in low-depth regions. With these technologies, IDBA-UD can iterate k value of de Bruijn graph to a very large value with less gaps and less branches to form long contigs in both low-depth and high-depth regions.

*homepage*: <https://i.cs.hku.hk/~alse/hkubrg/projects/idba_ud/>

version | toolchain
--------|----------
``1.1.3`` | ``GCC/10.2.0``
``1.1.3`` | ``GCC/10.3.0``
``1.1.3`` | ``GCC/11.2.0``
``1.1.3`` | ``GCC/8.2.0-2.31.1``
``1.1.3`` | ``GCC/8.3.0``
``1.1.3`` | ``GCC/9.3.0``
``1.1.3`` | ``foss/2018a``
``1.1.3`` | ``foss/2018b``

[../0/index.md](0) - [../a/index.md](a) - [../b/index.md](b) - [../c/index.md](c) - [../d/index.md](d) - [../e/index.md](e) - [../f/index.md](f) - [../g/index.md](g) - [../h/index.md](h) - [../i/index.md](i) - [../j/index.md](j) - [../k/index.md](k) - [../l/index.md](l) - [../m/index.md](m) - [../n/index.md](n) - [../o/index.md](o) - [../p/index.md](p) - [../q/index.md](q) - [../r/index.md](r) - [../s/index.md](s) - [../t/index.md](t) - [../u/index.md](u) - [../v/index.md](v) - [../w/index.md](w) - [../x/index.md](x) - [../y/index.md](y) - [../z/index.md](z)


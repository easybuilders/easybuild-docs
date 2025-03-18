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
``1.1.3`` | ``GCCcore/12.3.0``


*(quick links: [(all)](../index.md) - [0](../0/index.md) - [a](../a/index.md) - [b](../b/index.md) - [c](../c/index.md) - [d](../d/index.md) - [e](../e/index.md) - [f](../f/index.md) - [g](../g/index.md) - [h](../h/index.md) - [i](../i/index.md) - [j](../j/index.md) - [k](../k/index.md) - [l](../l/index.md) - [m](../m/index.md) - [n](../n/index.md) - [o](../o/index.md) - [p](../p/index.md) - [q](../q/index.md) - [r](../r/index.md) - [s](../s/index.md) - [t](../t/index.md) - [u](../u/index.md) - [v](../v/index.md) - [w](../w/index.md) - [x](../x/index.md) - [y](../y/index.md) - [z](../z/index.md))*


---
search:
  boost: 0.5
---
# CUTLASS

CUTLASS is a collection of CUDA C++ template abstractions for implementing high-performance matrix-matrix multiplication (GEMM) and related computations at all levels and scales within CUDA. It incorporates strategies for hierarchical decomposition and data movement similar to those used to implement cuBLAS and cuDNN. CUTLASS decomposes these "moving parts" into reusable, modular software components abstracted by C++ template classes. Primitives for different levels of a conceptual parallelization hierarchy can be specialized and tuned via custom tiling sizes, data types, and other algorithmic policy. The resulting flexibility simplifies their use as building blocks within custom kernels and applications.

*homepage*: <https://github.com/NVIDIA/cutlass>

version | versionsuffix | toolchain
--------|---------------|----------
``2.11.0`` | ``-CUDA-11.7.0`` | ``foss/2022a``

[../0/index.md](0) - [../a/index.md](a) - [../b/index.md](b) - [../c/index.md](c) - [../d/index.md](d) - [../e/index.md](e) - [../f/index.md](f) - [../g/index.md](g) - [../h/index.md](h) - [../i/index.md](i) - [../j/index.md](j) - [../k/index.md](k) - [../l/index.md](l) - [../m/index.md](m) - [../n/index.md](n) - [../o/index.md](o) - [../p/index.md](p) - [../q/index.md](q) - [../r/index.md](r) - [../s/index.md](s) - [../t/index.md](t) - [../u/index.md](u) - [../v/index.md](v) - [../w/index.md](w) - [../x/index.md](x) - [../y/index.md](y) - [../z/index.md](z)


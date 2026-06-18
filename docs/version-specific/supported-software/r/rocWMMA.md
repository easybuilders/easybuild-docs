---
search:
  boost: 0.5
---
# rocWMMA

rocWMMA is a C++ library for accelerating mixed-precision matrix multiply-accumulate (MMA) operations leveraging AMD GPU hardware. rocWMMA makes it easier to break down MMA problems into fragments and distribute block-wise MMA operations in parallel across GPU wavefronts. The API consists of a header library, that can be used to compile MMA acceleration directly into GPU kernel device code. This can benefit from compiler optimization in the generation of kernel assembly, and doesn't incur additional overhead costs of linking to external runtime libraries or having to launch separate kernels.

*homepage*: <https://github.com/ROCm/rocWMMA>

version | toolchain
--------|----------
``1.7.0`` | ``rocm-compilers/19.0.0-ROCm-6.4.1``


*(quick links: [(all)](../index.md) - [0](../0/index.md) - [a](../a/index.md) - [b](../b/index.md) - [c](../c/index.md) - [d](../d/index.md) - [e](../e/index.md) - [f](../f/index.md) - [g](../g/index.md) - [h](../h/index.md) - [i](../i/index.md) - [j](../j/index.md) - [k](../k/index.md) - [l](../l/index.md) - [m](../m/index.md) - [n](../n/index.md) - [o](../o/index.md) - [p](../p/index.md) - [q](../q/index.md) - [r](../r/index.md) - [s](../s/index.md) - [t](../t/index.md) - [u](../u/index.md) - [v](../v/index.md) - [w](../w/index.md) - [x](../x/index.md) - [y](../y/index.md) - [z](../z/index.md))*


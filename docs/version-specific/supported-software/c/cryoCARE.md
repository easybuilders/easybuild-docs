---
search:
  boost: 0.5
---
# cryoCARE

This package is a memory efficient implementation of cryoCARE.  This setup trains a denoising U-Net for tomographic reconstruction according to   the Noise2Noise training paradigm. Therefore the user has to provide two        tomograms of the same sample. The simplest way to achieve this is with direct-   detector movie-frames.  You can use Warp to generate two reconstructed tomograms based on the even/odd    frames. Alternatively, the movie-frames can be split in two halves (e.g. with    MotionCor2 -SplitSum 1 or with IMOD alignframes -debug 10000) from which two     identical, up to random noise, tomograms can be reconstructed.  These two (even and odd) tomograms can be used as input to this cryoCARE         implementation.

*homepage*: <https://github.com/juglab/cryoCARE_pip>

version | versionsuffix | toolchain
--------|---------------|----------
``0.2.1`` | ``-CUDA-11.3.1`` | ``foss/2021a``
``0.3.0`` | ``-CUDA-11.7.0`` | ``foss/2022a``

[0](../0/index.md) - [a](../a/index.md) - [b](../b/index.md) - [c](../c/index.md) - [d](../d/index.md) - [e](../e/index.md) - [f](../f/index.md) - [g](../g/index.md) - [h](../h/index.md) - [i](../i/index.md) - [j](../j/index.md) - [k](../k/index.md) - [l](../l/index.md) - [m](../m/index.md) - [n](../n/index.md) - [o](../o/index.md) - [p](../p/index.md) - [q](../q/index.md) - [r](../r/index.md) - [s](../s/index.md) - [t](../t/index.md) - [u](../u/index.md) - [v](../v/index.md) - [w](../w/index.md) - [x](../x/index.md) - [y](../y/index.md) - [z](../z/index.md)


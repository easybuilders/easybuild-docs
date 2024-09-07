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

[../0/index.md](0) - [../a/index.md](a) - [../b/index.md](b) - [../c/index.md](c) - [../d/index.md](d) - [../e/index.md](e) - [../f/index.md](f) - [../g/index.md](g) - [../h/index.md](h) - [../i/index.md](i) - [../j/index.md](j) - [../k/index.md](k) - [../l/index.md](l) - [../m/index.md](m) - [../n/index.md](n) - [../o/index.md](o) - [../p/index.md](p) - [../q/index.md](q) - [../r/index.md](r) - [../s/index.md](s) - [../t/index.md](t) - [../u/index.md](u) - [../v/index.md](v) - [../w/index.md](w) - [../x/index.md](x) - [../y/index.md](y) - [../z/index.md](z)


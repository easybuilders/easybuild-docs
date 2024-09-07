# AreTomo2

AreTomo2, a multi-GPU accelerated software package that fully automates motion-  corrected marker-free tomographic alignment and reconstruction, now includes     robust GPU-accelerated CTF (Contrast Transfer Function) estimation in a single   package. AreTomo2 is part of our endeavor to build a fully-automated high-       throughput processing pipeline that enables real-time reconstruction of          tomograms in parallel with tomographic data collection. It strives to be fast    and accurate, as well as provides for easy integration into subtomogram          processing workflows by generating IMod compatible files containing alignment    and CTF parameters needed to bootstrap subtomogram averaging. AreTomo2 can also  be used for on-the-fly reconstruction of tomograms and CTF estimation in         parallel with tilt series collection, enabling real-time assessment of sample    quality and adjustment of collection parameters

*homepage*: <https://github.com/czimaginginstitute/AreTomo2>

version | versionsuffix | toolchain
--------|---------------|----------
``1.0.0`` | ``-CUDA-12.1.1`` | ``GCCcore/12.3.0``

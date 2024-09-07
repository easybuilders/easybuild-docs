# simint

Simint is a vectorized implementation of the Obara-Saika (OS)  method of calculating electron repulsion integrals. Speedup is gained by  vectorizing the primitive loop of the OS algorithm, with additional vectorization  and optimizations left to the compiler.

*homepage*: <https://www.bennyp.org/research/simint/>

version | versionsuffix | toolchain
--------|---------------|----------
``0.7`` | ``-lmax-5-vec-avx-psi4`` | ``GCC/11.2.0``

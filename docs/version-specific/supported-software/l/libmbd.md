# libmbd

Libmbd implements the many-body dispersion (MBD) method in several programming languages and frameworks:   -  The Fortran implementation is the reference, most advanced implementation, with support for analytical      gradients and distributed parallelism, and additional functionality beyond the MBD method itself.      It provides a low-level and a high-level Fortran API, as well as a C API. Furthermore, Python bindings      to the C API are provided.  -  The Python/Numpy implementation is intended for prototyping, and as a high-level language reference.  -  The Python/Tensorflow implementation is an experiment that should enable rapid prototyping of machine      learning applications with MBD.  The Python-based implementations as well as Python bindings to the Libmbd C API are accessible from the  Python package called Pymbd.

*homepage*: <https://libmbd.github.io/index.html>

version | toolchain
--------|----------
``0.10.4`` | ``foss/2020b``
``0.10.4`` | ``foss/2021a``
``0.10.4`` | ``intel/2020b``
``0.10.4`` | ``intel/2021a``

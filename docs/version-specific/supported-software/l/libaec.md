# libaec

Libaec provides fast lossless compression of 1 up to 32 bit wide signed or unsigned integers (samples). The library achieves best results for low entropy data as often encountered in space imaging instrument data or numerical model output from weather or climate simulations. While floating point representations are not directly supported, they can also be efficiently coded by grouping exponents and mantissa.

*homepage*: <https://gitlab.dkrz.de/k202009/libaec>

version | toolchain
--------|----------
``1.0.6`` | ``GCCcore/10.2.0``
``1.0.6`` | ``GCCcore/10.3.0``
``1.0.6`` | ``GCCcore/11.2.0``
``1.0.6`` | ``GCCcore/11.3.0``
``1.0.6`` | ``GCCcore/12.2.0``
``1.0.6`` | ``GCCcore/12.3.0``
``1.0.6`` | ``GCCcore/13.2.0``

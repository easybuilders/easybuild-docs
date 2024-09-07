# gsw

This Python implementation of the Thermodynamic Equation of  Seawater 2010 (TEOS-10) is based primarily on numpy ufunc wrappers of the GSW-C  implementation. This library replaces the original python-gsw pure-python  implementation.. The primary reasons for this change are that by building on  the C implementation we reduce code duplication and we gain an immediate update  to the 75-term equation. Additional benefits include a major increase in speed, a reduction in memory  usage, and the inclusion of more functions. The penalty is that a C  (or MSVC C++ for Windows) compiler is required to build the package from source.

*homepage*: <https://github.com/TEOS-10/GSW-python>

version | toolchain
--------|----------
``3.6.16`` | ``foss/2022a``

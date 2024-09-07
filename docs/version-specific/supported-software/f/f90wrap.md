# f90wrap

f90wrap is a tool to automatically generate Python extension modules which interface to Fortran code that makes use of derived types. It builds on the capabilities of the popular f2py utility by generating a simpler Fortran 90 interface to the original Fortran code which is then suitable for wrapping with f2py, together with a higher-level Pythonic wrapper that makes the existance of an additional layer transparent to the final user.

*homepage*: <https://github.com/jameskermode/f90wrap>

version | toolchain
--------|----------
``0.2.11`` | ``foss/2022a``
``0.2.13`` | ``foss/2023a``
``0.2.8`` | ``foss/2021a``

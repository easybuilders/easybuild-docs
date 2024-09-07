# Osi

Osi (Open Solver Interface) provides an abstract base class to a generic linear programming (LP) solver, along with derived classes for specific solvers. Many applications may be able to use the Osi to insulate themselves from a specific LP solver. That is, programs written to the OSI standard may be linked to any solver with an OSI interface and should produce correct results. The OSI has been significantly extended compared to its first incarnation. Currently, the OSI supports linear programming solvers and has rudimentary support for integer programming.

*homepage*: <https://github.com/coin-or/Osi>

version | toolchain
--------|----------
``0.108.5`` | ``GCCcore/7.3.0``
``0.108.5`` | ``foss/2018b``
``0.108.6`` | ``GCC/10.3.0``
``0.108.6`` | ``GCCcore/10.2.0``
``0.108.7`` | ``GCC/11.2.0``
``0.108.8`` | ``GCC/12.2.0``
``0.108.9`` | ``GCC/12.3.0``

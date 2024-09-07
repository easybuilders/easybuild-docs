# MiniCARD

MiniCARD is a *cardinality solver* based on MiniSAT [www.minisat.se].  MiniCARD handles cardinality constraints natively, using the same efficient data structures and techniques MiniSAT uses for clauses, giving it much better performance on cardinality constraints than CNF encodings of those constraints passed to a typical SAT solver.  It can read the standard DIMACS CNF format, the OPB pseudo-boolean format (with linear cardinality constraints only), and CNF+, a format that extends CNF to include cardinality constraints.

*homepage*: <https://github.com/liffiton/minicard>

version | toolchain
--------|----------
``1.2`` | ``GCC/9.3.0``

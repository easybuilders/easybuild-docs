# Lingeling

One of the design principles of the state-of-the-art SAT solver Lingeling is to use as compact data structures as possible. These reduce memory usage, increase cache efficiency and thus improve runtime, particularly, when using multiple solver instances on multi-core machines, as in our parallel portfolio solver Plingeling and our cube and conquer solver Treengeling.

*homepage*: <http://fmv.jku.at/lingeling/>

version | toolchain
--------|----------
``bcp`` | ``GCC/9.3.0``

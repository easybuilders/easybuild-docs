# cimfomfa

This library supports both MCL, a cluster algorithm for graphs, and zoem, a macro/DSL language. It supplies abstractions for memory management, I/O, associative arrays, strings, heaps, and a few other things. The string library has had heavy testing as part of zoem. Both understandably and regrettably I chose long ago to make it C-string-compatible, hence nul bytes may not be part of a string. At some point I hope to rectify this, perhaps unrealistically.

*homepage*: <https://github.com/micans/cimfomfa>

version | toolchain
--------|----------
``22.273`` | ``GCCcore/11.2.0``
``22.273`` | ``GCCcore/11.3.0``
``22.273`` | ``GCCcore/12.3.0``

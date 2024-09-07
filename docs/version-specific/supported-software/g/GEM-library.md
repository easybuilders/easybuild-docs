# GEM-library

Next-generation sequencing platforms (Illumina/Solexa, ABI/SOLiD, etc.)   call for powerful and very optimized tools to index/analyze huge genomes. The GEM library   strives to be a true "next-generation" tool for handling any kind of sequence data, offering   state-of-the-art algorithms and data structures specifically tailored to this demanding task.   At the moment, efficient indexing and searching algorithms based on the Burrows-Wheeler   transform (BWT) have been implemented. The library core is written in C for maximum speed,   with concise interfaces to higher-level programming languages like OCaml and Python.   Many high-performance standalone programs (mapper, splice mapper, etc.) are provided along   with the library; in general, new algorithms and tools can be easily implemented on the top of it.

*homepage*: <http://algorithms.cnag.cat/wiki/The_GEM_library>

version | versionsuffix | toolchain
--------|---------------|----------
``20130406-045632`` | ``_pre-release-3_Linux-x86_64`` | ``system``

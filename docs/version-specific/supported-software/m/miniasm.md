# miniasm

Miniasm is a very fast OLC-based de novo assembler for noisy long reads. It takes all-vs-all read self-mappings (typically by minimap) as input and outputs an assembly graph in the GFA format. Different from mainstream assemblers, miniasm does not have a consensus step. It simply concatenates pieces of read sequences to generate the final unitig sequences. Thus the per-base error rate is similar to the raw input reads.

*homepage*: <https://github.com/lh3/minimap2>

version | toolchain
--------|----------
``0.3-20191007`` | ``GCCcore/10.3.0``
``0.3-20191007`` | ``GCCcore/11.2.0``

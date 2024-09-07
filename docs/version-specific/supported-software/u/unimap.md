# unimap

Unimap is a fork of minimap2 optimized for assembly-to-reference alignment. It integrates the minigraph chaining algorithm and can align through long INDELs (up to 100kb by default) much faster than minimap2. Unimap is a better fit for resolving segmental duplications and is recommended over minimap2 for alignment between high-quality assemblies.  Unimap does not replace minimap2 for other types of alignment. It drops the support of multi-part index and short-read mapping. Its long-read alignment is different from minimap2 but is not necessarily better. Unimap is more of a specialized minimap2 at the moment.

*homepage*: <https://github.com/lh3/unimap>

version | toolchain
--------|----------
``0.1`` | ``GCCcore/10.2.0``
``0.1`` | ``GCCcore/11.3.0``

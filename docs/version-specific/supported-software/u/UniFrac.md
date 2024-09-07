# UniFrac

UniFrac is the de facto repository for high-performance phylogenetic diversity calculations. The methods in this repository are based on an implementation of the Strided State UniFrac algorithm which is faster, and uses less memory than Fast UniFrac. Strided State UniFrac supports Unweighted UniFrac, Weighted UniFrac, Generalized UniFrac, Variance Adjusted UniFrac and meta UniFrac, in both double and single precision (fp32). This repository also includes Stacked Faith (manuscript in preparation), a method for calculating Faith's PD that is faster and uses less memory than the Fast UniFrac-based reference implementation.

*homepage*: <https://github.com/biocore/unifrac-binaries>

version | toolchain
--------|----------
``1.3.2`` | ``foss/2022a``

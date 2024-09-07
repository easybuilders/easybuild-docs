# hipify-clang

Hipify-clang is a clang-based tool for translating CUDA   sources into HIP sources. It translates CUDA source into an abstract syntax   tree, which is traversed by transformation matchers. After applying all the   matchers, the output HIP source is produced.

*homepage*: <https://github.com/ROCm-Developer-Tools/HIPIFY>

version | toolchain
--------|----------
``4.2.0`` | ``gcccuda/2020b``

# retworkx

retworkx is a general purpose graph library for python3 written in Rust to take advantage of the performance and safety that Rust provides. It was built as a replacement for qiskit's previous (and current) networkx usage (hence the name) but is designed to provide a high performance general purpose graph library for any python application. The project was originally started to build a faster directed graph to use as the underlying data structure for the DAG at the center of qiskit-terra's transpiler, but it has since grown to cover all the graph usage in Qiskit and other applications.

*homepage*: <https://github.com/Qiskit/retworkx>

version | toolchain
--------|----------
``0.9.0`` | ``foss/2021a``

# MDI

The MolSSI Driver Interface (MDI) project provides a  standardized API for fast, on-the-fly communication between computational  chemistry codes. This greatly simplifies the process of implementing  methods that require the cooperation of multiple software packages and  enables developers to write a single implementation that works across  many different codes. The API is sufficiently general to support a wide  variety of techniques, including QM/MM, ab initio MD, machine learning,  advanced sampling, and path integral MD, while also being straightforwardly  extensible. Communication between codes is handled by the MDI Library, which  enables tight coupling between codes using either the MPI or TCP/IP methods.

*homepage*: <https://github.com/MolSSI-MDI/MDI_Library>

version | toolchain
--------|----------
``1.4.16`` | ``gompi/2022b``
``1.4.26`` | ``gompi/2023a``

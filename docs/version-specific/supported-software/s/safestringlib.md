# safestringlib

The Secure Development Lifecycle (SDL) recommends banning certain C Library functions because they directly contribute to security vulnerabilities such as buffer overflows. However routines for the manipulation of strings and memory buffers are common in software and firmware, and are essential to accomplish certain programming tasks. Safer replacements for these functions that avoid or prevent serious security vulnerabilities (e.g. buffer overflows, string format attacks, conversion overflows/underflows, etc.) are available in the SafeString Library.

*homepage*: <https://github.com/intel/safestringlib>

version | toolchain
--------|----------
``20240228`` | ``intel-compilers/2023.1.0``

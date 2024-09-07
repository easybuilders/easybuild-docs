# hdf5storage

This Python package provides high level utilities to read/write a variety of Python types to/from  HDF5 (Heirarchal Data Format) formatted files. This package also provides support for MATLAB MAT v7.3 formatted  files, which are just HDF5 files with a different extension and some extra meta-data. All of this is done without  pickling data. Pickling is bad for security because it allows arbitrary code to be executed in the interpreter.  One wants to be able to read possibly HDF5 and MAT files from untrusted sources, so pickling is avoided in this  package.

*homepage*: <https://pythonhosted.org/hdf5storage/>

version | toolchain
--------|----------
``0.1.15`` | ``foss/2019a``
``0.1.15`` | ``fosscuda/2019a``

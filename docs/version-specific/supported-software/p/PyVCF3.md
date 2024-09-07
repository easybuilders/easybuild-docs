# PyVCF3

A VCFv4.0 and 4.1 parser for Python. The intent of this module is to mimic the csv module in the Python stdlib, as opposed to more flexible serialization formats like JSON or YAML. vcf will attempt to parse the content of each record based on the data types specified in the meta-information lines -- specifically the ##INFO and ##FORMAT lines. If these lines are missing or incomplete, it will check against the reserved types mentioned in the spec. Failing that, it will just return strings. PyVCF3 has been created because the Official PyVCF repository is no longer maintained and do not accept any pull requests. This fork is for python 3 only and has been published on pyPI as PyVCF3.

*homepage*: <https://github.com/dridk/PyVCF3>

version | toolchain
--------|----------
``1.0.3`` | ``GCCcore/11.3.0``

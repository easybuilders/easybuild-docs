# QCA

Taking a hint from the similarly-named Java Cryptography Architecture,   QCA aims to provide a straightforward and cross-platform crypto API, using Qt datatypes   and conventions. QCA separates the API from the implementation, using plugins known as   Providers. The advantage of this model is to allow applications to avoid linking to or   explicitly depending on any particular cryptographic library. This allows one to easily   change or upgrade crypto implementations without even needing to recompile the   application! QCA should work everywhere Qt does, including Windows/Unix/MacOSX.

*homepage*: <https://github.com/KDE/qca>

version | toolchain
--------|----------
``2.1.0`` | ``foss/2016a``
``2.1.0`` | ``intel/2016b``
``2.1.3`` | ``GCCcore/8.2.0``
``2.1.3`` | ``foss/2016b``
``2.1.3`` | ``intel/2016b``
``2.3.5`` | ``GCCcore/11.2.0``

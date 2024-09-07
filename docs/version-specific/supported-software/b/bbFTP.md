# bbFTP

bbFTP is a file transfer software. It implements its own transfer protocol,   which is optimized for large files (larger than 2GB) and secure as it does not read the   password in a file and encrypts the connection information. bbFTP main features are:   * Encoded username and password at connection * SSH and Certificate authentication modules   * Multi-stream transfer * Big windows as defined in RFC1323 * On-the-fly data compression   * Automatic retry * Customizable time-outs * Transfer simulation   * AFS authentication integration * RFIO interface

*homepage*: <https://software.in2p3.fr/bbftp/>

version | toolchain
--------|----------
``3.2.1`` | ``GCCcore/9.3.0``
``3.2.1`` | ``intel/2016a``
``3.2.1`` | ``system``

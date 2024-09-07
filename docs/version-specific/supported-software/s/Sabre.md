# Sabre

Sabre is a tool that will demultiplex barcoded reads  into separate files. It will work on both single-end and paired-end  data in fastq format. It simply compares the provided barcodes with  each read and separates the read into its appropriate barcode file,  after stripping the barcode from the read (and also stripping  the quality values of the barcode bases).

*homepage*: <https://github.com/najoshi/sabre>

version | toolchain
--------|----------
``2013-09-28`` | ``GCC/12.2.0``

# segemehl

segemehl is a software to map short sequencer reads to reference genomes.   Unlike other methods, segemehl is able to detect not only mismatches but also insertions   and deletions. Furthermore, segemehl is not limited to a specific read length and is able   to mapprimer- or polyadenylation contaminated reads correctly. segemehl implements a matching   strategy based on enhanced suffix arrays (ESA). Segemehl now supports the SAM format, reads   gziped queries to save both disk and memory space and allows bisulfite sequencing mapping   and split read mapping.

*homepage*: <http://www.bioinf.uni-leipzig.de/Software/segemehl/>

version | toolchain
--------|----------
``0.2.0`` | ``foss/2016b``
``0.2.0`` | ``intel/2017b``
``0.2.0`` | ``intel/2018a``
``0.3.4`` | ``GCC/10.2.0``
``0.3.4`` | ``GCC/10.3.0``
``0.3.4`` | ``GCC/11.2.0``
``0.3.4`` | ``GCC/8.3.0``
``0.3.4`` | ``foss/2018b``
``0.3.4`` | ``iccifort/2020.4.304``

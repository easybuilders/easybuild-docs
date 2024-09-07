# mpiP

mpiP is a lightweight profiling library for MPI applications.  Because it  only collects statistical information about MPI functions, mpiP generates  considerably less overhead and much less data than tracing tools.  All the  information captured by mpiP is task-local. It only uses communication during  report generation, typically at the end of the experiment, to merge results  from all of the tasks into one output file.

*homepage*: <http://mpip.sourceforge.net/>

version | toolchain
--------|----------
``3.4.1`` | ``gompi/2019a``
``3.4.1`` | ``iimpi/2019a``
``3.4.1`` | ``iompi/2019.01``

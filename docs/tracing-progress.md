# Tracing progress {: #trace }

To trace the progress of SimpleBuild while it is installing software, you
can use `eb --trace`.

!!! note
    Tracing support was added as an experimental feature in SimpleBuild v3.4.0, and thus required
    using `--experimental`. Since SimpleBuild v3.4.1, `--trace` is
    considered stable and no longer requires the use of
    `--experimental`.

## Trace output {: #trace_output }

When `eb --trace` is used, SimpleBuild will print additional output on top
of the standard output, which only mentions which step of the
installation procedure is being executed (without any further details).

This output includes:

- location of build and install directories
- list of sources and patches
- modules being loaded
- executed commands
- results of the sanity check
- location of generated module file

For each (non-trivial) executed command, the location to a temporary log
file will be provided so the output of that command can be monitored
while it is running. In addition, the start time of the command is
printed, to allow determining how long the command has been running.

## Example {: #trace_example }

``` console
$ eb HDF5-1.10.1-intel-2017a.eb -df --trace --experimental
== temporary log file in case of crash /tmp/eb-ieEeg3/simplebuild-Ouw3jV.log
== processing SimpleBuild simpleconfig /home/example/HDF5/HDF5-1.10.1-intel-2017a.eb
== building and installing HDF5/1.10.1-intel-2017a...
  >> installation prefix: /prefix/software/HDF5/1.10.1-intel-2017a
== fetching files...
  >> sources:
  >> /prefix/sources/h/HDF5/hdf5-1.10.1.tar.gz [SHA256: 048a9d149fb99aaa1680a712963f5a78e9c43b588d0e79d55e06760ec377c172]
== creating build dir, resetting environment...
  >> build dir: /tmp/HDF5/1.10.1/intel-2017a
== unpacking...
  >> running command 'tar xzf /prefix/sources/h/HDF5/hdf5-1.10.1.tar.gz' (output in /tmp/eb-ieEeg3/simplebuild-run_cmd-P9kf6c.log) [started at: 2017-09-06 08:28:42]
== patching...
== preparing...
  >> loading toolchain module: intel/2017a
  >> (no build dependencies specified)
  >> loading modules for (runtime) dependencies:
  >>  * zlib/1.2.11-GCCcore-6.3.0
  >>  * Szip/2.1-intel-2017a
  >> defining build environment for intel/2017a toolchain
== configuring...
  >> running command './configure --prefix=/prefix/software/HDF5/1.10.1-intel-2017a  --with-szlib=/prefix/software/Szip/2.1-intel-2017a  --with-zlib=/prefix/software/zlib/1.2.11-GCCcore-6.3.0  --with-pic --with-pthread --enable-shared  --enable-cxx --enable-fortran FC="mpiifort"  --enable-unsupported --enable-parallel' (output in /tmp/eb-ieEeg3/simplebuild-run_cmd-dPat3D.log) [started at: 2017-09-06 08:28:44]
== building...
  >> running command 'make -j 24  CXXFLAGS="$CXXFLAGS -DMPICH_IGNORE_CXX_SEEK"  FC="mpiifort"' (output in /tmp/eb-ieEeg3/simplebuild-run_cmd-25vKdK.log) [started at: 2017-09-06 08:31:01]
== testing...
== installing...
  >> running command 'make install' (output in /tmp/eb-ieEeg3/simplebuild-run_cmd-BepE8P.log) [started at: 2017-09-06 08:34:09]
== taking care of extensions...
== postprocessing...
== sanity checking...
  >> file 'bin/h52gif' found: OK
  >> file 'bin/h5c++' found: OK
  >> file 'bin/h5copy' found: OK
  >> file 'bin/h5debug' found: OK
  >> file 'bin/h5diff' found: OK
  >> file 'bin/h5dump' found: OK
  >> file 'bin/h5import' found: OK
  >> file 'bin/h5jam' found: OK
  >> file 'bin/h5ls' found: OK
  >> file 'bin/h5mkgrp' found: OK
  >> file 'bin/h5perf_serial' found: OK
  >> file 'bin/h5redeploy' found: OK
  >> file 'bin/h5repack' found: OK
  >> file 'bin/h5repart' found: OK
  >> file 'bin/h5stat' found: OK
  >> file 'bin/h5unjam' found: OK
  >> file 'bin/gif2h5' found: OK
  >> file 'bin/h5perf' found: OK
  >> file 'bin/h5pcc' found: OK
  >> file 'bin/h5pfc' found: OK
  >> file 'bin/ph5diff' found: OK
  >> file 'lib/libhdf5.so' found: OK
  >> file 'lib/libhdf5_cpp.so' found: OK
  >> file 'lib/libhdf5_fortran.so' found: OK
  >> file 'lib/libhdf5_hl_cpp.so' found: OK
  >> file 'lib/libhdf5_hl.so' found: OK
  >> file 'lib/libhdf5hl_fortran.so' found: OK
  >> (non-empty) directory 'include' found: OK
== cleaning up...
== creating module...
  >> generating module file @ /prefix/modules/all/HDF5/1.10.1-intel-2017a.lua
== permissions...
== packaging...
== COMPLETED: Installation ended successfully
== Results of the build can be found in the log file(s) /prefix/software/HDF5/1.10.1-intel-2017a/simplebuild/simplebuild-HDF5-1.10.1-20170906.083425.log
== Build succeeded for 1 out of 1
== Temporary log file(s) /tmp/eb-ieEeg3/simplebuild-Ouw3jV.log* have been removed.
== Temporary directory /tmp/eb-ieEeg3 has been removed.
```

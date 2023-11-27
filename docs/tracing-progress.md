# Tracing progress

To trace the progress of EasyBuild while it is installing software, you
can use `eb --trace`.

## Trace output {: #trace_output }

When `eb --trace` is used, EasyBuild will print additional output on top
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
$ eb HPL-2.3-foss-2023a.eb --trace --force
== Temporary log file in case of crash /tmp/eb-od8biuwd/easybuild-v4oniskt.log
== processing EasyBuild easyconfig /home/example/easybuild-easyconfigs/easybuild/easyconfigs/h/HPL/HPL-2.3-foss-2023a.eb
== building and installing HPL/2.3-foss-2023a...
  >> installation prefix: /software/HPL/2.3-foss-2023a
== fetching files...
  >> sources:
  >> /home/example/sources/h/HPL/hpl-2.3.tar.gz [SHA256: 32c5c17d22330e6f2337b681aded51637fb6008d3f0eb7c277b163fadd612830]
  >> patches:
  >> /home/example/easybuild-easyconfigs/easybuild/easyconfigs/h/HPL/HPL_parallel-make.patch [SHA256:
2a5bf9c4f328049828ddecec7ba3f05a9e25d236f4212747c53bd22fea80c5e6]
== ... (took < 1 sec)
== creating build dir, resetting environment...
  >> build dir: /tmp/easybuild_build/HPL/2.3/foss-2023a
== ... (took < 1 sec)
== unpacking...
  >> running command:
        [started at: 2023-10-11 09:41:33]
        [working dir: /tmp/easybuild_build/HPL/2.3/foss-2023a]
        [output logged in /tmp/eb-od8biuwd/easybuild-run_cmd-lzkft2en.log]
        tar xzf /home/example/sources/h/HPL/hpl-2.3.tar.gz
  >> command completed: exit 0, ran in < 1s
== ... (took < 1 sec)
== patching...
  >> applying patch HPL_parallel-make.patch
== ... (took < 1 sec)
== preparing...
  >> loading toolchain module: foss/2023a
  >> defining build environment for foss/2023a toolchain
== Running post-prepare hook...
== ... (took 7 secs)
== configuring...
== Running pre-configure hook...
  >> running command:
        [started at: 2023-10-11 09:41:41]
        [working dir: /tmp/easybuild_build/HPL/2.3/foss-2023a/hpl-2.3/setup]
        [output logged in /tmp/eb-od8biuwd/easybuild-run_cmd-ngu5ym7y.log]
        /bin/bash make_generic
  >> command completed: exit 0, ran in < 1s
== ... (took < 1 sec)
== building...
  >> running command:
        [started at: 2023-10-11 09:41:41]
        [working dir: /tmp/easybuild_build/HPL/2.3/foss-2023a/hpl-2.3]
        [output logged in /tmp/eb-od8biuwd/easybuild-run_cmd-81p_xm51.log]
        make  -j 8  TOPdir="/tmp/easybuild_build/HPL/2.3/foss-2023a/hpl-2.3/" CC="mpicc" MPICC="mpicc" LINKER="mpicc" LAlib="-lflexiblas -lgfortran"
HPL_OPTS="-I/software/FFTW.MPI/3.3.10-gompi-2023a/include -I/software/FlexiBLAS/3.3.1-GCC-12.3.0/include
-I/software/FlexiBLAS/3.3.1-GCC-12.3.0/include/flexiblas " LINKFLAGS="-O2 -ftree-vectorize -march=native -fno-math-errno
-L/software/FFTW.MPI/3.3.10-gompi-2023a/lib64 -L/software/FFTW.MPI/3.3.10-gompi-2023a/lib -L/software/ScaLAPACK/2.2.0-gompi-2023a-fb/lib64
-L/software/ScaLAPACK/2.2.0-gompi-2023a-fb/lib -L/software/FlexiBLAS/3.3.1-GCC-12.3.0/lib64
-L/software/FlexiBLAS/3.3.1-GCC-12.3.0/lib -L/software/GCCcore/12.3.0/lib64 -L/software/GCCcore/12.3.0/lib
-lm -lpthread" CCFLAGS='$(HPL_DEFS) -O2 -ftree-vectorize -march=native -fno-math-errno'
  >> command completed: exit 0, ran in 00h00m08s
== ... (took 8 secs)
== testing...
== ... (took < 1 sec)
== installing...
== ... (took < 1 sec)
== taking care of extensions...
== Running pre-extensions hook...
== ... (took < 1 sec)
== restore after iterating...
== ... (took < 1 sec)
== postprocessing...
== ... (took < 1 sec)
== sanity checking...
== Running pre-sanitycheck hook...
  >> file 'bin/xhpl' found: OK
  >> loading modules: HPL/2.3-foss-2023a...
== ... (took 9 secs)
== cleaning up...
== ... (took < 1 sec)
== creating module...
  >> generating module file @ /home/example/modules/all/HPL/2.3-foss-2023a.lua
== ... (took 7 secs)
== permissions...
== ... (took < 1 sec)
== packaging...
== ... (took < 1 sec)
== COMPLETED: Installation ended successfully (took 34 secs)
== Results of the build can be found in the log file(s) /home/example/software/HPL/2.3-foss-2023a/easybuild/easybuild-HPL-2.3-20231011.094207.log

== Build succeeded for 1 out of 1
== Temporary log file(s) /tmp/eb-od8biuwd/easybuild-v4oniskt.log* have been removed.
== Temporary directory /tmp/eb-od8biuwd has been removed.
```

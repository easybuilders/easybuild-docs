# Available toolchain options (by toolchain) {: #avail_toolchain_opts }

*(see also* ``eb --avail-toolchain-opts <tcname>`` *)*

<a href='#ClangGCC'>ClangGCC</a> - <a href='#CrayCCE'>CrayCCE</a> - <a href='#CrayGNU'>CrayGNU</a> - <a href='#CrayIntel'>CrayIntel</a> - <a href='#CrayPGI'>CrayPGI</a> - <a href='#FCC'>FCC</a> - <a href='#Fujitsu'>Fujitsu</a> - <a href='#GCC'>GCC</a> - <a href='#GCCcore'>GCCcore</a> - <a href='#GNU'>GNU</a> - <a href='#NVHPC'>NVHPC</a> - <a href='#PGI'>PGI</a> - <a href='#cgmpich'>cgmpich</a> - <a href='#cgmpolf'>cgmpolf</a> - <a href='#cgmvapich2'>cgmvapich2</a> - <a href='#cgmvolf'>cgmvolf</a> - <a href='#cgompi'>cgompi</a> - <a href='#cgoolf'>cgoolf</a> - <a href='#ffmpi'>ffmpi</a> - <a href='#foss'>foss</a> - <a href='#fosscuda'>fosscuda</a> - <a href='#gcccuda'>gcccuda</a> - <a href='#gfbf'>gfbf</a> - <a href='#gimkl'>gimkl</a> - <a href='#gimpi'>gimpi</a> - <a href='#gimpic'>gimpic</a> - <a href='#giolf'>giolf</a> - <a href='#giolfc'>giolfc</a> - <a href='#gmacml'>gmacml</a> - <a href='#gmkl'>gmkl</a> - <a href='#gmklc'>gmklc</a> - <a href='#gmpich2'>gmpich2</a> - <a href='#gmpich'>gmpich</a> - <a href='#gmpit'>gmpit</a> - <a href='#gmpolf'>gmpolf</a> - <a href='#gmvapich2'>gmvapich2</a> - <a href='#gmvolf'>gmvolf</a> - <a href='#goalf'>goalf</a> - <a href='#gobff'>gobff</a> - <a href='#goblf'>goblf</a> - <a href='#gofbf'>gofbf</a> - <a href='#golf'>golf</a> - <a href='#golfc'>golfc</a> - <a href='#gomkl'>gomkl</a> - <a href='#gomklc'>gomklc</a> - <a href='#gompi'>gompi</a> - <a href='#gompic'>gompic</a> - <a href='#goolf'>goolf</a> - <a href='#goolfc'>goolfc</a> - <a href='#gpsmpi'>gpsmpi</a> - <a href='#gpsolf'>gpsolf</a> - <a href='#gqacml'>gqacml</a> - <a href='#gsmpi'>gsmpi</a> - <a href='#gsolf'>gsolf</a> - <a href='#iccifort'>iccifort</a> - <a href='#iccifortcuda'>iccifortcuda</a> - <a href='#ictce'>ictce</a> - <a href='#iibff'>iibff</a> - <a href='#iimkl'>iimkl</a> - <a href='#iimklc'>iimklc</a> - <a href='#iimpi'>iimpi</a> - <a href='#iimpic'>iimpic</a> - <a href='#iiqmpi'>iiqmpi</a> - <a href='#impich'>impich</a> - <a href='#impmkl'>impmkl</a> - <a href='#intel-compilers'>intel-compilers</a> - <a href='#intel-para'>intel-para</a> - <a href='#intel'>intel</a> - <a href='#intelcuda'>intelcuda</a> - <a href='#iomkl'>iomkl</a> - <a href='#iomklc'>iomklc</a> - <a href='#iompi'>iompi</a> - <a href='#iompic'>iompic</a> - <a href='#ipsmpi'>ipsmpi</a> - <a href='#iqacml'>iqacml</a> - <a href='#ismkl'>ismkl</a> - <a href='#nvompi'>nvompi</a> - <a href='#nvompic'>nvompic</a> - <a href='#nvpsmpi'>nvpsmpi</a> - <a href='#nvpsmpic'>nvpsmpic</a> - <a href='#pmkl'>pmkl</a> - <a href='#pomkl'>pomkl</a> - <a href='#pompi'>pompi</a> - <a href='#system'>system</a> - <a href='#xlcxlf'>xlcxlf</a> - <a href='#xlmpich2'>xlmpich2</a> - <a href='#xlmpich'>xlmpich</a> - <a href='#xlmvapich2'>xlmvapich2</a> - <a href='#xlompi'>xlompi</a>

## ClangGCC

### Available options for ClangGCC toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``basic-block-vectorize``|Basic block vectorization                                              |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop-vectorize``       |Loop vectorization                                                     |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## CrayCCE

### Available options for CrayCCE toolchain

option                   |description                                                                                                                                                                                                                                                    |default
-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                                                                                                                                                                                                           |``False``
``cciscxx``              |Use CC as CXX                                                                                                                                                                                                                                                  |``False``
``cstd``                 |Specify C standard                                                                                                                                                                                                                                             |``None``
``debug``                |Enable debug                                                                                                                                                                                                                                                   |``False``
``defaultopt``           |Default compiler optimizations                                                                                                                                                                                                                                 |``False``
``defaultprec``          |Default precision                                                                                                                                                                                                                                              |``False``
``dynamic``              |Generate dynamically linked executable                                                                                                                                                                                                                         |``True``
``extra_cflags``         |Specify extra CFLAGS options.                                                                                                                                                                                                                                  |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                                                                                                                                                                                                                |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                                                                                                                                                                                                                |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                                                                                                                                                                                                                 |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                                                                                                                                                                                                                  |``None``
``i8``                   |Integers are 8 byte integers                                                                                                                                                                                                                                   |``False``
``ieee``                 |Adhere to IEEE-754 rules                                                                                                                                                                                                                                       |``False``
``loose``                |Loose precision                                                                                                                                                                                                                                                |``False``
``lowopt``               |Low compiler optimizations                                                                                                                                                                                                                                     |``False``
``mpich-mt``             |Directs the driver to link in an alternate version of the Cray-MPICH library which                              provides fine-grained multi-threading support to applications that perform                              MPI operations within threaded regions.|``False``
``noopt``                |Disable compiler optimizations                                                                                                                                                                                                                                 |``False``
``openmp``               |Enable OpenMP                                                                                                                                                                                                                                                  |``False``
``opt``                  |High compiler optimizations                                                                                                                                                                                                                                    |``False``
``optarch``              |Enable architecture optimizations                                                                                                                                                                                                                              |``False``
``packed-linker-options``|Pack the linker options as comma separated list                                                                                                                                                                                                                |``False``
``pic``                  |Use PIC                                                                                                                                                                                                                                                        |``False``
``precise``              |High precision                                                                                                                                                                                                                                                 |``False``
``r8``                   |Real is 8 byte real                                                                                                                                                                                                                                            |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration                                                                                                                                                                                          |``True``
``shared``               |Build shared library                                                                                                                                                                                                                                           |``False``
``static``               |Build static library                                                                                                                                                                                                                                           |``False``
``strict``               |Strict (highest) precision                                                                                                                                                                                                                                     |``False``
``unroll``               |Unroll loops                                                                                                                                                                                                                                                   |``False``
``usempi``               |Use MPI compiler as default compiler                                                                                                                                                                                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt                                                                                                                                                                                        |``None``
``verbose``              |Verbose output                                                                                                                                                                                                                                                 |``True``
``veryloose``            |Very loose precision                                                                                                                                                                                                                                           |``False``

## CrayGNU

### Available options for CrayGNU toolchain

option                   |description                                                                                                                                                                                                                                                    |default
-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                                                                                                                                                                                                           |``False``
``cciscxx``              |Use CC as CXX                                                                                                                                                                                                                                                  |``False``
``cstd``                 |Specify C standard                                                                                                                                                                                                                                             |``None``
``debug``                |Enable debug                                                                                                                                                                                                                                                   |``False``
``defaultopt``           |Default compiler optimizations                                                                                                                                                                                                                                 |``False``
``defaultprec``          |Default precision                                                                                                                                                                                                                                              |``False``
``dynamic``              |Generate dynamically linked executable                                                                                                                                                                                                                         |``True``
``extra_cflags``         |Specify extra CFLAGS options.                                                                                                                                                                                                                                  |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                                                                                                                                                                                                                |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                                                                                                                                                                                                                |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                                                                                                                                                                                                                 |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                                                                                                                                                                                                                  |``None``
``i8``                   |Integers are 8 byte integers                                                                                                                                                                                                                                   |``False``
``ieee``                 |Adhere to IEEE-754 rules                                                                                                                                                                                                                                       |``False``
``loose``                |Loose precision                                                                                                                                                                                                                                                |``False``
``lowopt``               |Low compiler optimizations                                                                                                                                                                                                                                     |``False``
``mpich-mt``             |Directs the driver to link in an alternate version of the Cray-MPICH library which                              provides fine-grained multi-threading support to applications that perform                              MPI operations within threaded regions.|``False``
``noopt``                |Disable compiler optimizations                                                                                                                                                                                                                                 |``False``
``openmp``               |Enable OpenMP                                                                                                                                                                                                                                                  |``False``
``opt``                  |High compiler optimizations                                                                                                                                                                                                                                    |``False``
``optarch``              |Enable architecture optimizations                                                                                                                                                                                                                              |``False``
``packed-linker-options``|Pack the linker options as comma separated list                                                                                                                                                                                                                |``False``
``pic``                  |Use PIC                                                                                                                                                                                                                                                        |``False``
``precise``              |High precision                                                                                                                                                                                                                                                 |``False``
``r8``                   |Real is 8 byte real                                                                                                                                                                                                                                            |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration                                                                                                                                                                                          |``True``
``shared``               |Build shared library                                                                                                                                                                                                                                           |``False``
``static``               |Build static library                                                                                                                                                                                                                                           |``False``
``strict``               |Strict (highest) precision                                                                                                                                                                                                                                     |``False``
``unroll``               |Unroll loops                                                                                                                                                                                                                                                   |``False``
``usempi``               |Use MPI compiler as default compiler                                                                                                                                                                                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt                                                                                                                                                                                        |``None``
``verbose``              |Verbose output                                                                                                                                                                                                                                                 |``True``
``veryloose``            |Very loose precision                                                                                                                                                                                                                                           |``False``

## CrayIntel

### Available options for CrayIntel toolchain

option                   |description                                                                                                                                                                                                                                                    |default
-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                                                                                                                                                                                                           |``False``
``cciscxx``              |Use CC as CXX                                                                                                                                                                                                                                                  |``False``
``cstd``                 |Specify C standard                                                                                                                                                                                                                                             |``None``
``debug``                |Enable debug                                                                                                                                                                                                                                                   |``False``
``defaultopt``           |Default compiler optimizations                                                                                                                                                                                                                                 |``False``
``defaultprec``          |Default precision                                                                                                                                                                                                                                              |``False``
``dynamic``              |Generate dynamically linked executable                                                                                                                                                                                                                         |``True``
``extra_cflags``         |Specify extra CFLAGS options.                                                                                                                                                                                                                                  |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                                                                                                                                                                                                                |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                                                                                                                                                                                                                |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                                                                                                                                                                                                                 |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                                                                                                                                                                                                                  |``None``
``i8``                   |Integers are 8 byte integers                                                                                                                                                                                                                                   |``False``
``ieee``                 |Adhere to IEEE-754 rules                                                                                                                                                                                                                                       |``False``
``loose``                |Loose precision                                                                                                                                                                                                                                                |``False``
``lowopt``               |Low compiler optimizations                                                                                                                                                                                                                                     |``False``
``mpich-mt``             |Directs the driver to link in an alternate version of the Cray-MPICH library which                              provides fine-grained multi-threading support to applications that perform                              MPI operations within threaded regions.|``False``
``noopt``                |Disable compiler optimizations                                                                                                                                                                                                                                 |``False``
``openmp``               |Enable OpenMP                                                                                                                                                                                                                                                  |``False``
``opt``                  |High compiler optimizations                                                                                                                                                                                                                                    |``False``
``optarch``              |Enable architecture optimizations                                                                                                                                                                                                                              |``False``
``packed-linker-options``|Pack the linker options as comma separated list                                                                                                                                                                                                                |``False``
``pic``                  |Use PIC                                                                                                                                                                                                                                                        |``False``
``precise``              |High precision                                                                                                                                                                                                                                                 |``False``
``r8``                   |Real is 8 byte real                                                                                                                                                                                                                                            |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration                                                                                                                                                                                          |``True``
``shared``               |Build shared library                                                                                                                                                                                                                                           |``False``
``static``               |Build static library                                                                                                                                                                                                                                           |``False``
``strict``               |Strict (highest) precision                                                                                                                                                                                                                                     |``False``
``unroll``               |Unroll loops                                                                                                                                                                                                                                                   |``False``
``usempi``               |Use MPI compiler as default compiler                                                                                                                                                                                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt                                                                                                                                                                                        |``None``
``verbose``              |Verbose output                                                                                                                                                                                                                                                 |``True``
``veryloose``            |Very loose precision                                                                                                                                                                                                                                           |``False``

## CrayPGI

### Available options for CrayPGI toolchain

option                   |description                                                                                                                                                                                                                                                    |default
-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                                                                                                                                                                                                           |``False``
``cciscxx``              |Use CC as CXX                                                                                                                                                                                                                                                  |``False``
``cstd``                 |Specify C standard                                                                                                                                                                                                                                             |``None``
``debug``                |Enable debug                                                                                                                                                                                                                                                   |``False``
``defaultopt``           |Default compiler optimizations                                                                                                                                                                                                                                 |``False``
``defaultprec``          |Default precision                                                                                                                                                                                                                                              |``False``
``dynamic``              |Generate dynamically linked executable                                                                                                                                                                                                                         |``True``
``extra_cflags``         |Specify extra CFLAGS options.                                                                                                                                                                                                                                  |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                                                                                                                                                                                                                |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                                                                                                                                                                                                                |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                                                                                                                                                                                                                 |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                                                                                                                                                                                                                  |``None``
``i8``                   |Integers are 8 byte integers                                                                                                                                                                                                                                   |``False``
``ieee``                 |Adhere to IEEE-754 rules                                                                                                                                                                                                                                       |``False``
``loose``                |Loose precision                                                                                                                                                                                                                                                |``False``
``lowopt``               |Low compiler optimizations                                                                                                                                                                                                                                     |``False``
``mpich-mt``             |Directs the driver to link in an alternate version of the Cray-MPICH library which                              provides fine-grained multi-threading support to applications that perform                              MPI operations within threaded regions.|``False``
``noopt``                |Disable compiler optimizations                                                                                                                                                                                                                                 |``False``
``openmp``               |Enable OpenMP                                                                                                                                                                                                                                                  |``False``
``opt``                  |High compiler optimizations                                                                                                                                                                                                                                    |``False``
``optarch``              |Enable architecture optimizations                                                                                                                                                                                                                              |``False``
``packed-linker-options``|Pack the linker options as comma separated list                                                                                                                                                                                                                |``False``
``pic``                  |Use PIC                                                                                                                                                                                                                                                        |``False``
``precise``              |High precision                                                                                                                                                                                                                                                 |``False``
``r8``                   |Real is 8 byte real                                                                                                                                                                                                                                            |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration                                                                                                                                                                                          |``True``
``shared``               |Build shared library                                                                                                                                                                                                                                           |``False``
``static``               |Build static library                                                                                                                                                                                                                                           |``False``
``strict``               |Strict (highest) precision                                                                                                                                                                                                                                     |``False``
``unroll``               |Unroll loops                                                                                                                                                                                                                                                   |``False``
``usempi``               |Use MPI compiler as default compiler                                                                                                                                                                                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt                                                                                                                                                                                        |``None``
``verbose``              |Verbose output                                                                                                                                                                                                                                                 |``True``
``veryloose``            |Very loose precision                                                                                                                                                                                                                                           |``False``

## FCC

### Available options for FCC toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## Fujitsu

### Available options for Fujitsu toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## GCC

### Available options for GCC toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## GCCcore

### Available options for GCCcore toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## GNU

### Available options for GNU toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## NVHPC

### Available options for NVHPC toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## PGI

### Available options for PGI toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## cgmpich

### Available options for cgmpich toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``basic-block-vectorize``|Basic block vectorization                                              |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop-vectorize``       |Loop vectorization                                                     |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## cgmpolf

### Available options for cgmpolf toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``basic-block-vectorize``|Basic block vectorization                                              |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop-vectorize``       |Loop vectorization                                                     |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## cgmvapich2

### Available options for cgmvapich2 toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``basic-block-vectorize``|Basic block vectorization                                              |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop-vectorize``       |Loop vectorization                                                     |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## cgmvolf

### Available options for cgmvolf toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``basic-block-vectorize``|Basic block vectorization                                              |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop-vectorize``       |Loop vectorization                                                     |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## cgompi

### Available options for cgompi toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``basic-block-vectorize``|Basic block vectorization                                              |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop-vectorize``       |Loop vectorization                                                     |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## cgoolf

### Available options for cgoolf toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``basic-block-vectorize``|Basic block vectorization                                              |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop-vectorize``       |Loop vectorization                                                     |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## ffmpi

### Available options for ffmpi toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## foss

### Available options for foss toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## fosscuda

### Available options for fosscuda toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gcccuda

### Available options for gcccuda toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gfbf

### Available options for gfbf toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gimkl

### Available options for gimkl toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gimpi

### Available options for gimpi toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gimpic

### Available options for gimpic toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## giolf

### Available options for giolf toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## giolfc

### Available options for giolfc toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gmacml

### Available options for gmacml toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gmkl

### Available options for gmkl toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gmklc

### Available options for gmklc toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gmpich2

### Available options for gmpich2 toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gmpich

### Available options for gmpich toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gmpit

### Available options for gmpit toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gmpolf

### Available options for gmpolf toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gmvapich2

### Available options for gmvapich2 toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gmvolf

### Available options for gmvolf toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## goalf

### Available options for goalf toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gobff

### Available options for gobff toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## goblf

### Available options for goblf toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gofbf

### Available options for gofbf toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## golf

### Available options for golf toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## golfc

### Available options for golfc toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gomkl

### Available options for gomkl toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gomklc

### Available options for gomklc toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gompi

### Available options for gompi toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gompic

### Available options for gompic toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## goolf

### Available options for goolf toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## goolfc

### Available options for goolfc toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gpsmpi

### Available options for gpsmpi toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gpsolf

### Available options for gpsolf toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gqacml

### Available options for gqacml toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gsmpi

### Available options for gsmpi toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## gsolf

### Available options for gsolf toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``f2c``                  |Generate code compatible with f2c and f77                              |``False``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loop``                 |Automatic loop parallellisation                                        |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``lto``                  |Enable Link Time Optimization                                          |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## iccifort

### Available options for iccifort toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``error-unknown-option`` |Error instead of warning for unknown options                           |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``intel-static``         |Link Intel provided libraries statically                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``no-icc``               |Don't set Intel specific macros                                        |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## iccifortcuda

### Available options for iccifortcuda toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``error-unknown-option`` |Error instead of warning for unknown options                           |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``intel-static``         |Link Intel provided libraries statically                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``no-icc``               |Don't set Intel specific macros                                        |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## ictce

### Available options for ictce toolchain

option                   |description                                                                                                                               |default
-------------------------|------------------------------------------------------------------------------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                                                                                      |``False``
``cciscxx``              |Use CC as CXX                                                                                                                             |``False``
``cstd``                 |Specify C standard                                                                                                                        |``None``
``debug``                |Enable debug                                                                                                                              |``False``
``defaultopt``           |Default compiler optimizations                                                                                                            |``False``
``defaultprec``          |Default precision                                                                                                                         |``False``
``error-unknown-option`` |Error instead of warning for unknown options                                                                                              |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                                                                                             |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                                                                                           |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                                                                                           |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                                                                                            |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                                                                                             |``None``
``i8``                   |Integers are 8 byte integers                                                                                                              |``False``
``ieee``                 |Adhere to IEEE-754 rules                                                                                                                  |``False``
``intel-static``         |Link Intel provided libraries statically                                                                                                  |``False``
``loose``                |Loose precision                                                                                                                           |``False``
``lowopt``               |Low compiler optimizations                                                                                                                |``False``
``no-icc``               |Don't set Intel specific macros                                                                                                           |``False``
``noopt``                |Disable compiler optimizations                                                                                                            |``False``
``oneapi``               |Use oneAPI compilers icx/icpx/ifx instead of classic compilers                                                                            |``None``
``oneapi_c_cxx``         |Use oneAPI C/C++ compilers icx/icpx instead of classic Intel C/C++ compilers (auto-enabled for Intel compilers version 2022.2.0, or newer)|``None``
``oneapi_fortran``       |Use oneAPI Fortran compiler ifx instead of classic Intel Fortran compiler                                                                 |``False``
``openmp``               |Enable OpenMP                                                                                                                             |``False``
``opt``                  |High compiler optimizations                                                                                                               |``False``
``optarch``              |Enable architecture optimizations                                                                                                         |``True``
``packed-linker-options``|Pack the linker options as comma separated list                                                                                           |``False``
``pic``                  |Use PIC                                                                                                                                   |``False``
``precise``              |High precision                                                                                                                            |``False``
``r8``                   |Real is 8 byte real                                                                                                                       |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration                                                                     |``True``
``shared``               |Build shared library                                                                                                                      |``False``
``static``               |Build static library                                                                                                                      |``False``
``strict``               |Strict (highest) precision                                                                                                                |``False``
``unroll``               |Unroll loops                                                                                                                              |``False``
``usempi``               |Use MPI compiler as default compiler                                                                                                      |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt                                                                   |``None``
``verbose``              |Verbose output                                                                                                                            |``False``
``veryloose``            |Very loose precision                                                                                                                      |``False``

## iibff

### Available options for iibff toolchain

option                   |description                                                                                                                               |default
-------------------------|------------------------------------------------------------------------------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                                                                                      |``False``
``cciscxx``              |Use CC as CXX                                                                                                                             |``False``
``cstd``                 |Specify C standard                                                                                                                        |``None``
``debug``                |Enable debug                                                                                                                              |``False``
``defaultopt``           |Default compiler optimizations                                                                                                            |``False``
``defaultprec``          |Default precision                                                                                                                         |``False``
``error-unknown-option`` |Error instead of warning for unknown options                                                                                              |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                                                                                             |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                                                                                           |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                                                                                           |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                                                                                            |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                                                                                             |``None``
``i8``                   |Integers are 8 byte integers                                                                                                              |``False``
``ieee``                 |Adhere to IEEE-754 rules                                                                                                                  |``False``
``intel-static``         |Link Intel provided libraries statically                                                                                                  |``False``
``loose``                |Loose precision                                                                                                                           |``False``
``lowopt``               |Low compiler optimizations                                                                                                                |``False``
``no-icc``               |Don't set Intel specific macros                                                                                                           |``False``
``noopt``                |Disable compiler optimizations                                                                                                            |``False``
``oneapi``               |Use oneAPI compilers icx/icpx/ifx instead of classic compilers                                                                            |``None``
``oneapi_c_cxx``         |Use oneAPI C/C++ compilers icx/icpx instead of classic Intel C/C++ compilers (auto-enabled for Intel compilers version 2022.2.0, or newer)|``None``
``oneapi_fortran``       |Use oneAPI Fortran compiler ifx instead of classic Intel Fortran compiler                                                                 |``False``
``openmp``               |Enable OpenMP                                                                                                                             |``False``
``opt``                  |High compiler optimizations                                                                                                               |``False``
``optarch``              |Enable architecture optimizations                                                                                                         |``True``
``packed-linker-options``|Pack the linker options as comma separated list                                                                                           |``False``
``pic``                  |Use PIC                                                                                                                                   |``False``
``precise``              |High precision                                                                                                                            |``False``
``r8``                   |Real is 8 byte real                                                                                                                       |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration                                                                     |``True``
``shared``               |Build shared library                                                                                                                      |``False``
``static``               |Build static library                                                                                                                      |``False``
``strict``               |Strict (highest) precision                                                                                                                |``False``
``unroll``               |Unroll loops                                                                                                                              |``False``
``usempi``               |Use MPI compiler as default compiler                                                                                                      |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt                                                                   |``None``
``verbose``              |Verbose output                                                                                                                            |``False``
``veryloose``            |Very loose precision                                                                                                                      |``False``

## iimkl

### Available options for iimkl toolchain

option                   |description                                                                                                                               |default
-------------------------|------------------------------------------------------------------------------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                                                                                      |``False``
``cciscxx``              |Use CC as CXX                                                                                                                             |``False``
``cstd``                 |Specify C standard                                                                                                                        |``None``
``debug``                |Enable debug                                                                                                                              |``False``
``defaultopt``           |Default compiler optimizations                                                                                                            |``False``
``defaultprec``          |Default precision                                                                                                                         |``False``
``error-unknown-option`` |Error instead of warning for unknown options                                                                                              |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                                                                                             |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                                                                                           |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                                                                                           |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                                                                                            |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                                                                                             |``None``
``i8``                   |Integers are 8 byte integers                                                                                                              |``False``
``ieee``                 |Adhere to IEEE-754 rules                                                                                                                  |``False``
``intel-static``         |Link Intel provided libraries statically                                                                                                  |``False``
``loose``                |Loose precision                                                                                                                           |``False``
``lowopt``               |Low compiler optimizations                                                                                                                |``False``
``no-icc``               |Don't set Intel specific macros                                                                                                           |``False``
``noopt``                |Disable compiler optimizations                                                                                                            |``False``
``oneapi``               |Use oneAPI compilers icx/icpx/ifx instead of classic compilers                                                                            |``None``
``oneapi_c_cxx``         |Use oneAPI C/C++ compilers icx/icpx instead of classic Intel C/C++ compilers (auto-enabled for Intel compilers version 2022.2.0, or newer)|``None``
``oneapi_fortran``       |Use oneAPI Fortran compiler ifx instead of classic Intel Fortran compiler                                                                 |``False``
``openmp``               |Enable OpenMP                                                                                                                             |``False``
``opt``                  |High compiler optimizations                                                                                                               |``False``
``optarch``              |Enable architecture optimizations                                                                                                         |``True``
``packed-linker-options``|Pack the linker options as comma separated list                                                                                           |``False``
``pic``                  |Use PIC                                                                                                                                   |``False``
``precise``              |High precision                                                                                                                            |``False``
``r8``                   |Real is 8 byte real                                                                                                                       |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration                                                                     |``True``
``shared``               |Build shared library                                                                                                                      |``False``
``static``               |Build static library                                                                                                                      |``False``
``strict``               |Strict (highest) precision                                                                                                                |``False``
``unroll``               |Unroll loops                                                                                                                              |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt                                                                   |``None``
``verbose``              |Verbose output                                                                                                                            |``False``
``veryloose``            |Very loose precision                                                                                                                      |``False``

## iimklc

### Available options for iimklc toolchain

option                   |description                                                                                                                               |default
-------------------------|------------------------------------------------------------------------------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                                                                                      |``False``
``cciscxx``              |Use CC as CXX                                                                                                                             |``False``
``cstd``                 |Specify C standard                                                                                                                        |``None``
``debug``                |Enable debug                                                                                                                              |``False``
``defaultopt``           |Default compiler optimizations                                                                                                            |``False``
``defaultprec``          |Default precision                                                                                                                         |``False``
``error-unknown-option`` |Error instead of warning for unknown options                                                                                              |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                                                                                             |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                                                                                           |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                                                                                           |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                                                                                            |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                                                                                             |``None``
``i8``                   |Integers are 8 byte integers                                                                                                              |``False``
``ieee``                 |Adhere to IEEE-754 rules                                                                                                                  |``False``
``intel-static``         |Link Intel provided libraries statically                                                                                                  |``False``
``loose``                |Loose precision                                                                                                                           |``False``
``lowopt``               |Low compiler optimizations                                                                                                                |``False``
``no-icc``               |Don't set Intel specific macros                                                                                                           |``False``
``noopt``                |Disable compiler optimizations                                                                                                            |``False``
``oneapi``               |Use oneAPI compilers icx/icpx/ifx instead of classic compilers                                                                            |``None``
``oneapi_c_cxx``         |Use oneAPI C/C++ compilers icx/icpx instead of classic Intel C/C++ compilers (auto-enabled for Intel compilers version 2022.2.0, or newer)|``None``
``oneapi_fortran``       |Use oneAPI Fortran compiler ifx instead of classic Intel Fortran compiler                                                                 |``False``
``openmp``               |Enable OpenMP                                                                                                                             |``False``
``opt``                  |High compiler optimizations                                                                                                               |``False``
``optarch``              |Enable architecture optimizations                                                                                                         |``True``
``packed-linker-options``|Pack the linker options as comma separated list                                                                                           |``False``
``pic``                  |Use PIC                                                                                                                                   |``False``
``precise``              |High precision                                                                                                                            |``False``
``r8``                   |Real is 8 byte real                                                                                                                       |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration                                                                     |``True``
``shared``               |Build shared library                                                                                                                      |``False``
``static``               |Build static library                                                                                                                      |``False``
``strict``               |Strict (highest) precision                                                                                                                |``False``
``unroll``               |Unroll loops                                                                                                                              |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt                                                                   |``None``
``verbose``              |Verbose output                                                                                                                            |``False``
``veryloose``            |Very loose precision                                                                                                                      |``False``

## iimpi

### Available options for iimpi toolchain

option                   |description                                                                                                                               |default
-------------------------|------------------------------------------------------------------------------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                                                                                      |``False``
``cciscxx``              |Use CC as CXX                                                                                                                             |``False``
``cstd``                 |Specify C standard                                                                                                                        |``None``
``debug``                |Enable debug                                                                                                                              |``False``
``defaultopt``           |Default compiler optimizations                                                                                                            |``False``
``defaultprec``          |Default precision                                                                                                                         |``False``
``error-unknown-option`` |Error instead of warning for unknown options                                                                                              |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                                                                                             |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                                                                                           |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                                                                                           |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                                                                                            |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                                                                                             |``None``
``i8``                   |Integers are 8 byte integers                                                                                                              |``False``
``ieee``                 |Adhere to IEEE-754 rules                                                                                                                  |``False``
``intel-static``         |Link Intel provided libraries statically                                                                                                  |``False``
``loose``                |Loose precision                                                                                                                           |``False``
``lowopt``               |Low compiler optimizations                                                                                                                |``False``
``no-icc``               |Don't set Intel specific macros                                                                                                           |``False``
``noopt``                |Disable compiler optimizations                                                                                                            |``False``
``oneapi``               |Use oneAPI compilers icx/icpx/ifx instead of classic compilers                                                                            |``None``
``oneapi_c_cxx``         |Use oneAPI C/C++ compilers icx/icpx instead of classic Intel C/C++ compilers (auto-enabled for Intel compilers version 2022.2.0, or newer)|``None``
``oneapi_fortran``       |Use oneAPI Fortran compiler ifx instead of classic Intel Fortran compiler                                                                 |``False``
``openmp``               |Enable OpenMP                                                                                                                             |``False``
``opt``                  |High compiler optimizations                                                                                                               |``False``
``optarch``              |Enable architecture optimizations                                                                                                         |``True``
``packed-linker-options``|Pack the linker options as comma separated list                                                                                           |``False``
``pic``                  |Use PIC                                                                                                                                   |``False``
``precise``              |High precision                                                                                                                            |``False``
``r8``                   |Real is 8 byte real                                                                                                                       |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration                                                                     |``True``
``shared``               |Build shared library                                                                                                                      |``False``
``static``               |Build static library                                                                                                                      |``False``
``strict``               |Strict (highest) precision                                                                                                                |``False``
``unroll``               |Unroll loops                                                                                                                              |``False``
``usempi``               |Use MPI compiler as default compiler                                                                                                      |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt                                                                   |``None``
``verbose``              |Verbose output                                                                                                                            |``False``
``veryloose``            |Very loose precision                                                                                                                      |``False``

## iimpic

### Available options for iimpic toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``error-unknown-option`` |Error instead of warning for unknown options                           |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``intel-static``         |Link Intel provided libraries statically                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``no-icc``               |Don't set Intel specific macros                                        |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## iiqmpi

### Available options for iiqmpi toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``error-unknown-option`` |Error instead of warning for unknown options                           |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``intel-static``         |Link Intel provided libraries statically                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``no-icc``               |Don't set Intel specific macros                                        |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## impich

### Available options for impich toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``error-unknown-option`` |Error instead of warning for unknown options                           |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``intel-static``         |Link Intel provided libraries statically                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``no-icc``               |Don't set Intel specific macros                                        |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## impmkl

### Available options for impmkl toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``error-unknown-option`` |Error instead of warning for unknown options                           |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``intel-static``         |Link Intel provided libraries statically                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``no-icc``               |Don't set Intel specific macros                                        |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## intel-compilers

### Available options for intel-compilers toolchain

option                   |description                                                                                                                               |default
-------------------------|------------------------------------------------------------------------------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                                                                                      |``False``
``cciscxx``              |Use CC as CXX                                                                                                                             |``False``
``cstd``                 |Specify C standard                                                                                                                        |``None``
``debug``                |Enable debug                                                                                                                              |``False``
``defaultopt``           |Default compiler optimizations                                                                                                            |``False``
``defaultprec``          |Default precision                                                                                                                         |``False``
``error-unknown-option`` |Error instead of warning for unknown options                                                                                              |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                                                                                             |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                                                                                           |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                                                                                           |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                                                                                            |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                                                                                             |``None``
``i8``                   |Integers are 8 byte integers                                                                                                              |``False``
``ieee``                 |Adhere to IEEE-754 rules                                                                                                                  |``False``
``intel-static``         |Link Intel provided libraries statically                                                                                                  |``False``
``loose``                |Loose precision                                                                                                                           |``False``
``lowopt``               |Low compiler optimizations                                                                                                                |``False``
``no-icc``               |Don't set Intel specific macros                                                                                                           |``False``
``noopt``                |Disable compiler optimizations                                                                                                            |``False``
``oneapi``               |Use oneAPI compilers icx/icpx/ifx instead of classic compilers                                                                            |``None``
``oneapi_c_cxx``         |Use oneAPI C/C++ compilers icx/icpx instead of classic Intel C/C++ compilers (auto-enabled for Intel compilers version 2022.2.0, or newer)|``None``
``oneapi_fortran``       |Use oneAPI Fortran compiler ifx instead of classic Intel Fortran compiler                                                                 |``False``
``openmp``               |Enable OpenMP                                                                                                                             |``False``
``opt``                  |High compiler optimizations                                                                                                               |``False``
``optarch``              |Enable architecture optimizations                                                                                                         |``True``
``packed-linker-options``|Pack the linker options as comma separated list                                                                                           |``False``
``pic``                  |Use PIC                                                                                                                                   |``False``
``precise``              |High precision                                                                                                                            |``False``
``r8``                   |Real is 8 byte real                                                                                                                       |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration                                                                     |``True``
``shared``               |Build shared library                                                                                                                      |``False``
``static``               |Build static library                                                                                                                      |``False``
``strict``               |Strict (highest) precision                                                                                                                |``False``
``unroll``               |Unroll loops                                                                                                                              |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt                                                                   |``None``
``verbose``              |Verbose output                                                                                                                            |``False``
``veryloose``            |Very loose precision                                                                                                                      |``False``

## intel-para

### Available options for intel-para toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``error-unknown-option`` |Error instead of warning for unknown options                           |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``intel-static``         |Link Intel provided libraries statically                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``no-icc``               |Don't set Intel specific macros                                        |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## intel

### Available options for intel toolchain

option                   |description                                                                                                                               |default
-------------------------|------------------------------------------------------------------------------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                                                                                      |``False``
``cciscxx``              |Use CC as CXX                                                                                                                             |``False``
``cstd``                 |Specify C standard                                                                                                                        |``None``
``debug``                |Enable debug                                                                                                                              |``False``
``defaultopt``           |Default compiler optimizations                                                                                                            |``False``
``defaultprec``          |Default precision                                                                                                                         |``False``
``error-unknown-option`` |Error instead of warning for unknown options                                                                                              |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                                                                                             |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                                                                                           |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                                                                                           |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                                                                                            |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                                                                                             |``None``
``i8``                   |Integers are 8 byte integers                                                                                                              |``False``
``ieee``                 |Adhere to IEEE-754 rules                                                                                                                  |``False``
``intel-static``         |Link Intel provided libraries statically                                                                                                  |``False``
``loose``                |Loose precision                                                                                                                           |``False``
``lowopt``               |Low compiler optimizations                                                                                                                |``False``
``no-icc``               |Don't set Intel specific macros                                                                                                           |``False``
``noopt``                |Disable compiler optimizations                                                                                                            |``False``
``oneapi``               |Use oneAPI compilers icx/icpx/ifx instead of classic compilers                                                                            |``None``
``oneapi_c_cxx``         |Use oneAPI C/C++ compilers icx/icpx instead of classic Intel C/C++ compilers (auto-enabled for Intel compilers version 2022.2.0, or newer)|``None``
``oneapi_fortran``       |Use oneAPI Fortran compiler ifx instead of classic Intel Fortran compiler                                                                 |``False``
``openmp``               |Enable OpenMP                                                                                                                             |``False``
``opt``                  |High compiler optimizations                                                                                                               |``False``
``optarch``              |Enable architecture optimizations                                                                                                         |``True``
``packed-linker-options``|Pack the linker options as comma separated list                                                                                           |``False``
``pic``                  |Use PIC                                                                                                                                   |``False``
``precise``              |High precision                                                                                                                            |``False``
``r8``                   |Real is 8 byte real                                                                                                                       |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration                                                                     |``True``
``shared``               |Build shared library                                                                                                                      |``False``
``static``               |Build static library                                                                                                                      |``False``
``strict``               |Strict (highest) precision                                                                                                                |``False``
``unroll``               |Unroll loops                                                                                                                              |``False``
``usempi``               |Use MPI compiler as default compiler                                                                                                      |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt                                                                   |``None``
``verbose``              |Verbose output                                                                                                                            |``False``
``veryloose``            |Very loose precision                                                                                                                      |``False``

## intelcuda

### Available options for intelcuda toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``error-unknown-option`` |Error instead of warning for unknown options                           |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``intel-static``         |Link Intel provided libraries statically                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``no-icc``               |Don't set Intel specific macros                                        |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## iomkl

### Available options for iomkl toolchain

option                   |description                                                                                                                               |default
-------------------------|------------------------------------------------------------------------------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                                                                                      |``False``
``cciscxx``              |Use CC as CXX                                                                                                                             |``False``
``cstd``                 |Specify C standard                                                                                                                        |``None``
``debug``                |Enable debug                                                                                                                              |``False``
``defaultopt``           |Default compiler optimizations                                                                                                            |``False``
``defaultprec``          |Default precision                                                                                                                         |``False``
``error-unknown-option`` |Error instead of warning for unknown options                                                                                              |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                                                                                             |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                                                                                           |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                                                                                           |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                                                                                            |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                                                                                             |``None``
``i8``                   |Integers are 8 byte integers                                                                                                              |``False``
``ieee``                 |Adhere to IEEE-754 rules                                                                                                                  |``False``
``intel-static``         |Link Intel provided libraries statically                                                                                                  |``False``
``loose``                |Loose precision                                                                                                                           |``False``
``lowopt``               |Low compiler optimizations                                                                                                                |``False``
``no-icc``               |Don't set Intel specific macros                                                                                                           |``False``
``noopt``                |Disable compiler optimizations                                                                                                            |``False``
``oneapi``               |Use oneAPI compilers icx/icpx/ifx instead of classic compilers                                                                            |``None``
``oneapi_c_cxx``         |Use oneAPI C/C++ compilers icx/icpx instead of classic Intel C/C++ compilers (auto-enabled for Intel compilers version 2022.2.0, or newer)|``None``
``oneapi_fortran``       |Use oneAPI Fortran compiler ifx instead of classic Intel Fortran compiler                                                                 |``False``
``openmp``               |Enable OpenMP                                                                                                                             |``False``
``opt``                  |High compiler optimizations                                                                                                               |``False``
``optarch``              |Enable architecture optimizations                                                                                                         |``True``
``packed-linker-options``|Pack the linker options as comma separated list                                                                                           |``False``
``pic``                  |Use PIC                                                                                                                                   |``False``
``precise``              |High precision                                                                                                                            |``False``
``r8``                   |Real is 8 byte real                                                                                                                       |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration                                                                     |``True``
``shared``               |Build shared library                                                                                                                      |``False``
``static``               |Build static library                                                                                                                      |``False``
``strict``               |Strict (highest) precision                                                                                                                |``False``
``unroll``               |Unroll loops                                                                                                                              |``False``
``usempi``               |Use MPI compiler as default compiler                                                                                                      |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt                                                                   |``None``
``verbose``              |Verbose output                                                                                                                            |``False``
``veryloose``            |Very loose precision                                                                                                                      |``False``

## iomklc

### Available options for iomklc toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``error-unknown-option`` |Error instead of warning for unknown options                           |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``intel-static``         |Link Intel provided libraries statically                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``no-icc``               |Don't set Intel specific macros                                        |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## iompi

### Available options for iompi toolchain

option                   |description                                                                                                                               |default
-------------------------|------------------------------------------------------------------------------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                                                                                      |``False``
``cciscxx``              |Use CC as CXX                                                                                                                             |``False``
``cstd``                 |Specify C standard                                                                                                                        |``None``
``debug``                |Enable debug                                                                                                                              |``False``
``defaultopt``           |Default compiler optimizations                                                                                                            |``False``
``defaultprec``          |Default precision                                                                                                                         |``False``
``error-unknown-option`` |Error instead of warning for unknown options                                                                                              |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                                                                                             |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                                                                                           |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                                                                                           |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                                                                                            |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                                                                                             |``None``
``i8``                   |Integers are 8 byte integers                                                                                                              |``False``
``ieee``                 |Adhere to IEEE-754 rules                                                                                                                  |``False``
``intel-static``         |Link Intel provided libraries statically                                                                                                  |``False``
``loose``                |Loose precision                                                                                                                           |``False``
``lowopt``               |Low compiler optimizations                                                                                                                |``False``
``no-icc``               |Don't set Intel specific macros                                                                                                           |``False``
``noopt``                |Disable compiler optimizations                                                                                                            |``False``
``oneapi``               |Use oneAPI compilers icx/icpx/ifx instead of classic compilers                                                                            |``None``
``oneapi_c_cxx``         |Use oneAPI C/C++ compilers icx/icpx instead of classic Intel C/C++ compilers (auto-enabled for Intel compilers version 2022.2.0, or newer)|``None``
``oneapi_fortran``       |Use oneAPI Fortran compiler ifx instead of classic Intel Fortran compiler                                                                 |``False``
``openmp``               |Enable OpenMP                                                                                                                             |``False``
``opt``                  |High compiler optimizations                                                                                                               |``False``
``optarch``              |Enable architecture optimizations                                                                                                         |``True``
``packed-linker-options``|Pack the linker options as comma separated list                                                                                           |``False``
``pic``                  |Use PIC                                                                                                                                   |``False``
``precise``              |High precision                                                                                                                            |``False``
``r8``                   |Real is 8 byte real                                                                                                                       |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration                                                                     |``True``
``shared``               |Build shared library                                                                                                                      |``False``
``static``               |Build static library                                                                                                                      |``False``
``strict``               |Strict (highest) precision                                                                                                                |``False``
``unroll``               |Unroll loops                                                                                                                              |``False``
``usempi``               |Use MPI compiler as default compiler                                                                                                      |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt                                                                   |``None``
``verbose``              |Verbose output                                                                                                                            |``False``
``veryloose``            |Very loose precision                                                                                                                      |``False``

## iompic

### Available options for iompic toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``error-unknown-option`` |Error instead of warning for unknown options                           |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``intel-static``         |Link Intel provided libraries statically                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``no-icc``               |Don't set Intel specific macros                                        |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## ipsmpi

### Available options for ipsmpi toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``error-unknown-option`` |Error instead of warning for unknown options                           |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``intel-static``         |Link Intel provided libraries statically                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``no-icc``               |Don't set Intel specific macros                                        |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## iqacml

### Available options for iqacml toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``error-unknown-option`` |Error instead of warning for unknown options                           |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``intel-static``         |Link Intel provided libraries statically                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``no-icc``               |Don't set Intel specific macros                                        |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## ismkl

### Available options for ismkl toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``error-unknown-option`` |Error instead of warning for unknown options                           |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``intel-static``         |Link Intel provided libraries statically                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``no-icc``               |Don't set Intel specific macros                                        |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## nvompi

### Available options for nvompi toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## nvompic

### Available options for nvompic toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## nvpsmpi

### Available options for nvpsmpi toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## nvpsmpic

### Available options for nvpsmpic toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## pmkl

### Available options for pmkl toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## pomkl

### Available options for pomkl toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## pompi

### Available options for pompi toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## system

### Available options for system toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## xlcxlf

### Available options for xlcxlf toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``error-unknown-option`` |Error instead of warning for unknown options                           |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ibm-static``           |Link IBM XL provided libraries statically                              |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## xlmpich2

### Available options for xlmpich2 toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``error-unknown-option`` |Error instead of warning for unknown options                           |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ibm-static``           |Link IBM XL provided libraries statically                              |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## xlmpich

### Available options for xlmpich toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``error-unknown-option`` |Error instead of warning for unknown options                           |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ibm-static``           |Link IBM XL provided libraries statically                              |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## xlmvapich2

### Available options for xlmvapich2 toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``error-unknown-option`` |Error instead of warning for unknown options                           |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ibm-static``           |Link IBM XL provided libraries statically                              |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

## xlompi

### Available options for xlompi toolchain

option                   |description                                                            |default
-------------------------|-----------------------------------------------------------------------|---------
``32bit``                |Compile 32bit target                                                   |``False``
``cciscxx``              |Use CC as CXX                                                          |``False``
``cstd``                 |Specify C standard                                                     |``None``
``debug``                |Enable debug                                                           |``False``
``defaultopt``           |Default compiler optimizations                                         |``False``
``defaultprec``          |Default precision                                                      |``False``
``error-unknown-option`` |Error instead of warning for unknown options                           |``False``
``extra_cflags``         |Specify extra CFLAGS options.                                          |``None``
``extra_cxxflags``       |Specify extra CXXFLAGS options.                                        |``None``
``extra_f90flags``       |Specify extra F90FLAGS options.                                        |``None``
``extra_fcflags``        |Specify extra FCFLAGS options.                                         |``None``
``extra_fflags``         |Specify extra FFLAGS options.                                          |``None``
``i8``                   |Integers are 8 byte integers                                           |``False``
``ibm-static``           |Link IBM XL provided libraries statically                              |``False``
``ieee``                 |Adhere to IEEE-754 rules                                               |``False``
``loose``                |Loose precision                                                        |``False``
``lowopt``               |Low compiler optimizations                                             |``False``
``noopt``                |Disable compiler optimizations                                         |``False``
``openmp``               |Enable OpenMP                                                          |``False``
``opt``                  |High compiler optimizations                                            |``False``
``optarch``              |Enable architecture optimizations                                      |``True``
``packed-linker-options``|Pack the linker options as comma separated list                        |``False``
``pic``                  |Use PIC                                                                |``False``
``precise``              |High precision                                                         |``False``
``r8``                   |Real is 8 byte real                                                    |``False``
``rpath``                |Use RPATH wrappers when --rpath is enabled in EasyBuild configuration  |``True``
``shared``               |Build shared library                                                   |``False``
``static``               |Build static library                                                   |``False``
``strict``               |Strict (highest) precision                                             |``False``
``unroll``               |Unroll loops                                                           |``False``
``usempi``               |Use MPI compiler as default compiler                                   |``False``
``vectorize``            |Enable compiler auto-vectorization, default except for noopt and lowopt|``None``
``verbose``              |Verbose output                                                         |``False``
``veryloose``            |Very loose precision                                                   |``False``

# Typical workflow example: building and installing WRF {: #typical_workflow }

This section shows an example case of building
[Weather Research and Forecasting (WRF)](https://www.mmm.ucar.edu/models/wrf) scientific software application,
which is a notoriously complex software application to build and install.
With EasyBuild however, WRF can be installed quite easily and here is how.


First, you search which easyconfigs are available for WRF, using `--search` (see [Searching for easyconfigs, `--search` / `-S`][searching_for_easyconfigs])
and you select one based on the software version, toolchain, etc.

Using the selected easyconfig file, you can get an overview of the planned installations using `--dry-run` (see [Getting an overview of planned installations `--dry-run` / `-D`][get_an_overview]).

Finally, building and installing WRF is done by specifying the matching easyconfig file in the eb command line,
and using `--robot` (see [Enabling dependency resolution, `--robot` / `-r` and `--robot-paths`][use_robot]) to enable dependency resolution. That way WRF and all of its dependencies are installed with **a single command**!


## Searching for available easyconfigs files

Searching for build specification for a particular software package can be done using the
`--search`/`-S` command line options (see [Searching for easyconfigs, `--search` / `-S`][searching_for_easyconfigs]);
for example, to get a list of available easyconfig files for WRF:

``` console
$ eb -S WRF
CFGS1=/user/gent/445/vsc44588/easybuild/easybuild-easyconfigs/easybuild/easyconfigs
 * $CFGS1/w/WPS/WPS-4.0.1_find-wrfdir.patch
 * $CFGS1/w/WPS/WPS-4.0.2_find-wrfdir.patch
 [ . . . ]
 * $CFGS1/w/WRF/WRF-4.4-foss-2022a-dmpar.eb
 * $CFGS1/w/WRF/WRF-4.4.1-foss-2022b-dmpar.eb
 [ . . . ]

Note: 16 matching archived easyconfig(s) found, use --consider-archived-easyconfigs to see them
```

Various easyconfig files are found: for different versions of WRF (e.g., v4.4 and v4.4.1),
for different (versions of) compiler toolchains (e.g., foss 2022a, foss 2022b), etc.

For the remainder of this example, we will use the available
`WRF-4.4.1-foss-2022b-dmpar.eb` easyconfig file to specify to EasyBuild
to build and install WRF v4.4.1 using version 2022b of the `foss`
toolchain, which is one of the [Common toolchains][common_toolchains].  The `foss`
toolchain stands for `GCC, OpenMPI, OpenBLAS/LAPACK, ScaLAPACK, and FFTW`.
See [List of known toolchains][toolchains_table] for a list of all available toolchains.

## Getting an overview of planned installations

To get an overview of the software that EasyBuild is going to build and install
we can use the `--dry-run`/`-D` (see [Getting an overview of planned installations `--dry-run` / `-D`][get_an_overview]) command line option.
This will show a list of easyconfig files
that will be used, together with the module files that will be installed,
as well as their current availability (`[x]` marks available modules).

Note that EasyBuild will take care of all of the dependencies of WRF as well,
and can even install the compiler toolchain as well if the corresponding modules are not available yet:

``` console
$ eb WRF-4.4.1-foss-2022b-dmpar.eb -Dr
== Temporary log file in case of crash /tmp/vsc44588/eb-n67uls6o/easybuild-2r30g117.log
Dry run: printing build status of easyconfigs and dependencies
CFGS=/user/gent/445/vsc44588/easybuild/easybuild-easyconfigs/easybuild/easyconfigs
 * [x] $CFGS/m/M4/M4-1.4.19.eb (module: M4/1.4.19)
 * [x] $CFGS/b/Bison/Bison-3.8.2.eb (module: Bison/3.8.2)
 * [x] $CFGS/f/flex/flex-2.6.4.eb (module: flex/2.6.4)
 * [x] $CFGS/z/zlib/zlib-1.2.12.eb (module: zlib/1.2.12)
 * [x] $CFGS/b/binutils/binutils-2.39.eb (module: binutils/2.39)
 * [x] $CFGS/g/GCCcore/GCCcore-12.2.0.eb (module: GCCcore/12.2.0)
 * [x] $CFGS/z/zlib/zlib-1.2.12-GCCcore-12.2.0.eb (module: zlib/1.2.12-GCCcore-12.2.0)
 * [x] $CFGS/h/help2man/help2man-1.49.2-GCCcore-12.2.0.eb (module: help2man/1.49.2-GCCcore-12.2.0)
 * [x] $CFGS/m/M4/M4-1.4.19-GCCcore-12.2.0.eb (module: M4/1.4.19-GCCcore-12.2.0)
 * [x] $CFGS/b/Bison/Bison-3.8.2-GCCcore-12.2.0.eb (module: Bison/3.8.2-GCCcore-12.2.0)
 * [x] $CFGS/f/flex/flex-2.6.4-GCCcore-12.2.0.eb (module: flex/2.6.4-GCCcore-12.2.0)
 * [x] $CFGS/b/binutils/binutils-2.39-GCCcore-12.2.0.eb (module: binutils/2.39-GCCcore-12.2.0)
 * [x] $CFGS/l/libtool/libtool-2.4.7-GCCcore-12.2.0.eb (module: libtool/2.4.7-GCCcore-12.2.0)
 * [x] $CFGS/n/ncurses/ncurses-6.3-GCCcore-12.2.0.eb (module: ncurses/6.3-GCCcore-12.2.0)
 * [x] $CFGS/g/groff/groff-1.22.4-GCCcore-12.2.0.eb (module: groff/1.22.4-GCCcore-12.2.0)
 * [x] $CFGS/e/expat/expat-2.4.9-GCCcore-12.2.0.eb (module: expat/2.4.9-GCCcore-12.2.0)
 * [x] $CFGS/b/bzip2/bzip2-1.0.8-GCCcore-12.2.0.eb (module: bzip2/1.0.8-GCCcore-12.2.0)
 * [x] $CFGS/l/libreadline/libreadline-8.2-GCCcore-12.2.0.eb (module: libreadline/8.2-GCCcore-12.2.0)
 * [x] $CFGS/p/pkgconf/pkgconf-1.9.3-GCCcore-12.2.0.eb (module: pkgconf/1.9.3-GCCcore-12.2.0)
 * [ ] $CFGS/t/tcsh/tcsh-6.24.07-GCCcore-12.2.0.eb (module: tcsh/6.24.07-GCCcore-12.2.0)
 * [ ] $CFGS/t/time/time-1.9-GCCcore-12.2.0.eb (module: time/1.9-GCCcore-12.2.0)
 * [x] $CFGS/s/Szip/Szip-2.1.1-GCCcore-12.2.0.eb (module: Szip/2.1.1-GCCcore-12.2.0)
 * [ ] $CFGS/l/libiconv/libiconv-1.17-GCCcore-12.2.0.eb (module: libiconv/1.17-GCCcore-12.2.0)
 * [x] $CFGS/g/GCC/GCC-12.2.0.eb (module: GCC/12.2.0)
 * [x] $CFGS/p/pkgconf/pkgconf-1.8.0.eb (module: pkgconf/1.8.0)
 * [x] $CFGS/o/OpenSSL/OpenSSL-1.1.eb (module: OpenSSL/1.1)
 * [x] $CFGS/c/cURL/cURL-7.86.0-GCCcore-12.2.0.eb (module: cURL/7.86.0-GCCcore-12.2.0)
 * [x] $CFGS/d/DB/DB-18.1.40-GCCcore-12.2.0.eb (module: DB/18.1.40-GCCcore-12.2.0)
 * [x] $CFGS/p/Perl/Perl-5.36.0-GCCcore-12.2.0.eb (module: Perl/5.36.0-GCCcore-12.2.0)
 * [x] $CFGS/a/Autoconf/Autoconf-2.71-GCCcore-12.2.0.eb (module: Autoconf/2.71-GCCcore-12.2.0)
 * [x] $CFGS/a/Automake/Automake-1.16.5-GCCcore-12.2.0.eb (module: Automake/1.16.5-GCCcore-12.2.0)
 * [x] $CFGS/a/Autotools/Autotools-20220317-GCCcore-12.2.0.eb (module: Autotools/20220317-GCCcore-12.2.0)
 * [x] $CFGS/g/gzip/gzip-1.12-GCCcore-12.2.0.eb (module: gzip/1.12-GCCcore-12.2.0)
 * [x] $CFGS/f/FFTW/FFTW-3.3.10-GCC-12.2.0.eb (module: FFTW/3.3.10-GCC-12.2.0)
 * [x] $CFGS/l/lz4/lz4-1.9.4-GCCcore-12.2.0.eb (module: lz4/1.9.4-GCCcore-12.2.0)
 * [x] $CFGS/l/libevent/libevent-2.1.12-GCCcore-12.2.0.eb (module: libevent/2.1.12-GCCcore-12.2.0)
 * [x] $CFGS/n/numactl/numactl-2.0.16-GCCcore-12.2.0.eb (module: numactl/2.0.16-GCCcore-12.2.0)
 * [x] $CFGS/n/ncurses/ncurses-6.3.eb (module: ncurses/6.3)
 * [x] $CFGS/g/gettext/gettext-0.21.1.eb (module: gettext/0.21.1)
 * [x] $CFGS/x/XZ/XZ-5.2.7-GCCcore-12.2.0.eb (module: XZ/5.2.7-GCCcore-12.2.0)
 * [x] $CFGS/l/libxml2/libxml2-2.10.3-GCCcore-12.2.0.eb (module: libxml2/2.10.3-GCCcore-12.2.0)
 * [x] $CFGS/l/libarchive/libarchive-3.6.1-GCCcore-12.2.0.eb (module: libarchive/3.6.1-GCCcore-12.2.0)
 * [x] $CFGS/z/zstd/zstd-1.5.2-GCCcore-12.2.0.eb (module: zstd/1.5.2-GCCcore-12.2.0)
 * [x] $CFGS/c/CMake/CMake-3.24.3-GCCcore-12.2.0.eb (module: CMake/3.24.3-GCCcore-12.2.0)
 * [ ] $CFGS/d/Doxygen/Doxygen-1.9.5-GCCcore-12.2.0.eb (module: Doxygen/1.9.5-GCCcore-12.2.0)
 * [x] $CFGS/j/JasPer/JasPer-4.0.0-GCCcore-12.2.0.eb (module: JasPer/4.0.0-GCCcore-12.2.0)
 * [x] $CFGS/u/UCX/UCX-1.13.1-GCCcore-12.2.0.eb (module: UCX/1.13.1-GCCcore-12.2.0)
 * [x] $CFGS/u/UnZip/UnZip-6.0-GCCcore-12.2.0.eb (module: UnZip/6.0-GCCcore-12.2.0)
 * [x] $CFGS/l/libfabric/libfabric-1.16.1-GCCcore-12.2.0.eb (module: libfabric/1.16.1-GCCcore-12.2.0)
 * [x] $CFGS/x/xorg-macros/xorg-macros-1.19.3-GCCcore-12.2.0.eb (module: xorg-macros/1.19.3-GCCcore-12.2.0)
 * [x] $CFGS/l/libpciaccess/libpciaccess-0.17-GCCcore-12.2.0.eb (module: libpciaccess/0.17-GCCcore-12.2.0)
 * [x] $CFGS/h/hwloc/hwloc-2.8.0-GCCcore-12.2.0.eb (module: hwloc/2.8.0-GCCcore-12.2.0)
 * [x] $CFGS/p/PMIx/PMIx-4.2.2-GCCcore-12.2.0.eb (module: PMIx/4.2.2-GCCcore-12.2.0)
 * [x] $CFGS/l/libffi/libffi-3.4.4-GCCcore-12.2.0.eb (module: libffi/3.4.4-GCCcore-12.2.0)
 * [x] $CFGS/t/Tcl/Tcl-8.6.12-GCCcore-12.2.0.eb (module: Tcl/8.6.12-GCCcore-12.2.0)
 * [x] $CFGS/s/SQLite/SQLite-3.39.4-GCCcore-12.2.0.eb (module: SQLite/3.39.4-GCCcore-12.2.0)
 * [x] $CFGS/p/Python/Python-3.10.8-GCCcore-12.2.0-bare.eb (module: Python/3.10.8-GCCcore-12.2.0-bare)
 * [x] $CFGS/b/BLIS/BLIS-0.9.0-GCC-12.2.0.eb (module: BLIS/0.9.0-GCC-12.2.0)
 * [x] $CFGS/o/OpenBLAS/OpenBLAS-0.3.21-GCC-12.2.0.eb (module: OpenBLAS/0.3.21-GCC-12.2.0)
 * [x] $CFGS/f/FlexiBLAS/FlexiBLAS-3.2.1-GCC-12.2.0.eb (module: FlexiBLAS/3.2.1-GCC-12.2.0)
 * [x] $CFGS/u/UCC/UCC-1.1.0-GCCcore-12.2.0.eb (module: UCC/1.1.0-GCCcore-12.2.0)
 * [x] $CFGS/o/OpenMPI/OpenMPI-4.1.4-GCC-12.2.0.eb (module: OpenMPI/4.1.4-GCC-12.2.0)
 * [x] $CFGS/g/gompi/gompi-2022b.eb (module: gompi/2022b)
 * [x] $CFGS/f/FFTW.MPI/FFTW.MPI-3.3.10-gompi-2022b.eb (module: FFTW.MPI/3.3.10-gompi-2022b)
 * [x] $CFGS/s/ScaLAPACK/ScaLAPACK-2.2.0-gompi-2022b-fb.eb (module: ScaLAPACK/2.2.0-gompi-2022b-fb)
 * [x] $CFGS/f/foss/foss-2022b.eb (module: foss/2022b)
 * [x] $CFGS/h/HDF5/HDF5-1.14.0-gompi-2022b.eb (module: HDF5/1.14.0-gompi-2022b)
 * [ ] $CFGS/n/netCDF/netCDF-4.9.0-gompi-2022b.eb (module: netCDF/4.9.0-gompi-2022b)
 * [ ] $CFGS/n/netCDF-Fortran/netCDF-Fortran-4.6.0-gompi-2022b.eb (module: netCDF-Fortran/4.6.0-gompi-2022b)
 * [ ] $CFGS/w/WRF/WRF-4.4.1-foss-2022b-dmpar.eb (module: WRF/4.4.1-foss-2022b-dmpar)
== Temporary log file(s) /tmp/eb-n67uls6o/easybuild-2r30g117.log* have been removed.
== Temporary directory /tmp/eb-n67uls6o has been removed.
```


## Installing a software stack

To make EasyBuild build and install WRF, including all of its dependencies, a **single command** is sufficient.

By using the `--robot`/`-r` (see [Enabling dependency resolution, `--robot` / `-r` and `--robot-paths`][use_robot]) command line option,
we enable dependency resolution such that the entire software stack is handled:

``` console
$ eb WRF-4.4.1-foss-2022b-dmpar.eb --robot
== temporary log file in case of crash /tmp/eb-LfQa8b/easybuild-TBXLTy.log
== resolving dependencies ...
== processing EasyBuild easyconfig /home/example/.local/easybuild/software/EasyBuild/4.7.2/easybuild/easyconfigs/w/WRF/WRF-4.4.1-foss-2022b-dmpar.eb
== building and installing ncurses/6.3-GCCcore-12.2.0...
[...]
== building and installing tcsh/6.20.00-GCCcore-12.2.0...
[...]
== building and installing CMake/3.24.3-GCCcore-12.2.0...
[...]
== building and installing JasPer/4.0.0-GCCcore-12.2.0...
[...]
== building and installing pkg-config/0.29.2-GCCcore-12.2.0...
[...]
== building and installing Doxygen/1.9.5-GCCcore-12.2.0...
[...]
== building and installing cURL/7.86.0-GCCcore-12.2.0...
[...]
== building and installing Szip/2.1.1-GCCcore-12.2.0...
[...]
== building and installing HDF5/1.14.0-gompi-2022b...
[...]
== building and installing netCDF/4.9.0-foss-2022b...
[...]
== building and installing netCDF-Fortran/4.6.0-foss-2022b...
[...]
== building and installing WRF/4.4.1-foss-2022b-dmpar...
[...]
== Build succeeded for 12 out of 12
== Temporary log file(s) /tmp/eb-LfQa8b/easybuild-TBXLTy.log* have been removed.
== Temporary directory /tmp/eb-LfQa8b has been removed.
```

Once the installation has succeeded, modules will be available for WRF and all of its dependencies:

``` console
$ module load WRF/4.4.1-foss-2022b-dmpar
$ module list

Currently Loaded Modules:
  1) EasyBuild/4.7.2                    18) OpenBLAS/0.3.21-GCC-12.2.0
  2) GCCcore/12.2.0                     19) FlexiBLAS/3.2.1-GCC-12.2.0
  3) zlib/1.2.12-GCCcore-12.2.0         20) FFTW/3.3.10-GCC-12.2.0 foss/2018b
  4) binutils/2.39-GCCcore-12.2.0       21) gompi/2022b
  5) GCC/12.2.0                         22) FFTW.MPI/3.3.10-gompi-2022b
  6) numactl/2.0.16-GCCcore-12.2.0      23) foss/2022b
  7) XZ/5.2.7-GCCcore-12.2.0            24) JasPer/4.0.0-GCCcore-12.2.0
  8) libxml2/2.10.3-GCCcore-12.2.0      25) Szip/2.1.1-GCCcore-12.2.0
  9) libpciaccess/0.17-GCCcore-12.2.0   26) HDF5/1.14.0-gompi-2022b
 10) hwloc/2.8.0-GCCcore-12.2.0         27) cURL/7.86.0-GCCcore-12.2.0
 11) OpenSSL/1.1                        28) gzip/1.12-GCCcore-12.2.0
 12) libevent/2.1.12-GCCcore-12.2.0     29) lz4/1.9.4-GCCcore-12.2.0
 13) UCX/1.13.1-GCCcore-12.2.0          30) zstd/1.5.2-GCCcore-12.2.0
 14) libfabric/1.16.1-GCCcore-12.2.0    31) bzip2/1.0.8-GCCcore-12.2.0
 15) PMIx/4.2.2-GCCcore-12.2.0          32) netCDF/4.9.0-gompi-2022b
 16) UCC/1.1.0-GCCcore-12.2.0           33) netCDF-Fortran/4.6.0-gompi-2022b
 17) OpenMPI/4.1.4-GCC-12.2.0           34) WRF/4.4.1-foss-2022b-dmpar
```

For more information, see also [Using EasyBuild](using-easybuild.md).

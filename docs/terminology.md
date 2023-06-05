# Concepts and terminology {: #concepts_and_terminology }

EasyBuild consists of a collection of Python modules and packages that interact with each other,
dynamically picking up additional Python modules as needed for building and installing
a (stack of) software package(s) specified via simple specification files.

Or, in EasyBuild terminology: **the EasyBuild framework leverages easyblocks to automatically
build and install software using particular compiler toolchains, as specified by one or multiple easyconfig files**.

## EasyBuild framework {: #framework }

The EasyBuild **framework** embodies the core of the tool, providing functionality commonly
needed when installing scientific software on HPC systems. For example, it deals with downloading,
unpacking and patching of sources, loading module files for dependencies,
setting up the build environment, autonomously running (interactive) shell commands,
creating module files that match the specification files, etc.

Included in the framework is an `abstract` implementation of a software build and install procedure,
which is split up into different `steps`:

* unpacking sources
* configuration
* build
* installation
* module generation
* etc.

Most of these steps, i.e., the ones which are generally more-or-less
analogous across different software packages, have appropriate (default) implementations.
The only exceptions are the configuration, build and installation steps that are purposely
left unimplemented (since there is no common procedure for them).

Each of the steps can be
tweaked and steered via different parameters known to the framework, for which values are
either obtained from the provided specification files or set to reasonable default values.
See [Easyconfig files][easyconfig_files].

<!-- XXX - UPDATE BY VERSION FIXME -->

In EasyBuild version {{ easybuild.version }} the framework source code consists of about 31,500 lines of code,
organized across about 225 Python modules in roughly 20 Python package directories,
next to about 27,000 lines of code for tests. This provides some notion of the size of the
EasyBuild framework and the amount of supporting functionality it has to offer.


## Easyblocks {: #easyblocks }

The implementation of a particular software build and install procedure is done in a Python module,
which is aptly referred to as an **easyblock**.

Each easyblock ties in with the framework API
by defining (or extending/replacing) one or more of the step functions that are part
of the abstract procedure used by the EasyBuild framework. Easyblocks typically heavily
rely on the supporting functionality provided by the framework, for example for
(autonomously) executing (interactive) shell commands and obtaining the command's output and exit code.

A distinction is made between **software-specific** and **generic** easyblocks. Software-specific
easyblocks implement a build and install procedure which is entirely custom to one particular
software package (e.g., WRF), while generic easyblocks implement a procedure using standard
tools (e.g., CMake). Since easyblocks are implemented in an object-oriented scheme, the step
methods implemented by a particular easyblock can be reused in others via inheritance,
enabling code reuse across build procedure implementations.

For each software package being built, the EasyBuild framework will determine which easyblock
should be used, based on the name of the software package or the value of the `easyblock`
specification parameter (see [Easyblock specification][writing_easyconfigs_easyblock_spec]).
Since EasyBuild v2.0, an easyblock *must* be specified in case no matching easyblock is found based on the
software name (cfr. [Automagic fallback to ConfigureMake][depr_ConfigureMake_fallback_eb1]).


## Toolchains {: #toolchains }

EasyBuild employs so-called **compiler toolchains** or, simply `toolchains` for short,
which are a major concept in handling the build and installation processes.

A typical toolchain consists of one or more compilers, usually put together with some libraries for specific functionality,
e.g., for using an MPI stack for distributed computing, or which provide optimized routines for commonly
used math operations, e.g., the well-known BLAS/LAPACK APIs for linear algebra routines.

For each software package being built, the toolchain to be used must be specified in some way.

The EasyBuild framework prepares the `build environment` for the different toolchain components,
by loading their respective modules and defining environment variables to specify compiler commands
(e.g., via `$F90`), compiler and linker options (e.g., via `$CFLAGS` and `$LDFLAGS`), the list
of library names to supply to the linker (via `$LIBS`), etc. This enables making easyblocks largely
`toolchain-agnostic` since they can simply rely on these environment variables; that is, unless they
need to be aware of, for example, the particular compiler being used to determine the build configuration options.

Recent releases of EasyBuild include out-of-the-box toolchain support for:

* various compilers, including GCC, Intel, Clang, CUDA
* common MPI libraries, such as Intel MPI, MPICH, MVAPICH2, OpenMPI
* various numerical libraries, including ATLAS, Intel MKL, OpenBLAS, ScalaPACK, FFTW

Please see the [Common toolchains][common_toolchains] page for details about the two most common toolchains,
one for "free and open source software" (`foss`) based on GCC and one based on the Intel compilers
(`intel`).


### `system` toolchain {: #system_toolchain_terminology }

The `system` toolchain is a special case. It is an *empty* toolchain, i.e. a toolchain without any components,
and corresponds to using the readily available compilers and libraries (e.g., the ones provided by the operating
system, or by modules which were loaded before issuing the `eb` command).

When the `system` toolchain is used, a corresponding `system` module file is not required/loaded and no build
environment is being defined.



### `dummy` toolchain *(DEPRECATED)* {: #dummy_toolchain }

The `dummy` toolchain has been deprecated in EasyBuild v4.0, and replaced by the [`system` toolchain][system_toolchain].


### Common toolchains

For more information on the concept of *common toolchains*, see [Common toolchains][common_toolchains].


## Easyconfig files {: #easyconfig_files }

The specification files that are supplied to EasyBuild are referred to as **easyconfig files**
(or simply `easyconfigs`), which are basically plain text files containing (mostly)
key-value assignments for build parameters supported by the framework, also referred
to as **easyconfig parameters** (see [Writing easyconfig files: the basics][writing_easyconfig_files] for more information).

Note that easyconfig files only provide the bits of information required
to determine the corresponding module name; the module name itself is computed by EasyBuild
framework by querying the module naming scheme being used. The complete
list of supported easyconfig parameters can be easily obtained via the EasyBuild command line using
`eb -a` (see also [All available easyconfig parameters, `--avail-easyconfig-params` / `-a`][avail_easyconfig_params]).

As such, each easyconfig file provides a complete specification of which particular software
package should be installed, and which settings should be used for building it. After completing
an installation, EasyBuild copies the used easyconfig file to the install directory, as a template,
and also supports maintaining an easyconfig archive which is updated on every successful installation.
Therefore, reproducing installations becomes trivial.


## Extensions {: #extensions }

Some software packages support installing additional add-ons alongside the 'main' software, either in the same
installation prefix, or in a separate location.

In EasyBuild, we use the neutral term '**extensions**' to refer these add-ons.

Well-known examples include:

* [Perl modules](https://www.cpan.org/modules/)
* [Python packages](https://pypi.python.org/pypi)
* [R libraries](https://cran.r-project.org/web/packages/)
* [Ruby gems](https://guides.rubygems.org/what-is-a-gem/)


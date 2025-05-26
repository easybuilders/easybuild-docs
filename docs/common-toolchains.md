# Common toolchains {: #common_toolchains }

This page documents the concept of *common toolchains* in the EasyBuild
community; for a more general definition of what (compiler) toolchains
are, see [Toolchains][toolchains].

## Definition and motivation {: #common_toolchains_what }

Picking a [compiler toolchain][toolchains]
to use is one of the first things you (need to) do
when starting to use EasyBuild. This can be a daunting task, since a
whole bunch of toolchains and different toolchain versions are readily
available in EasyBuild. It may be difficult to determine which toolchain
would be most rewarding to use, in terms of stability, performance of
the resulting binaries and readily available easyconfig files.

In an attempt to focus the effort of the EasyBuild community, the
concept of so-called *common toolchains* was introduced.

The idea is to compose and maintain a limited set of specific compiler
toolchains, and try and convince many HPC sites to employ these
toolchains. This helps in assuring stability of these toolchains w.r.t.
which software can be built (correctly) with them, since they get
significantly more testing. In addition, the expectation/hope is that
more easyconfigs are contributed back to the central easyconfigs
repository (<https://github.com/easybuilders/easybuild-easyconfigs>),
resulting in a wide range of readily available easyconfig files using
the common toolchains.

The intention is to revise/update the definitions of the common
toolchains regularly (see [Update cycle for common toolchains][common_toolchains_update_cycle]), which again
can be a joint effort that benefits many HPC sites.

Currently, two different families of common toolchains are being maintained: `foss`
and `intel`; see below for more details, and also
[Overview of common toolchains][common_toolchains_overview].

### Toolchain diagram {: #toolchains_diagram }

To be more helpful in understanding the differences between these families, here is a diagram that explains what is added in
each additional layer.

Note: because there have been a few changes in toolchains, there are notes below the diagram
that explain the differences between the generations going back to the `2020b` version of the `foss` and `intel` toolchains.

#### Newest generations (`2022b` and later):

``` mermaid
graph LR
  A[GCCcore] --> |binutils| B[GCC];
  A --> |binutils| C[intel-compilers];
  B --> |OpenMPI| E[gompi];
  C --> |impi| F[iimpi];
  B --> |"FlexiBLAS (incl. LAPACK) + FFTW"| D[gfbf];
  D --> |OpenMPI + ScaLAPACK| G[foss];
  E --> |FlexiBLAS + FFTW + ScaLAPACK| G[foss];
  F --> |imkl| Z[intel];
  C --> |imkl| H[iimkl];
  H --> |impi| Z[intel];
```

Note: following notes apply for the generations listed and those older than it:

- <= `2021b` - `gfbf` not present yet
- <= `2020b` - `foss` uses OpenBLAS instead of FlexiBLAS, `iccifort` is used instead of `intel-compilers`


Keep in mind that when creating an Easyconfig, you need to look at what toolchain "level" (e.g. `foss` vs `GCC`) your
dependencies are using and choose the highest of them (or higher if needed) for your easyconfig.
For example, if one of your dependencies is using the `foss` toolchain, you need to use the `foss` 
toolchain, and not the `GCC` toolchain.

### `foss` toolchain {: #common_toolchains_foss }

The `foss` common compiler toolchain consists entirely of open source
software (hence the name, derived from the common term 'FOSS', which is
short for "Free and Open Source Software").

This toolchain consists of:

- binutils (<https://www.gnu.org/software/binutils/>)
- the GNU Compiler Collection (GCC, <https://gcc.gnu.org/>), i.e. `gcc`
  (C), `g++` (C++) and `gfortran` (Fortran)
- the Open MPI library (<https://www.open-mpi.org/>)
- the OpenBLAS (<http://www.openblas.net/>) + LAPACK
  (<http://netlib.org/lapack>) libraries (for `foss` \< 2021a)
- the FlexiBLAS library
  (<https://www.mpi-magdeburg.mpg.de/projects/flexiblas>), with
  OpenBLAS + LAPACK as backend (for `foss` \>= 2021a)
- the ScaLAPACK (<http://netlib.org/scalapack>) library is also included
- the FFTW library (<http://fftw.org/>)

!!! note

    The toolchain name was deliberately chosen to be generic, to allow for
    swapping any of the toolchain components with a better (open source)
    alternative in the future, should the need or opportunity arise.

### `intel` toolchain {: #common_toolchains_intel }

The `intel` common compiler toolchain consists of the Intel compilers
and libraries, i.e.:

- the Intel C/C++/Fortran compilers
  (<https://software.intel.com/en-us/intel-compilers>), i.e. `icc`,
  `icpc` and `ifort`,
  - binutils and GCC, which serve as a base for the Intel compilers, are
    also included
- the Intel MPI library
  (<https://software.intel.com/en-us/intel-mpi-library>)
- the Intel Math Kernel Library (MKL,
  <https://software.intel.com/en-us/intel-mkl>) for BLAS/LAPACK/FFT
  functionality

!!! note

    This compiler toolchain includes licensed software; valid licenses must
    be available to install and use it.

## Versioning scheme for common toolchains {: #common_toolchains_versioning_scheme }

The common toolchains follow a specific versioning scheme, which takes
the [6-month update cycle][common_toolchains_update_cycle] into account.

Each revision of the common toolchains is versioned as the *year* in
which it was defined, plus an additional '`a`' or '`b`' to indicate
whether the toolchain was defined at the start of the year ('`a`') or
halfway through the year ('`b`'); in short, the common toolchains are
versioned as `<year>{a,b}`.

For example, `foss/2021b` is a revision of the `foss` that was composed
mid-2021.

A full historic overview of the `foss` and `intel` common toolchains is
available in [Overview of common toolchains][common_toolchains_overview].

!!! note

    Next to the versions that follow the `<year>{a,b}` versioning scheme,
    additional versions of the `foss` and `intel` versions are available as
    well.

    These versions are **not** considered to be part of the series of common
    toolchains (even though they consists of the same toolchain components).
    These versions may be site-specific, or compositions that were put in
    place to evaluate a potential future common toolchain.

    Typically, they are versioned as `<year>.<month>`, indicating when the
    most recent component included was released, or when that particular
    toolchain composition was defined.

## Update cycle for common toolchains {: #common_toolchains_update_cycle }

The intention is to revise and update the common toolchains every 6
months: once in late December/early January (version `<year>a`), and
once in late June/early July (version `<year>b`). Each one of these
versions is a so-called *toolchain generation*.

Each new version is meant be to be a community effort, in the sense that a
proposal for an updated composition is shared and discussed before it is set in
stone. Usually, discussion about new toolchains takes place initially in the
[toolchain-wg](https://easybuild.slack.com/archives/C02FU5Y5CDT) in Slack, the
bi-weekly conf calls and later in respective pull requests in the
[easybuild-easyconfigs](https://github.com/easybuilders/easybuild-easyconfigs)
repository.

Recent versions of each of the toolchain components are considered,
taking into account stability, performance improvements, added features,
known bugs/issues and experiences with those versions.

Moreover, the proposed toolchain compositions are tested extensively,
typically by rebuilding all available easyconfigs that are using the
most recent revision of the common toolchains at that time.

Once a new toolchain generation is released, it will be supported by the
maintainers of Easybuild for a limited period of time. Which is determined by
our [support policy on toolchain][policy_toolchains].

## Overview of common toolchains {: #common_toolchains_overview }

We support the [last 6 generations][policy_toolchains] of common toolchains.

Archived toolchains can be found in the
[easybuild-easyconfigs-archive](https://github.com/easybuilders/easybuild-easyconfigs-archive)
repository.

### Component versions in `foss` toolchain {: #common_toolchains_overview_foss }

| `foss`  | *support*  | *date*   | *binutils* | *GCC*  | *Open MPI* | *FlexiBLAS* | *OpenBLAS* | *LAPACK*               | *ScaLAPACK* | *FFTW*      |
|---------|------------|----------|------------|--------|------------|-------------|------------|------------------------|-------------|-------------|
| `2025a` | active     | May '25  | 2.42       | 14.2.0 | 5.0.7      | 3.4.5       | 0.3.29     | (incl. with FlexiBLAS) | 2.2.2       | 3.3.10      |
| `2024b` | *skipped*  | -        | -          | -      | -          | -           | -          | -                      | -           | -           |
| `2024a` | active     | Aug '24  | 2.42       | 13.3.0 | 5.0.3      | 3.4.4       | 0.3.27     | (incl. with FlexiBLAS) | 2.2.0       | 3.3.10      |
| `2023b` | active     | Dec '23  | 2.40       | 13.2.0 | 4.1.6      | 3.3.1       | 0.3.24     | (incl. with FlexiBLAS) | 2.2.0       | 3.3.10      |
| `2023a` | active     | Jun '23  | 2.40       | 12.3.0 | 4.1.5      | 3.3.1       | 0.3.23     | (incl. with FlexiBLAS) | 2.2.0       | 3.3.10      |
| `2022b` | active     | Dec '22  | 2.39       | 12.2.0 | 4.1.4      | 3.2.1       | 0.3.21     | (incl. with FlexiBLAS) | 2.2.0       | 3.3.10      |
| `2022a` | active     | Jun '22  | 2.38       | 11.3.0 | 4.1.4      | 3.2.0       | 0.3.20     | (incl. with FlexiBLAS) | 2.2.0       | 3.3.10      |
| `2021b` | deprecated | Oct '21  | 2.37       | 11.2.0 | 4.1.1      | 3.0.4       | 0.3.18     | (incl. with FlexiBLAS) | 2.1.0       | 3.3.10      |
| `2021a` | deprecated | May '21  | 2.36.1     | 10.3.0 | 4.1.1      | 3.0.4       | 0.3.15     | (incl. with FlexiBLAS) | 2.1.0       | 3.3.9       |
| `2020b` | archived   | Nov '20  | 2.35       | 10.2.0 | 4.0.5      | *(none)*    | 0.3.12     | (incl. with OpenBLAS)  | 2.1.0       | 3.3.8       |
| `2020a` | archived   | May '20  | 2.34       | 9.3.0  | 4.0.3      | *(none)*    | 0.3.9      | (incl. with OpenBLAS)  | 2.1.0       | 3.3.8       |
| `2019b` | archived   | Sept '19 | 2.32       | 8.3.0  | 3.1.4      | *(none)*    | 0.3.7      | (incl. with OpenBLAS)  | 2.0.2       | 3.3.8       |
| `2019a` | archived   | Jan '19  | 2.31.1     | 8.2.0  | 3.1.3      | *(none)*    | 0.3.5      | (incl. with OpenBLAS)  | 2.0.2       | 3.3.8       |
| `2018b` | archived   | Jul '18  | 2.30       | 7.3.0  | 3.1.1      | *(none)*    | 0.3.1      | (incl. with OpenBLAS)  | 2.0.2       | 3.3.8       |
| `2018a` | archived   | Jan '18  | 2.28       | 6.4.0  | 2.1.2      | *(none)*    | 0.2.20\*   | (incl. with OpenBLAS)  | 2.0.2       | 3.3.7       |
| `2017b` | archived   | Jul '17  | 2.28       | 6.4.0  | 2.1.1      | *(none)*    | 0.2.20\*   | (incl. with OpenBLAS)  | 2.0.2       | 3.3.6(-pl2) |
| `2017a` | archived   | Jan '17  | 2.27       | 6.3.0  | 2.0.2      | *(none)*    | 0.2.19     | 3.7.0                  | 2.0.2       | 3.3.6(-pl2) |
| `2016b` | archived   | Jul '16  | 2.26       | 5.4.0  | 1.10.3     | *(none)*    | 0.2.18     | 3.6.1                  | 2.0.2       | 3.3.4       |
| `2016a` | archived   | Jan '16  | 2.25       | 4.9.3  | 1.10.2     | *(none)*    | 0.2.15     | 3.6.0                  | 2.0.2       | 3.3.4       |
| `2015b` | archived   | Jul '15  | 2.25       | 4.9.3  | 1.8.8      | *(none)*    | 0.2.14     | 3.5.0                  | 2.0.2       | 3.3.4       |
| `2015a` | archived   | Jan '15  | '*(none)*  | 4.9.2  | 1.8.4      | *(none)*    | 0.2.13     | 3.5.0                  | 2.0.2       | 3.3.4       |
| `2014b` | archived   | Jul '14  | '*(none)*  | 4.8.3  | 1.8.1      | *(none)*    | 0.2.9      | 3.5.0                  | 2.0.2       | 3.3.4       |

*(components marked with* \* *were patched)*

### Component versions in `intel` toolchain {: #common_toolchains_overview_intel }

| `intel` | *support*  | *date*   | *binutils* | *GCC*  | *Intel compilers* | *Intel MPI* | *Intel MKL* |
|---------|------------|----------|------------|--------|-------------------|-------------|-------------|
| `2025a` | active     | May '25  | 2.42       | 14.2.0 | 2025.1.1          | 2021.15.0   | 2025.1.0    |
| `2024b` | *skipped*  | -        | -          | -      | -                 | -           | -           |
| `2024a` | active     | Aug '24  | 2.42       | 13.3.0 | 2024.2.0          | 2021.13.0   | 2024.2.0    |
| `2023b` | active     | Dec '23  | 2.40       | 13.2.0 | 2023.2.1          | 2021.10.1   | 2023.2.0    |
| `2023a` | active     | Jun '23  | 2.40       | 12.3.0 | 2023.1.0          | 2021.9.1    | 2023.1.0    |
| `2022b` | active     | Dec '22  | 2.39       | 12.2.0 | 2022.2.1          | 2021.7.1    | 2022.2.1    |
| `2022a` | active     | Jun '22  | 2.38       | 11.3.0 | 2022.1.0          | 2021.6.0    | 2022.1.0    |
| `2021b` | deprecated | Oct '21  | 2.37       | 11.2.0 | 2021.4.0          | 2021.4.0    | 2021.4.0    |
| `2021a` | deprecated | May '21  | 2.36.1     | 10.3.0 | 2021.2.0          | 2021.2.0    | 2021.2.0    |
| `2020b` | archived   | Nov '20  | 2.35       | 10.2.0 | 2020.4.304        | 2019.9.304  | 2020.4.304  |
| `2020a` | archived   | May '20  | 2.34       | 9.3.0  | 2020.1.217        | 2019.7.217  | 2020.1.217  |
| `2019b` | archived   | Sept '19 | 2.32       | 8.3.0  | 2019.5.281        | 2018.5.288  | 2019.5.281  |
| `2019a` | archived   | Jan '19  | 2.31.1     | 8.2.0  | 2019.1.144        | 2018.4.274  | 2019.1.144  |
| `2018b` | archived   | Jul '18  | 2.30       | 7.3.0  | 2018.3.222        | 2018.3.222  | 2018.3.222  |
| `2018a` | archived   | Jan '18  | 2.28       | 6.4.0  | 2018.1.163        | 2018.1.163  | 2018.1.163  |
| `2017b` | archived   | Jul '17  | 2.28       | 6.4.0  | 2017.4.196        | 2017.3.196  | 2017.3.196  |
| `2017a` | archived   | Jan '17  | 2.27       | 6.3.0  | 2017.1.132        | 2017.1.132  | 2017.1.132  |
| `2016b` | archived   | Jul '16  | 2.26       | 5.4.0  | 2016.3.210        | 5.1.3.181   | 11.3.3.210  |
| `2016a` | archived   | Jan '16  | 2.26       | 4.9.3  | 2016.1.150        | 5.1.2.150   | 11.3.1.150  |
| `2015b` | archived   | Jul '15  | 2.25       | 4.9.3  | 2015.3.187        | 5.0.3.048   | 11.2.3.187  |
| `2015a` | archived   | Jan '15  | '*(none)*  | 4.9.2  | 2015.1.133        | 5.0.2.044   | 11.2.1.133  |
| `2014b` | archived   | Jul '14  | '*(none)*  | 4.8.3  | 2013.5.192        | 4.1.3.049   | 11.1.2.144  |

## Customizing common toolchains {: #common_toolchains_customizing }

Sometimes the need arises to customize one or more components of a
common toolchain w.r.t. site-specific aspects. One common example is
using additional configuration options for Open MPI.

To customize a toolchain component, you should copy the corresponding
easyconfig file, modify according to your needs, and make sure it is
included in a location in the robot search path that precedes the
location of the easyconfig files that are included with EasyBuild (see
also [Searching for easyconfigs: the robot search path][robot_search_path]), before building and
installation the toolchain.

## More information about toolchains

Please see the [List of known toolchains](version-specific/toolchains.md) for how to obtain a listing of
the currently known toolchains.

For a detailed listing of the compiler options available with each
toolchain, please see [Available toolchain options (by toolchain)](version-specific/toolchain-opts.md).

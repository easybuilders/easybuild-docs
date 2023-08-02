# Including additional Python modules {: #including_additional_python_modules }

*(`--include-*`)*

SimpleBuild's capabilities can be extended easily, by including
additional Python modules that implement support for building and
installing software that is not supported (yet), define additional
module naming schemes, or introduce additional toolchains, (optionally)
with support for additional compilers, MPI libraries, linear algebra
libraries, etc.

Since SimpleBuild v2.2.0, dedicated configuration options are available
that make it straightforward to get SimpleBuild to pick up additional
Python modules, and get them registered in the appropriate `simplebuild`
subnamespace.

- [Including additional simpleblocks][include_simpleblocks]
- [Including additional module naming schemes][include_mns]
- [Including additional toolchains][include_toolchains]

## General aspects of `--include-*` options {: #include_general_remarks }

### Configuration types

The `--include-*` options can be specified via the `eb` command line,
using an environment variable (`$SIMPLEBUILD_INCLUDE_*`) or by defining
the corresponding `include-*` parameters in an SimpleBuild configuration
file, just like all other configuration options (see also
[Consistency across supported configuration types][configuration_consistency]).

### Format

The `--include-*` options accept a comma-separated list of paths to
Python modules.

These paths can be absolute or relative paths, or so-called *glob
patterns*, i.e., paths containing wildcard characters like `*` or `?`.
The latter can be used to include several Python modules at once.

For example, to include all Python modules located in the directory
`$HOME/myeb`, a path pattern like `$HOME/myeb/*.py` can be specified to
the appropriate `--include-*` option.

!!! note
    Shell expansion can get in the way of specifying paths to `eb` that contains wildcards. To avoid problems
    simply wrap the path in single quotes, or escape the wildcard
    characters using a backslash. Keep in mind that using single quotes
    also prevents environment variables (e.g., `$HOME`) from being
    expanded.

    Examples of correct path specifications containing wildcards:
    - in a configuration file (no escaping of wildcards required):
        `include-simpleblocks = /home/example/myeb/*.py`
    - using an environment variable:
        `export SIMPLEBUILD_INCLUDE_SIMPLEBLOCKS="$HOME/myeb\*.py"`
    - on the command line:
        `eb --include-simpleblocks='/home/example/myeb/*.py' ...`.

### How it works

For each of the `--include-*` options, SimpleBuild will set up a temporary
directory providing the corresponding Python package. In this directory,
symlinks will be put in place to each of the included Python modules.
The parent path is then injected in the Python search path to make the
included Python modules available as required.

### Order of preference

Python modules that are included via `--include-*` get preference over
other Python modules available in the Python search path (e.g., the one
that are part of the SimpleBuild installation you are using). This may be
useful when testing modifications to particular components of SimpleBuild,
for example simpleblocks.

!!! note
    It is recommended to only override existing components during testing. Future SimpleBuild versions may include
    important updates like bug fixes, which may be missed if customised
    implementations of components were put in place.

## Including additional simpleblocks {: #include_simpleblocks }

*(`--include-simpleblocks`)*

Adding support for building and installing additional software packages
can be done by specifying the location of Python modules that implement
simpleblocks via `--include-simpleblocks`.

Generic simpleblocks are expected to be located in a directory named
`generic`.

To verify that the simpleblocks you included are indeed being picked up,
`--list-simpleblocks=detailed` can be used (see also
[List of available simpleblocks][list_simpleblocks]).

Since SimpleBuild 4.2.0, simpleblocks from a pull request on GitHub can also
be included, using `--include-simpleblocks-from-pr` (see
[Using simpleblocks from pull requests][github_include_simpleblocks_from_pr]).

### Example

The example below shows how all self-implemented simpleblocks (both
software-specific and generic) located in the `$HOME/mysimpleblocks`
directory can be included:

``` console
$ export SIMPLEBUILD_INCLUDE_SIMPLEBLOCKS=$HOME/mysimpleblocks/\*.py,$HOME/mysimpleblocks/generic/\*.py
$ eb --list-simpleblocks=detailed
...
|-- EB_mytest (simplebuild.simpleblocks.mytest @ /tmp/example/eb-Bk3zxb/included-simpleblocks/simplebuild/simpleblocks/mytest.py)
...
|-- foo (simplebuild.simpleblocks.generic.foo @ /tmp/example/eb-Bk3zxb/included-simpleblocks/simplebuild/simpleblocks/generic/foo.py)
...
```

## Including additional module naming schemes {: #include_mns }

*(`--include-module-naming-schemes`)*

To make SimpleBuild aware of one or more custom module naming schemes, the
path to the corresponding Python modules can be specified via
`--include-module-naming-schemes`.

To verify that SimpleBuild is aware of the additional module naming
schemes, the `--avail-module-naming-schemes` option can be used.

### Example

The example below shows how all custom module naming schemes located in
the `$HOME/myebmns` can be included:

``` console
$ eb --include-module-naming-schemes=$HOME/myebmns/\*.py --avail-module-naming-schemes
List of supported module naming schemes:
    ...
    MyCustomMNS
    MyOtherCustomMNS
    ...
```

## Including additional toolchains {: #include_toolchains }

*(`--include-toolchains`)*

Plugging in Python modules that add support for additional toolchains,
optionally including additional toolchain components (compilers, MPI
libraries, BLAS/LAPACK/FFT libraries, ...) can be done via
`--include-toolchains`.

SimpleBuild will determine whether the Python module is a *toolchain
definition* or implements support for an *additional toolchain
component* based on the name of the directory in which it is located.
Implementations of toolchain components are expected to be located in a
directory named according to the type of component (`compiler`, `mpi`,
`linalg` or `fft`).

To verify that SimpleBuild is aware of the included toolchains,
`--list-toolchains` can be used.

### Example

The example below shows how the support for additional toolchains and
the required additional compiler/MPI toolchain components implemented by
the Python modules located in the directory `$HOME/myebtcs` can be
included:

``` console
$ export SIMPLEBUILD_INCLUDE_TOOLCHAINS=$HOME/myebtcs/\*.py,$HOME/myebtcs/compiler/\*.py,$HOME/myebtcs/mpi/\*.py
$ eb --list-toolchains
List of known toolchains (toolchainname: module[,module...]):
    ...
    mytoolchain: MyCompiler, MyMPI
    ...
```

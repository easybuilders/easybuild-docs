# Using the EasyBuild command line {: #using_the_easybuild_command_line }

Basic usage of EasyBuild is described in the following sections, covering the most important range of topics
if you are new to EasyBuild.

`eb` is EasyBuild’s main command line tool, to interact with the EasyBuild framework
and hereby the most common command line options are being documented.


## Specifying what to install {: #specifying_easyconfigs }

To instruct EasyBuild which software packages it should build/install and which build parameters it should use,
one or more [*easyconfig files*][easyconfig_files] must be specified.

This can be done in a number of ways:

* [by providing a single easyconfig file][specifying_easyconfigs_single]
* [via command line options][specifying_easyconfigs_command_line]
* [by providing a set of easyconfig files][specifying_easyconfigs_set_of_easyconfigs]
* [using `eb --from-pr`][github_from_pr]

Whenever EasyBuild searches for *explicitly specified* easyconfig files, it considers a couple of locations, i.e. (in order of preference):

* (i)   the local working directory
* (ii)  the robot search path (see [robot search path][robot_search_path])
* (iii) the path to easyconfig files that are part of the active EasyBuild installation
        (which is included in the default robot search path)

These locations are only considered for easyconfig files that are specified only by filename or using a relative path,
*not* for easyconfig files that are specified via an absolute path. The dependencies are resolved using the
robot search path (see [robot search path][robot_search_path]).

!!! note

    For easyconfig files specified on the `eb` command line, the *full* robot search path is only considered since
    EasyBuild v2.0.0. Earlier versions only considered the local working directory and the easyconfig files that are
    part of the active EasyBuild installation for *explicitly specified* easyconfig files.


### By providing a single easyconfig file {: #specifying_easyconfigs_single }

The most basic usage is to simply provide the name of an easyconfig file to the `eb` command.
EasyBuild will (try and) locate the easyconfig file, and perform the installation as specified by that easyconfig file.

For example, to build and install `HPL` using the `foss/2021b` toolchain:

```console
$ eb HPL-2.3-foss-2021b.eb --robot
[...]
== building and installing GCC/11.2.0...
[...]
== building and installing foss/2021b...
[...]
== building and installing HPL/2.3-foss-2021b...
== fetching files...
== creating build dir, resetting environment...
== unpacking...
== patching...
== preparing...
== configuring...
== building...
== testing...
== installing...
== taking care of extensions...
== packaging...
== postprocessing...
== sanity checking...
== cleaning up...
== creating module...
== COMPLETED: Installation ended successfully
== Results of the build can be found in the log file /home/example/.local/easybuild/software/HPL/2.3-foss-2021b/easybuild/easybuild-HPL-2.3-20221027.223237.log
== Build succeeded for 9 out of 9
```

Then, we can actually load the freshly installed HPL module:

```console
$ module load HPL/2.3-foss-2021b
$ which xhpl
/home/example/.local/easybuild/software/HPL/2.3-foss-2021b/bin/xhpl
```

All easyconfig file names' suffixes are `.eb` and follow format:
`<name>-<version>-<toolchain><versionsuffix>`

This is a crucial design aspect, since the dependency resolution mechanism (see [robot][use_robot]) relies upon this convention.

!!! tip

    You may wish to modify the installation prefix (e.g., using `--prefix` or by defining `$EASYBUILD_PREFIX`),
    in order to redefine the build/install/source path prefix to be used; default value is: `$HOME/.local/easybuild`;
    see [Configuration][configuring_easybuild]

!!! note

    If you are not familiar with modules (`module` command), see [Overview of basic module commands][module_cmds_overview]


### Via command line options {: #specifying_easyconfigs_command_line }

An alternative approach is to only use command line options to specify which software to build.
Refer to the `Software search and build options` section in the `eb --help` output for an overview
of the available command line options for this purpose (see also [`--help`][basic_usage_help]).

Here is how to build and install last version of HPL (that EasyBuild is aware of)
using the `foss/2021b` toolchain:

```console
$ eb --software-name=HPL --toolchain=foss,2021b
[...]
== building and installing HPL/2.3-foss-2021b...
[...]
== COMPLETED: Installation ended successfully
[...]
```

At this point, a module `HPL/2.3-foss-2021b` should have been installed.


### By providing a set of easyconfig files {: #specifying_easyconfigs_set_of_easyconfigs }

Multiple easyconfig files can be provided as well, either directly or by specifying a directory that contains easyconfig files.

For example, to build and install both HPL and GCC with a single command, simply list the easyconfigs for both on the
`eb` command line (note that HPL is not being reinstalled, since a matching module is already available):

```console
$ eb HPL-2.3-foss-2021b.eb GCC-12.2.0.eb
[...]
== HPL/2.3-foss-2021b is already installed (module found), skipping
[...]
== building and installing GCC/12.2.0...
[...]
== Build succeeded for 1 out of 1
[...]
```

When one or more directories are provided, EasyBuild will (recursively) traverse them
to find easyconfig files. For example:

```console
$ find set_of_easyconfigs/ -type f
set_of_easyconfigs/GCC-12.2.0.eb
set_of_easyconfigs/foo.txt
set_of_easyconfigs/tools/HPL-2.3-foss-2021b.eb
```

```console
$ eb set_of_easyconfigs/
== temporary log file in case of crash /tmp/easybuild-1yxCvv/easybuild-NeNmZr.log
== HPL/2.3-foss-2021b is already installed (module found), skipping
== GCC/12.2.0 is already installed (module found), skipping
== No easyconfigs left to be built.
== Build succeeded for 0 out of 0
```

!!! note

    EasyBuild will only pick up the files which end with `.eb` -- anything else will be ignored.

!!! tip

    Calling EasyBuild is designed as an *idempotent* operation;
    if a module is available that matches with an provided easyconfig file, the installation will simply be skipped.


## Commonly used command line options

### Command line help

*(`--help`, `-H`)*

Detailed information about the usage of the eb command is available via the `--help`, `-H`, `-h` help options.

!!! note

    `--help` / `-H` spit out the long help info (i.e. including long option names), `-h` only includes short option names.

!!! tip

    This is the best way to query for certain information, esp. recent features, since this is in sync with the actual EasyBuild version being used.

### Report version

*(`--version`)*

You can query which EasyBuild version you are using with `--version`:

```console
$ eb --version
This is EasyBuild 4.6.2 (framework: 4.6.2, easyblocks: 4.6.2) on host example.local.
```

!!! tip

    Asking EasyBuild to print own its version is a quick way to ensure that `$PYTHONPATH`
    is set up correctly, so that the entire EasyBuild installation (framework and easyblocks) is available.

### List of known toolchains {: #list_toolchains }

*(`--list-toolchains`)*

For an overview of known [toolchains][toolchains], use `eb --list-toolchains`.

The complete table of available toolchains is available [here][toolchains_table].


### List of available easyblocks {: #list_easyblocks }

*(`--list-easyblocks`)*

You can obtain a list of available [easyblocks][easyblocks] via `--list-easyblocks`.

The `--list-easyblocks` command line option prints the easyblocks in a hierarchical way,
showing the inheritance patterns, with the "base" easyblock class `EasyBlock` on top.

Software-specific easyblocks have a name that starts with `EB_`; the ones that do not are generic easyblocks.
(see [easyblocks][easyblocks] for the distinction between both types of easyblocks).

For example, a list of easyblocks can be obtained with:

```shell
eb --list-easyblocks
```

To see more details about the available easyblocks, i.e., in which Python module the class is defined, and where it is
located, use `--list-easyblocks=detailed`.


## All available easyconfig parameters {: #avail_easyconfig_params }

*(`--avail-easyconfig-params` / `-a`)*

EasyBuild provides a significant amount of easyconfig parameters.
An overview of all available easyconfig parameters can be obtained via
`eb --avail-easyconfig-params`, or `eb -a` for short.

See [available easyconfig parameters][vsd_avail_easyconfig_params] for more information,
the supported parameters are a very rich set.

Combine -a with `--easyblock`/`-e` to include parameters that are specific to a particular easyblock.

??? example "Overview of easyconfig parameters, including those specific to the easyblock for WRF (indicated with (`*`)):"

    ``` {: .console #eb_a_e_EB_WRF }
    $ eb -a -e EB_WRF

    Available easyconfig parameters (* indicates specific for the EB_WRF EasyBlock)
    MANDATORY
    ---------
    buildtype(*):         Specify the type of build (serial, smpar (OpenMP), dmpar (MPI), dm+sm (hybrid OpenMP/MPI)). (default: None)
    description:          A short description of the software (default: None)
    docurls:              List of urls with documentation of the software (not necessarily on homepage) (default: None)
    homepage:             The homepage of the software (default: None)
    name:                 Name of software (default: None)
    software_license:     Software license (default: None)
    software_license_urls:        List of software license locations (default: None)
    toolchain:            Name and version of toolchain (default: None)
    version:              Version of software (default: None)

    EASYBLOCK-SPECIFIC
    ------------------
    rewriteopts(*):       Replace -O3 with CFLAGS/FFLAGS (default: True)
    runtest(*):           Build and run WRF tests (default: True)

    TOOLCHAIN
    ---------
    onlytcmod:            Boolean/string to indicate if the toolchain should only load the environment with module (True) or also set all other variables (False) like compiler CC etc (if string: comma separated list of variables that will be ignored). (default: False)
    toolchainopts:        Extra options for compilers (default: None)

    BUILD
    -----
    buildopts:            Extra options passed to make step (default already has -j X) (default: )
    checksums:            Checksums for sources and patches (default: [])
    configopts:           Extra options passed to configure (default already has --prefix) (default: )
    easyblock:            EasyBlock to use for building (default: ConfigureMake)
    easybuild_version:    EasyBuild-version this spec-file was written for (default: None)
    installopts:          Extra options for installation (default: )
    maxparallel:          Max degree of parallelism (default: None)
    parallel:             Degree of parallelism for e.g. make (default: based on the number of cores, active cpuset and restrictions in ulimit) (default: None)
    patches:              List of patches to apply (default: [])
    postinstallcmds:      Commands to run after the install step. (default: [])
    prebuildopts:         Extra options pre-passed to build command. (default: )
    preconfigopts:        Extra options pre-passed to configure. (default: )
    preinstallopts:       Extra prefix options for installation. (default: )
    runtest(*):           Indicates if a test should be run after make; should specify argument after make (for e.g.,"test" for make test) (default: None)
    sanity_check_commands:        format: [(name, options)] e.g. [('gzip','-h')]. Using a non-tuple is equivalent to (name, '-h') (default: [])
    sanity_check_paths:   List of files and directories to check (format: {'files':<list>, 'dirs':<list>}) (default: {})
    skip:                 Skip existing software (default: False)
    skipsteps:            Skip these steps (default: [])
    source_urls:          List of URLs for source files (default: [])
    sources:              List of source files (default: [])
    stop:                 Keyword to halt the build process after a certain step. (default: None)
    tests:                List of test-scripts to run after install. A test script should return a non-zero exit status to fail (default: [])
    unpack_options:       Extra options for unpacking source (default: None)
    unwanted_env_vars:    List of environment variables that shouldn't be set during build (default: [])
    versionprefix:        Additional prefix for software version (placed before version and toolchain name) (default: )
    versionsuffix:        Additional suffix for software version (placed after toolchain name) (default: )

    FILE-MANAGEMENT
    ---------------
    buildininstalldir:    Boolean to build (True) or not build (False) in the installation directory (default: False)
    cleanupoldbuild:      Boolean to remove (True) or backup (False) the previous build directory with identical name or not. (default: True)
    cleanupoldinstall:    Boolean to remove (True) or backup (False) the previous install directory with identical name or not. (default: True)
    dontcreateinstalldir: Boolean to create (False) or not create (True) the install directory (default: False)
    keeppreviousinstall:  Boolean to keep the previous installation with identical name. Experts only! (default: False)
    keepsymlinks:         Boolean to determine whether symlinks are to be kept during copying or if the content of the files pointed to should be copied (default: False)
    start_dir:            Path to start the make in. If the path is absolute, use that path. If not, this is added to the guessed path. (default: None)

    DEPENDENCIES
    ------------
    allow_system_deps:    Allow listed system dependencies (format: (<name>, <version>)) (default: [])
    builddependencies:    List of build dependencies (default: [])
    dependencies:         List of dependencies (default: [])
    hiddendependencies:   List of dependencies available as hidden modules (default: [])
    osdependencies:               OS dependencies that should be present on the system (default: [])

    LICENSE
    -------
    group:                Name of the user group for which the software should be available (default: None)
    key:                  Key for installing software (default: None)
    license_file:         License file for software (default: None)
    license_server:       License server for software (default: None)
    license_server_port:  Port for license server (default: None)

    EXTENSIONS
    ----------
    exts_classmap:        Map of extension name to class for handling build and installation. (default: {})
    exts_defaultclass:    List of module for and name of the default extension class (default: None)
    exts_filter:          Extension filter details: template for cmd and input to cmd (templates for name, version and src). (default: None)
    exts_list:            List with extensions added to the base installation (default: [])

    MODULES
    -------
    include_modpath_extensions: Include $MODULEPATH extensions specified by module naming scheme. (default: True)
    modaliases:           Aliases to be defined in module file (default: {})
    modextrapaths:        Extra paths to be prepended in module file (default: {})
    modextravars:         Extra environment variables to be added to module file (default: {})
    modloadmsg:           Message that should be printed when generated module is loaded (default: {})
    modtclfooter:         Footer to include in generated module file (Tcl syntax) (default: )
    moduleclass:          Module class to be used for this software (default: base)
    moduleforceunload:    Force unload of all modules when loading the extension (default: False)
    moduleloadnoconflict: Don't check for conflicts, unload other versions instead  (default: False)

    OTHER
    -----
    buildstats:           A list of dicts with build statistics (default: None)
    ```


### Enable debug logging

*(`--debug` / `-d`)*

Use `eb --debug`/`-d` to enable debug logging, to include all details of how EasyBuild performed a build in the log file:

```shell
eb HPL-2.3-foss-2021b.eb --debug
```

!!! tip

    You may enable this by default via adding `debug = True` in your EasyBuild configuration file.

!!! note

    Debug log files are significantly larger than non-debug logs, beware!


### Rebuild installation {: #rebuild_option }

*(`--rebuild`)*

Use `eb --rebuild` to rebuild a given easyconfig/module.

!!! warning

    Use with care, since the reinstallation of existing modules will be done without requesting confirmation first!

!!! tip

    Combine `--rebuild` with `--dry-run` to get a good view on which installations will be rebuilt
    (see also [Getting an overview of planned installations][get_an_overview]).

!!! note

    To create a backup of existing modules that are regenerated when `--rebuild` is used,
    use `--backup-modules` (see also [Backing up of existing modules][backup_modules]).


### Forced reinstallation {: #force_option }

*(`--force` / `-f`)*

Use `eb --force`/`-f` to force the reinstallation of a given easyconfig/module.
The behavior of `--force` is the same as `--rebuild` and `--ignore-osdeps`.

!!! warning

    Use with care, since the reinstallation of existing modules will be done without requesting confirmation first!

!!! tip

    Combine `--force` with `--dry-run` to get a good view on which installations will be forced
    (see also [Getting an overview of planned installations][get_an_overview]).

!!! note

    To create a backup of existing modules that are regenerated when `--rebuild` is used,
    use `--backup-modules` (see also [Backing up of existing modules][backup_modules]).


### Searching for easyconfigs {: #searching_for_easyconfigs }

*(`--search` / `-S`)*

Searching for available easyconfig files can be done using the `--search` (long output) and `-S` (short output)
command line options. All easyconfig files available in the robot search path are considered
(see [robot search path][robot_search_path]), and searching is done *case-insensitive*.

For example, to see which easyconfig files are available for the software package named `Mesquite`:

```console
$ eb --search mesquite
== temporary log file in case of crash /tmp/eb-_TYdTf/easybuild-iRJ2vb.log
== Searching (case-insensitive) for 'mesquite' in /home/example/easybuild-easyconfigs/easybuild/easyconfigs
* /home/example/easybuild-easyconfigs/easybuild/easyconfigs/m/Mesquite/Mesquite-2.3.0-GCCcore-8.3.0.eb
```

The same query with `-S` is more readable, when there is a joint path that can be collapsed to a variable like `$CFGS1`:

```console
$ eb -S mesquite
== temporary log file in case of crash /tmp/eb-5diJjn/easybuild-nUXlkj.log
== Searching (case-insensitive) for 'mesquite' in /home/example/easybuild-easyconfigs/easybuild/easyconfigs
CFGS1=/home/example/easybuild-easyconfigs/easybuild/easyconfigs/m/Mesquite
* $CFGS1/Mesquite-2.3.0-GCCcore-8.3.0.eb
```

For more specific searching, a regular expression pattern can be supplied (since EasyBuild v2.1.1).

For example, to search which easyconfig files are available for GCC v11.x, without listing easyconfig files that use
GCC v11.x as a toolchain:

```console
$ eb -S ^GCC-11.
== temporary log file in case of crash /tmp/eb-PpwTwm/easybuild-b8yrOG.log
== Searching (case-insensitive) for '^GCC-11.' in /home/example/easybuild-easyconfigs/easybuild/easyconfigs
CFGS1=/home/example/easybuild-easyconfigs/easybuild/easyconfigs/g/GCC
 * $CFGS1/GCC-11.1.0.eb
 * $CFGS1/GCC-11.2.0.eb
 * $CFGS1/GCC-11.3.0.eb
```

Or, to find all easyconfig files for matplotlib versions 3.5.1 and 3.5.2 that use the `intel` toolchain:

```console
$ eb -S '^matplotlib-3.5.[12].*intel'
== temporary log file in case of crash /tmp/eb-Dv5LEJ/easybuild-xpGGSF.log
== Searching (case-insensitive) for '^matplotlib-3.5.[12].*intel' in /home/example/easybuild-easyconfigs/easybuild/easyconfigs
CFGS1=/home/example/easybuild-easyconfigs/easybuild/easyconfigs/m/matplotlib
 * $CFGS1/matplotlib-3.5.1-intel-2020b.eb
 * $CFGS1/matplotlib-3.5.2-intel-2022a.eb
```


## Enabling dependency resolution {: #use_robot }

*(`--robot` / `-r` and `--robot-paths`)*

EasyBuild supports installing an entire software stack, including the required toolchain
if needed, with a single `eb` invocation.

To enable dependency resolution, use the `--robot` command line option (or `-r` for short):

```console
$ eb binutils-2.39.eb --robot
[...]
== building and installing zlib/1.2.12...
[...]
== building and installing M4/1.4.19...
[...]
== building and installing Bison/3.8.2...
[...]
== building and installing flex/2.6.4...
[...]
== building and installing binutils/2.39...
[...]
== Build succeeded for 5 out of 5
```

The dependency resolution mechanism will construct a full dependency graph for the software package(s)
being installed, after which a list of dependencies is composed for which no module is available yet.
Each of the retained dependencies will then be built and installed, in the required order as indicated
by the dependency graph.

!!! tip

    Using `--robot` is particularly useful for software packages that have an extensive list of dependencies,
    or when reinstalling software using a different compiler toolchain
    (you can use the `--try-toolchain` command line option in combination with `--robot`).

!!! warning

    Unless dependency resolution is enabled, EasyBuid requires that modules are available for every dependency.
    If `--robot` is not used and one or more modules are missing, `eb` will exit with an error stating that a module
    for a particular dependency could not be found. For example:

    ```console
    Missing modules for dependencies (use --robot?): zlib/1.2.12
    ```

## Searching for easyconfigs: the robot search path {: #robot_search_path }

For each dependency that does not have a matching module installed yet, EasyBuild requires a corresponding easyconfig
file. If no such easyconfig file was specified on the `eb` command line, the dependency resolution mechanism will try
to locate one in the `robot search path`.

Searching for easyconfigs is done based on filename (see also [What is an easyconfig (file)?][what_is_an_easyconfig]),
with filenames being derived from the dependency specification (i.e. software name/version, toolchain and version suffix).
For each entry in the robot search path, a couple of different filepaths are considered, mostly determined by the software name.

For example, when looking for an easyconfig for `OpenMPI` version `4.1.4` and version suffix `-test` with toolchain
`GCC/11.3.0`, the following filepaths are considered (relative to each entry in the robot search path):

* `OpenMPI/4.1.4-GCC-11.3.0-test.eb`
* `OpenMPI/OpenMPI-4.1.4-GCC-11.3.0-test.eb`
* `o/OpenMPI/OpenMPI-4.1.4-GCC-11.3.0-test.eb`
* `OpenMPI-4.1.4-GCC-11.3.0-test.eb`

!!! note

    Sometimes easyconfig files are needed even when the modules for the dependencies are already available,
    i.e., whenever the information provided by the dependency specification (software name/version, toolchain and version
    suffix) is not sufficient. This is the case when using `--dry-run` to construct the complete dependency graph, or
    when the active module naming scheme requires some additional information (e.g., the `moduleclass`).

!!! warning

    If EasyBuild is unable to locate required easyconfigs, an appropriate error message will be shown. For example:

    ```console
    Irresolvable dependencies encountered: GCC/4.7.2
    ```

    or:

    ```console
    Failed to find easyconfig file 'GCC-4.7.2.eb' when determining module name for: {...}
    ```

### Default robot search path

By default, EasyBuild will only include the collection of easyconfig files that is part of the EasyBuild installation
in the robot search path. More specifically, only directories listed in the `Python search path` (partially specified
by the `$PYTHONPATH` environment variable) that contain a subdirectory named `easybuild/easyconfigs` are considered
part of the robot search path (in the order they are encountered).


### Controlling the robot search path {: #controlling_robot_search_path }

To control the robot search path, you can specify a (colon-separated list of) path(s) to `--robot`/`-r` and/or
`--robot-paths` (or, equivalently, `$EASYBUILD_ROBOT` and/or `$EASYBUILD_ROBOT_PATHS`):

```shell
eb --robot=$PWD:$HOME ...
```

These two configuration options each serve a particular purpose, and together define the robot search path:

* `--robot`, `-r`:
    * intended to be used (only) as a command line option to `eb` (although it can also be defined through another
      configuration type);
    * enables the dependency resolution mechanism (which is disabled by default);
    * optionally a list of paths can be specified, which is included *first* in the robot search path;
    * by default, the corresponding list of paths is *empty*;
* `--robot-paths`:
    * intended to be defined in an EasyBuild configuration file, or via `$EASYBUILD_ROBOT_PATHS`;
    * does *not* enable the dependency resolution mechanism;
    * the specified list of paths is included *last* in the robot search path;
    * by default, only the path to the easyconfig files that are part of the EasyBuild installation is listed;
    * **note**: setting this configuration option implies redefining the default robot search path, unless a
      prepending/appending list of paths is specified, see
      [Prepending/appending to the default robot search path][robot_search_path_prepend_append];

For both options, the list of paths should be specified as a colon-separated (`:`) list.

By combining `--robot` and `--robot-paths` using the different configuration types (see also
[Supported configuration types][configuration_types]), you have full control over the robot search path: which paths are included,
the order of those paths, whether or not the easyconfig files that are part of the EasyBuild installation should be
considered, etc.

A constant named `DEFAULT_ROBOT_PATHS` is available that can be used (only) in EasyBuild configuration files to refer
to the default robot search path, i.e. the path to the easyconfigs that are part of the EasyBuild installation.
For more information on using constants in EasyBuild configuration files, see
[Templates and constants supported in configuration files][configuration_file_templates_constants].

!!! tip

    Only use `--robot` to enable the dependency resolution mechanism; define `robot-paths` in your EasyBuild
    configuration file or via `$EASYBUILD_ROBOT_PATHS` to specify which sets of easyconfig files EasyBuild
    should consider, and in which order. By means of exception, a path can be specified to `--robot` to give a specific
    set of easyconfig files precedence over others, for example when testing modified easyconfig files.

!!! note

    The paths specified on the configuration type with the highest order of preference *replace* any paths
    specified otherwise, i.e. values are not retained across configuration types. That is: `--robot` *overrides*
    the value in `$EASYBUILD_ROBOT`, `$EASYBUILD_ROBOT_PATHS` *overrides* the `robot-paths` specification in an
    EasyBuild configuration file, etc. Of course, the value specified for `--robot` does not directly affect the value
    specified for `--robot-paths`, on any configuration level, and vice versa. For more information on the relation
    between the different configuration types, see [Supported configuration types][configuration_types].


### Prepending/appending to the default robot search path {: #robot_search_path_prepend_append }

Prepending or appending to the default robot search path is supported via the `--robot-paths` configuration option.

To *prepend* one or more paths, a list of paths followed by a '`:`' should be specified.

Analogously, to *append* one or more paths, a list of paths preceded by a '`:`' should be specified.

For example:

* "`export EASYBUILD_ROBOT_PATHS=/tmp:`" specifies to *prepend* `/tmp` to the robot search path;
* "`--robot-paths :/tmp:$HOME/test`" specifies to *append* `/tmp` and `$HOME/test` to the robot search path (in that order);
* "`--robot-paths=/tmp::$HOME/test`" specifies to *prepend* `/tmp` *and* to *append* `$HOME/test` to the robot search path;

### Example use case

For example, say we want to configure EasyBuild to behave as follows w.r.t. the robot search path:

* (i) (always) prefer easyconfig files in the archive/repository over the ones that are included in the EasyBuild installation;
* (ii) consider easyconfig files located in the current directory or home directory first (in that order), before any others;

Matching setup:

* satisfy (i) using `robot-paths` in one of the active EasyBuild configuration files (see also
  [List of configuration files][list_of_configuration_files]):

  ```ini
  [basic]
  repositorypath = /home/example/easybuild/easyconfigs_archive
  robot-paths = %(repositorypath)s:%(DEFAULT_ROBOT_PATHS)s
  ```

* satisfy (ii) via `--robot` on the `eb` command line:

  ```shell
  eb example.eb --robot $PWD:$HOME
  ```


## Getting an overview of planned installations {: #get_an_overview }

*(`--dry-run` / `-D`)*

You can do a "dry-run" overview by supplying `-D/--dry-run`:

```console
$ eb binutils-2.39.eb -D
== Temporary log file in case of crash /tmp/eb-3lh496ml/easybuild-hxmie76g.log
Dry run: printing build status of easyconfigs and dependencies
CFGS=/Volumes/work/easybuild-easyconfigs/easybuild/easyconfigs
 * [x] $CFGS/z/zlib/zlib-1.2.12.eb (module: zlib/1.2.12)
 * [x] $CFGS/m/M4/M4-1.4.19.eb (module: M4/1.4.19)
 * [x] $CFGS/b/Bison/Bison-3.8.2.eb (module: Bison/3.8.2)
 * [ ] $CFGS/f/flex/flex-2.6.4.eb (module: flex/2.6.4)
 * [ ] $CFGS/b/binutils/binutils-2.39.eb (module: binutils/2.39)
```

Note how the different status symbols denote distinct handling states by EasyBuild:

* `[ ]` The build is not available, EasyBuild will deliver it
* `[x]` The build is available, EasyBuild will skip building this module
* `[F]` The build is available, however EasyBuild has been asked to force a rebuild via `--force` and will do so
* `[R]` The build is available, and the application will be rebuilt as request via `--rebuild`


!!! note

    Since EasyBuild v2.4.0, a detailed overview of the build and install procedure that EasyBuild
    will be execute can be obtained using `--extended-dry-run` or `-x`, see [Extended dry run][extended_dry_run].


## Getting an overview of missing installations {: #eb_missing }

*(`--missing-modules` / `-M`)*

Since EasyBuild v3.9.1, you can obtain a list of missing installations (i.e. easyconfigs for which
no corresponding environment module file is available yet) using `eb --missing-modules` (or `-eb -M` for short):

```console
$ eb TensorFlow-1.13.1-foss-2019a-Python-3.7.2.eb --missing-modules
== temporary log file in case of crash /tmp/eb-bjCz9b/easybuild-CSAvhK.log

2 out of 54 required modules missing:

* Bazel/0.20.0-GCCcore-8.2.0 (Bazel-0.20.0-GCCcore-8.2.0.eb)
* TensorFlow/1.13.1-foss-2019a-Python-3.7.2 (TensorFlow-1.13.1-foss-2019a-Python-3.7.2.eb)
```

Note that dependency resolution is enabled automatically
(i.e., `--robot` is implied when using `--missing-modules` or `-M`).


## Tweaking existing easyconfig files {: #tweaking_easyconfigs_using_try }

*(`--try-*`)*

Making minor changes to existing easyconfig files can be done straight from the `eb` command line.
This way, having to manually copying and editing easyconfig files can be avoided.

Tweaking existing easyconfig files can be done using the `--try-*` command line options.
For each of the software build options that can be used as an alternative to specifying easyconfig file names,
a matching `--try-X` command line options is available:

* `--try-toolchain` to try using the toolchain with the given name and version
    * format: `--try-toolchain=<name>,<version>`
    * `--try-toolchain-name` to try using the latest toolchain version of a toolchain
    * `--try-toolchain-version` to try using a different toolchain version

* `--try-software-version` to try building a different software version

* `--try-amend` to try tweaking a different easyconfig parameter
    * format: `--try-amend=<param>=<value>`
    * only supports string and list-of-strings value types
    * example: `--try-amend=sources='["<source_url>"]'`

For example, to build and install BWA and its dependencies with a different toolchain version:

```console
$ eb BWA-0.7.17-GCC-10.3.0.eb --try-toolchain-version 11.2.0 -Dr
== Temporary log file in case of crash /tmp/eb-93m2gyhf/easybuild-_c86e81n.log
Dry run: printing build status of easyconfigs and dependencies
 ...
 * [x] /home/example/easybuild-easyconfigs/easybuild/easyconfigs/g/GCC/GCC-11.2.0.eb (module: GCC/11.2.0)
 * [ ] /home/example/easybuild-easyconfigs/easybuild/easyconfigs/g/groff/groff-1.22.4-GCCcore-11.2.0.eb (module: groff/1.22.4-GCCcore-11.2.0)
 * [ ] /tmp/eb-93m2gyhf/tweaked_dep_easyconfigs/expat-2.2.9-GCCcore-11.2.0.eb (module: expat/2.2.9-GCCcore-11.2.0)
 * [ ] /home/example/easybuild-easyconfigs/easybuild/easyconfigs/n/ncurses/ncurses-6.2-GCCcore-11.2.0.eb (module: ncurses/6.2-GCCcore-11.2.0)
 * [ ] /home/example/easybuild-easyconfigs/easybuild/easyconfigs/l/libreadline/libreadline-8.1-GCCcore-11.2.0.eb (module: libreadline/8.1-GCCcore-11.2.0)
 * [ ] /home/example/easybuild-easyconfigs/easybuild/easyconfigs/p/pkgconf/pkgconf-1.8.0.eb (module: pkgconf/1.8.0)
 * [ ] /home/example/easybuild-easyconfigs/easybuild/easyconfigs/o/OpenSSL/OpenSSL-1.1.eb (module: OpenSSL/1.1)
 * [ ] /home/example/easybuild-easyconfigs/easybuild/easyconfigs/d/DB/DB-18.1.40-GCCcore-11.2.0.eb (module: DB/18.1.40-GCCcore-11.2.0)
 * [ ] /tmp/eb-93m2gyhf/tweaked_dep_easyconfigs/Perl-5.32.1-GCCcore-11.2.0.eb (module: Perl/5.32.1-GCCcore-11.2.0)
 * [ ] /tmp/eb-93m2gyhf/tweaked_easyconfigs/BWA-0.7.17-GCC-11.2.0.eb (module: BWA/0.7.17-GCC-11.2.0)
```

!!! note

    The `--try-*` command line options behave as expected when combined with `--robot`.

    For example: a modified toolchain specified via `--try-toolchain` only trickles down until the toolchain level (not deeper).
    This makes for a particularly powerful combo for rebuilding entire software stacks using a different toolchain.

!!! note

    Modifying the software version does **not** trickle down the entire software stack, even when combined with `--robot`,
    since a software version is tied to a particular software package.

## Overview of basic module commands  {: #module_cmds_overview }

In case you are not familiar with using modules, here is a simple cheatsheet of most common module commands used in combination with Easybuild:

*`module avail`* - list the modules that are currently available to load 

*`module load foss/2022a`* - load the module `foss/2022a`

*`module list`* - list currently loaded modules

*`module show foss/2022a`* - see contents of the module `foss/2022a` (shows the module functions instead of executing them)

*`module unload foss/2022a`* - unload the module `foss/2022a`

*`module purge`* - unload all currently loaded modules

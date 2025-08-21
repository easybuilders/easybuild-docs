# Configuring EasyBuild {: #configuring_easybuild }

This page discusses the recommended style of configuring EasyBuild.

See [a demo on configuring EasyBuild][demo_configuring].

## Supported configuration types {: #configuration_types }

Configuring EasyBuild can be done by:

* using `eb` with **command line arguments**
* setting **environment variables** (`$EASYBUILD_...`)
* providing one or more **configuration files**

Of course, combining any of these types of configuration works too (and
is even fairly common).

The order of preference for the different configuration types is as listed above, that is:

* environment variables override the corresponding entries in the configuration file
* command line arguments in turn override the corresponding environment variables *and* matching entries in the
  configuration file


### Consistency across supported configuration types {: #configuration_consistency }

Note that the various available configuration options are handled
**consistently** across the supported configuration types.

For example: to configure EasyBuild to use Lmod as modules tool, the following alternatives are available:

* configuration file entry (key-value assignment):

   ``` ini
   [config]
   modules-tool = Lmod
   ```

* environment variable (upper case, `EASYBUILD_` prefix, `-`'s becomes `_`'s):

   ``` shell
   export EASYBUILD_MODULES_TOOL=Lmod
   ```

* command line argument (long options preceded by `--` and (optionally) using `=`):

   ``` shell
   eb --modules-tool=Lmod
   ```

  or

   ``` shell
   eb --modules-tool Lmod
   ```

For more details w.r.t. each of the supported configuration types, see below.


### Configuration file(s) {: #configuration_file }

#### List of used configuration files {: #list_of_configuration_files }

The list of configuration files that will be used by EasyBuild is determined in the following order of preference:

* the path(s) specified via the **command line argument** `--configfiles`
* the path(s) specified via the `$EASYBUILD_CONFIGFILES` **environment variable**
* the **default paths** for EasyBuild configuration files

#### Default configuration files {: #default_configuration_files }

By default, EasyBuild will use existing configuration files at the following paths:

* `$dir/easybuild.d/*.cfg`, for each directory `$dir` listed in `$XDG_CONFIG_DIRS` (where `$XDG_CONFIG_DIRS`
  defaults to `/etc`)
* `$XDG_CONFIG_HOME/easybuild/config.cfg` (where `$XDG_CONFIG_HOME` defaults to `$HOME/.config`)

Hence, if `$XDG_CONFIG_HOME` and `$XDG_CONFIG_DIRS` are not defined, EasyBuild will only consider default
configuration files at `/etc/easybuild.d/*.cfg` and `$HOME/.config/easybuild/config.cfg`.

The configuration file located in `$XDG_CONFIG_HOME` will be listed *after* the ones obtained via `$XDG_CONFIG_DIRS`,
such that user-defined configuration settings have preference over system defaults.

A detailed overview of the list of default configuration files is available via `eb --show-default-configfiles`. For example:

``` console
$ XDG_CONFIG_DIRS=/tmp/etc:/tmp/moreetc eb --show-default-configfiles
efault list of configuration files:

[with $XDG_CONFIG_HOME: (not set), $XDG_CONFIG_DIRS: /tmp/etc:/tmp/moreetc]

* user-level: ${XDG_CONFIG_HOME:-$HOME/.config}/easybuild/config.cfg
  -> /home/example/.config/easybuild/config.cfg => found
* system-level: ${XDG_CONFIG_DIRS:-/etc}/easybuild.d/*.cfg
  -> {/tmp/etc, /tmp/moreetc}/easybuild.d/*.cfg => /tmp/etc/easybuild.d/config.cfg, /tmp/moreetc/easybuild.d/bar.cfg, /tmp/moreetc/easybuild.d/foo.cfg

Default list of existing configuration files (4): /tmp/etc/easybuild.d/config.cfg, /tmp/moreetc/easybuild.d/bar.cfg, /tmp/moreetc/easybuild.d/foo.cfg, /home/example/.config/easybuild/config.cfg
```

#### Multiple configuration files

If multiple configuration files are listed via a mechanism listed above, the settings in the last
configuration file have preference over the others.

Each available configuration file will be used, and the configuration settings specified in these files
will be retained according to the order of preference as indicated above: settings in configuration files specified via
`--configfiles` override those in configuration files specified via `$EASYBUILD_CONFIGFILES`, which in turns override
settings in default configuration files.

#### Ignored configuration files

On top of this, the `--ignoreconfigfiles` configuration option allows to specify configuration files that should be
*ignored* by EasyBuild (regardless of whether they are specified via any of the options above).


### Configuration file format

The EasyBuild configuration file follows the default Python
configuration format as parsed by the `configparser` module
(see <https://docs.python.org/3/library/configparser.html>).

Configuration files are organized in sections, the section name for a
particular configuration setting is indicated in the output of `eb --help`.
Some examples sections are: `MAIN`, `basic`, `config`,
`informative`, `override`, `regtest`, `software`, `unittest`, etc.

Sections are indicated by specifying the section name in square brackets
on a dedicated line, e.g., `[basic]`.

Configuration settings are specified in a `key = value` or
`key: value` format, **without using quotes for string-like values**.
For boolean configuration settings, values that evaluated to `True`
(e.g., `true`, `1`, …) are all equivalent to enabling the setting.

Comment lines start with a hash character `#` (just like in Python code).

An example configuration file that should make everything clear is shown below.

``` python
[basic]
# always enable logging to stdout
logtostdout = true
[config]
# use Lmod as modules tool
modules-tool: Lmod
# use different default installation path
prefix=/home/you/work/easybuild/
```

#### Templates and constants supported in configuration files {: #configuration_file_templates_constants }

Two types of template values `%(...)s` are supported in configuration files:

* for configuration options defined in the configuration file (and only those)
    * *syntax:* `%(opt)s`, i.e., using the (lowercase) name of the configuration option
* for the default value of selected configuration options (see `eb --avail-cfgfile-constants`)
    * *syntax:* `%(DEFAULT_OPT)s`, i.e., using the uppercase name of the configuration option and prefixed with `DEFAULT_`
  

!!! note
    These template values are only supported in configuration files, *not* in environment variable values or 
    command line option values.

!!! note
    Using an unknown template value, i.e. either one for a configuration option that was not defined in the
    configuration file, or a non-existing one for a particular default value, will result in an error like:
    `ConfigParser.InterpolationMissingOptionError: Bad value substitution`.

#### Example

To include both the (custom) location for the easyconfigs archive repository and the default list of robot search
paths in the active robot search path, the following configuration file entry can be used, featuring the template
for the `repositorypath` configuration option and the provided `DEFAULT_ROBOT_PATHS` constant::

``` ini
[basic]
repositorypath = /home/example/easybuild/easyconfigs_archive
robot-paths = %(repositorypath)s:%(DEFAULT_ROBOT_PATHS)s
```

See also [Controlling the robot search path][controlling_robot_search_path].

#### Generating a template configuration file

A command line option `--confighelp` is
available that prints out the help text as an annotated configuration
file. This can be used as an empty template configuration file:

``` shell
mkdir -p $HOME/.config/easybuild
eb --confighelp > $HOME/.config/easybuild/config.cfg
```

``` console
$ head $HOME/.easybuild/config.cfg
[MAIN]
# Enable debug log mode (def False)
#debug=
# Enable info log mode (def False)
#info=
# Enable info quiet/warning mode (def False)
#quiet=

[basic]
# Print build overview incl. dependencies (full paths) (def False)
```

### Environment variables {: #configuration_env_vars }

All configuration settings listed as long options in `eb --help` can
also be specified via `EASYBUILD_`-prefixed environment variables.

Configuration settings specified this way always override the
corresponding setting specified in a configuration file.

For example, to enable debug logging using an environment variable:

``` shell
export EASYBUILD_DEBUG=1
```

More examples of using environment variables to configure EasyBuild are
shown in the sections below.

!!! tip
    Any configuration option of EasyBuild which can be tuned by command line
    or via the configuration file, can also be tuned via a corresponding environment variable.

!!! note
    If any `$EASYBUILD`-prefixed environment variables are defined that do not correspond to a known
    configuration option, EasyBuild will report an error message and exit.


### Command line arguments {: #configuration_cmdline }

The configuration type with the highest precedence are the `eb`
command line arguments, which override settings specified through environment variables or in configuration files.

For some configuration options, both short and long command line
arguments are available (see `eb --help`); the long options indicate
how the configuration setting should be specified in a configuration file
or via an environment variable (`$EASYBUILD_<LONGOPTION>`).

For boolean configuration settings, both the `--<option>` and
`--disable-<option>` variants are always available.

Examples (more below):

* enable debug logging (long option) and logging to stdout (short option)

   ``` shell
   eb --debug -l ...
   ```

* use `/dev/shm` as build path, install to temporary install path, disable debug logging

   ``` shell
   eb --buildpath=/dev/shm --installpath=/tmp/$USER --disable-debug ...
   ```

## Overview of current configuration {: #configuration_show_config }

*(`--show-config`, `--show-full-config`)*

To get an overview of the current EasyBuild configuration across all configuration types,
you can use `eb --show-config`.

The output will specify:

* any configuration setting for which the current value is different from the default value 
* a couple of selected important configuration settings (even if they are still set to the default value), i.e.:
    * [build path][buildpath]
    * [install path][installpath]
    * [path to easyconfigs repository][easyconfigs_repo]
    * [the robot search path][robot_search_path]
    * [source path][sourcepath]
* through which configuration type each setting was defined
    * i.e., default value, configuration file, environment variable or command line argument

Example output

``` console
$ cat $HOME/.config/easybuild/config.cfg
[config]
buildpath = /tmp/eb-build
    
$ export EASYBUILD_MODULES_TOOL=Lmod
$ export EASYBUILD_OPTARCH=''

$ eb --show-config --installpath=$HOME/apps --job-cores=4
#
# Current EasyBuild configuration
# (C: command line argument, D: default value, E: environment variable, F: configuration file)
#
buildpath      (F) = /tmp/eb-build
installpath    (C) = /Users/example/apps
job-cores      (C) = 4
modules-tool   (E) = Lmod
optarch        (E) = ''
repositorypath (D) = /Users/example/.local/easybuild/ebfiles_repo
robot-paths    (D) = /Users/example/easybuild-easyconfigs/easybuild/easyconfigs
sourcepath     (D) = /Users/example/.local/easybuild/sources
```

For a full overview of the current configuration, including *all* configuration settings,
see `eb --show-full-config`.

## Available configuration settings {: #configuration_available_settings }

To obtain a full and up-to-date list of available configuration
settings, see `eb --help`. We refrain from listing all available configuration settings here, to avoid outdated documentation.

A couple of selected configuration settings are discussed below,
in particular the mandatory settings.


### Important configuration settings {: #important_configuration_settings }

#### Source path (`--sourcepath`) {: #sourcepath }

*default*: `$HOME/.local/easybuild/sources/` (determined via [Overall prefix path (`--prefix`)][prefix])

The `sourcepath` configuration setting specifies the parent path of
the directory in which EasyBuild looks for software source and install files.

Looking for the files specified via the `sources` parameter in the .eb
easyconfig file is done in the following order of preference:

* `<sourcepath>/<name>`: a subdirectory determined by the name of the software package
* `<sourcepath>/<letter>/<name>`:  in the style of the `easyblocks`/`easyconfigs` directories: in a
  subdirectory determined by the first letter (in lower case) of the software package and by its full `name`
* `<sourcepath>`: directly in the source path

Note that these locations are also used when EasyBuild looks for patch
files in addition to the various `easybuild/easyconfigs` directories that are listed in the $PYTHONPATH.

You can specify multiple paths, separated with `:`, in which EasyBuild will look for sources, but only the first one
will be used for downloading, so one needs to make sure at least the first path is writable by the user invoking `eb`.


#### Build path (`--buildpath`) {: #buildpath }

*default*: `$HOME/.local/easybuild/build/` (determined via [Overall prefix path (`--prefix`)][prefix])

The `buildpath` configuration setting specifies the parent path of the
(temporary) directories in which EasyBuild builds its software packages.

Each software package is (by default) built in a subdirectory of the
specified `buildpath` under
`<name>/<version>/<toolchain><versionsuffix>`.

Note that the build directories are emptied and removed by EasyBuild
when the installation is completed (by default).

!!! tip
    Using `/dev/shm` as build path can significantly speed up builds,
    if it is available and provides a sufficient amount of space. Setting up
    the variable `EASYBUILD_BUILDPATH` in your shell startup files makes this default.
    However be aware that multiple parallel builds may fill up `/dev/shm` !


#### Software and modules install path {: #installpath }

*(`--installpath`, `--installpath-software`, `--installpath-modules`)*

defaults:

* *software install path:* `$HOME/.local/easybuild/software`  (determined via [Overall prefix path (`--prefix`)][prefix] and `--subdir-software`)
* *modules install path:* `$HOME/.local/easybuild/modules/all`  (determined via [Overall prefix path (`--prefix`)][prefix],
  `--subdir-modules` and `--suffix-modules-path`)

There are several ways in which the software and modules install path used by EasyBuild can be configured:

* using the direct configuration options `--installpath-software` and `--installpath-modules` (see below)
* via the parent install path configuration option `--installpath` (see below)
* via the overall prefix path configuration option `--prefix` (see [Overall prefix path (`--prefix`)][prefix])


##### Direct options {: #installpath_direct_options }

*(`--installpath-software` and `--installpath-modules`)*

*default*: *(no default specified)*

The `--installpath-software` and `--installpath-modules` configuration options (available since EasyBuild v2.1.0)
allow to directly specify the software and modules install paths, respectively.

These configuration options have precedence over all of the other configuration options that relate to specifying the
install path for software and/or modules (see below).


##### Parent install path: `--installpath` {: #parent_installpath }

*default*: *(no default specified)*

The `--installpath` configuration option specifies the *parent* path of
the directories in which EasyBuild should install software packages and the
corresponding module files.

The install path for software and modules specifically is determined by combining `--installpath` with
`--subdir-software`, and combining `--installpath` with `--subdir-modules` and `--suffix-modules-path`,
respectively.

For more information on these companion configuration options, see
[Software and modules install path subdirectories (`--subdir-software`, `--subdir-modules`, `--suffix-modules-path`)][installpath_subdirs].

##### Full install path for software and module file

The full software and module install paths for a particular software package are determined by the active
module naming scheme along with the general software and modules install paths specified by the EasyBuild configuration.

Both the software itself and the corresponding module file will be installed in a subdirectory of the corresponding
install path named according to the active module naming scheme (default format:
`<name>/<version>-<toolchain><versionsuffix>`).
Additionally, symlinks to the actual module file are installed in a subdirectory of the modules install path
named according to the value of the `moduleclass` easyconfig parameter.

For more information on the module naming scheme used by EasyBuild, see
[Active module naming scheme (`--module-naming-scheme`)][module_naming_scheme].

##### Updating `$MODULEPATH`

To make the modules generated by EasyBuild available, the `$MODULEPATH` environment variable must be updated
to include the modules install path.

The recommended way to do this is to use the `module use` command.
For example:

``` shell
eb --installpath=$HOME/easybuild
module use $HOME/easybuild/modules/all
```

It is probably a good idea to add this to your (favourite) shell
`.rc` file, e.g., `~/.bashrc`, and/or the `~/.profile` login scripts,
so you do not need to adjust `$MODULEPATH` every time you start a new session.

!!! note
    Updating `$MODULEPATH` is not required for EasyBuild itself, since `eb` updates `$MODULEPATH` itself at
    runtime according to the modules install path it is configured with.



### Optional configuration settings {: #configuration_optional_settings }

The subsections below discuss a couple of commonly used optional configuration settings.

#### Overall prefix path (`--prefix`) {: #prefix }

*default:* `$HOME/.local/easybuild`

The overall prefix path used by EasyBuild can be specified using the `--prefix` configuration option.

This affects the default value of several configuration options:

* [source path][sourcepath]
* [build path][buildpath]
* [software and modules install path][installpath]
* [easyconfigs repository path][easyconfigs_repo]
* [package path][packaging_config]
* [container path][containers_cfg_path]


#### Software and modules install path subdirectories {: #installpath_subdirs }

*(`--subdir-software`, `--subdir-modules`, `--suffix-modules-path`)*

*defaults*:

* *software install path subdirectory* (`--subdir-software`): `software`
* *modules install path subdirectory* (`--subdir-modules`): `modules`
* *modules install path suffix* (`--suffix-modules-path`): `all`

The subdirectories for the software and modules install paths (relative to `--installpath`, see [install path][installpath])
can be specified using the corresponding dedicated configuration options (available since EasyBuild v1.14.0).

For example:

``` shell
export EASYBUILD_SUBDIR_SOFTWARE=installs
eb --installpath=$HOME/easybuild --subdir-modules=module_files ...
```


#### Modules tool (`--modules-tool`) {: #modules_tool }

*default*: `Lmod`

Specifying the modules tool that should be used by EasyBuild can be
done using the `modules-tool` configuration setting.
A list of supported modules tools can be obtained using `eb --avail-modules-tools`.

Currently, the following modules tools are supported:

* `Lmod` *(default)*: Lmod, an alternative to Environment Modules, written in Lua (`lmod`)
* `EnvironmentModules`: Environment Modules, written in Tcl (`modulecmd.tcl`)

You can determine which modules tool you are using by checking the
output of `type -f module` (in a `bash` shell), or `alias module` (in a `tcsh` shell).

The actual module command (i.e., `modulecmd.tcl`, `lmod`, ...) must be
available via `$PATH` (which is not standard) or:

* when using Lmod, the `lmod` binary can also be located via `$LMOD_CMD`
* when using Environment Modules, the `modulecmd.tcl` binary can also be
  located via `$MODULES_CMD`

For example, to indicate that EasyBuild should be using `Lmod` as modules tool:

``` shell
eb --modules-tool=Lmod ...
```


#### Active module naming scheme (`--module-naming-scheme`) {: #module_naming_scheme }

*default*: `EasyBuildModuleNamingScheme`

The module naming scheme that should be used by EasyBuild can be
specified using the `module-naming-scheme` configuration setting.

``` shell
eb --module-naming-scheme=HierarchicalMNS ...
```

For more details, see the dedicated page on
[using a custom module naming scheme](https://github.com/easybuilders/easybuild/wiki/Using-a-custom-module-naming-scheme).


#### Module files syntax (`--module-syntax`) {: #module_syntax }

*default*: `Lua`

*supported since*: EasyBuild v2.1

The syntax to use for generated module files can be specified using the `--module-syntax` configuration setting.

Possible values are:

* `Lua`: generate module files in Lua syntax
    * this requires the use of Lmod as a modules tool to consume the module files (see [modules tool][modules_tool])
    * module file names will have the `.lua` extension
* `Tcl`: generate module files in Tcl syntax
    * Tcl module files can be consumed by all supported modules tools
    * module files will contain a header string `#%Module` indicating that they are composed in Tcl syntax

!!! note
    Lmod is able to deal with having module files in place in both Tcl and Lua syntax. When a module file in Lua
    syntax (i.e., with a `.lua` file name extension) is available, a Tcl module file with the same name will be
    ignored. Environment Modules tool will simply ignore module files in Lua syntax, since they do not
    contain the header string that is included in Tcl module files.

!!! note
    Using module files in Lua syntax has the advantage that Lmod does not need to translate from Lua to Tcl internally
    when processing the module files, which benefits responsiveness of Lmod when used interactively by users. In terms
    of Lmod-specific aspects of module files, the syntax of the module file does *not* matter; Lmod-specific statements
    supported by EasyBuild can be included in Tcl module files as well, by guarding them by a condition that only
    evaluates positively when Lmod is consuming the module file, i.e.
    '`if { [ string match "*tcl2lua.tcl" $env(_) ] } { ... }`'. Only conditional load statements like
    '`load(atleast("gcc","4.8"))`' can only be used in Lua module files.


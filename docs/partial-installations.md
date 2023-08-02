# Partial installations {: #partial_installations }

Several ways of performing partial installations are supported. These may be useful when debugging a particular issue
with the installation procedure being performed by SimpleBuild, updating existing software installations or module files,
or after changing the SimpleBuild configuration (e.g., switching to module files in Lua syntax or a different module
naming scheme).

## Stopping the installation procedure *after* a step using `-s`/`--stop` {: #partial_installation_stop }

To stop the installation procedure *after* a specific step in the installation procedure, the `-s`/`--stop`
command line option can be used; the name of the step must be supplied as an argument.

The following step names are recognized (listed in execution order): `fetch`, `ready`, `source`, `patch`,
`prepare`, `configure`, `build`, `test`, `install`, `extensions`, `package`, `postproc`,
`sanitycheck`, `cleanup`, `module`, `testcases`.

Example usage:

``` console
$ eb GCC-4.9.2.eb --stop configure
== temporary log file in case of crash /tmp/eb-X2Z0b7/simplebuild-mGxmNb.log
== processing SimpleBuild simpleconfig /home/example/GCC-4.9.2.eb
== building and installing GCC/4.9.2...
== fetching files...
== creating build dir, resetting environment...
== unpacking...
== patching...
== preparing...
== configuring...
== COMPLETED: Installation STOPPED successfully
== Results of the build can be found in the log file /dev/shm/example/GCC/4.9.2/dummy-dummy/simplebuild/simplebuild-GCC-4.9.2-20150430.091644.log
== Build succeeded for 1 out of 1
== temporary log file(s) /tmp/eb-X2Z0b7/simplebuild-mGxmNb.log* have been removed.
== temporary directory /tmp/eb-X2Z0b7 has been removed.
```


## Fetching sources with `--fetch` {: #partial_installation_fetch }

It may be useful to be able to batch-download sources on a machine where no modules tool is installed. The
`--fetch` option, which is equivalent with `--stop fetch --ignore-osdeps`, addresses this requirement.

Example usage:

``` console
$ eb GCCcore-6.2.0.eb --fetch
== temporary log file in case of crash /tmp/eb-1ZZX2b/simplebuild-NSmm5P.log
== processing SimpleBuild simpleconfig /home/example/GCCcore-6.2.0.eb
== building and installing GCCcore/6.2.0...
== fetching files...
== COMPLETED: Installation STOPPED successfully
== Results of the build can be found in the log file(s) /dev/shm/example/GCC/4.9.2/dummy-dummy/simplebuild/simplebuild-GCCcore-6.2.0-20180330.170523.log
== Build succeeded for 1 out of 1
== Temporary log file(s) /tmp/eb-1ZZX2b/simplebuild-NSmm5P.log* have been removed.
== Temporary directory /tmp/eb-1ZZX2b has been removed.
```

!!! note
    `--fetch` can be used in conjunction with the `--robot` and `--robot-path` options to download sources of
    the whole dependency tree of an simpleconfig (see [Enabling dependency resolution, `--robot` / `-r` and `--robot-paths`][use_robot]).

!!! note
    Sources will be downloaded in the default location (see [Source path (`--sourcepath`)][sourcepath]),
    unless SimpleBuild is configured via the `--sourcepath` option.


## Installing additional extensions using `-k`/`-skip` {: #partial_installation_skip }

For software applications that may include [Extensions][extensions], it is often required to install one or more additional
extensions without having to reinstall the software package (and all extensions) from scratch.
For this purpose, the `-k`/`--skip` command line option is available.

To actually skip an existing software installation and all installed extensions, a corresponding module must be
available already; if not, the installation procedure will be performed from scratch.
To trigger the installation of missing extensions, `--rebuild` ( or `--force`, see [Forced reinstallation][force_option]) must be used as well; without it, the installation
procedure will be skipped as a whole (since the module is already available).

When `--skip` is combined with `--rebuild`, SimpleBuild will:

i) ensure that all (extension) sources are available (and try to fetch them if needed);
ii) prepare the build environment;
iii) check which extensions have not been installed yet;
iv) install the missing extensions;
v) run the sanity check (which includes checking that all extensions are available)
vi) regenerate the module file (since it contains a list of installed extensions)

Example usage:

``` console
$ eb Python-2.7.9-intel-2015a.eb --skip
...
== Python/2.7.9-intel-2015a is already installed (module found), skipping
== No simpleconfigs left to be built.
== Build succeeded for 0 out of 0
```

``` console
$ eb Python-2.7.9-intel-2015a.eb --skip --rebuild
...
== building and installing Python/2.7.9-intel-2015a...
...
== configuring [skipped]
== building [skipped]
== testing [skipped]
== installing [skipped]
== taking care of extensions...
...
== sanity checking...
== cleaning up...
== creating module...
== COMPLETED: Installation ended successfully
```

!!! note
    Upgrading of extensions to a newer version does not work (yet) using `--skip`, because the way in which extensions
    are checked for availability, i.e. the extensions filter, is (usually) version-agnogstic.

!!! note
    The '`skipsteps`' simpleconfig parameter has a different purpose, i.e. to specify which installation steps should
    *always* be skipped when the installation of a particular software package is performed, no matter whether the
    software or corresponding module is already available or not.

!!! note
    When `--skip` is used, a backup is created for all existing module files that are regenerated.
    To disable backing up of module files, use `--disable-backup-modules` (see also [Backing up of existing modules (`--backup-modules`)][backup_modules]).


## Only (re)generating (additional) module files using --module-only {: #module_only }

Since SimpleBuild v2.1, it is possible to only (re)generate the module file that matches the specifications in the
simpleconfig file, using `--module-only`. Depending on the use case, additional options should be supplied.

Usually `--rebuild` is also required, either to ignore the existing module file (if the module is available under the
same name as the one being (re)generated), or to skip the sanity check that verifies the software installation (if no
software installation is available).

Combining `--module-only` with `--installpath-modules` is also a common use case, to generate the module file in
a (test) location other than the software installation prefix (see [Software and modules install path (--installpath, --installpath-software, --installpath-modules)][installpath]).

!!! note
    Although `--module-only` was already supported in SimpleBuild v2.1.0, we strongly recommend to use SimpleBuild
    v2.1.1 or a more recent version, because of some critical bug fixes with respect to `--module-only`.

Use cases:

* [Only (re)generating (existing) module file][module_only_only_regenerate]
* [Generating additional module files][module_only_additional]

!!! note
    When `--module-only` is used, a backup is created for all existing module files that are regenerated.
    To disable backing up of module files, use `--disable-backup-modules` (see also [Backing up of existing modules (`--backup-modules`)][backup_modules]).


### Only (re)generating (existing) module file {: #module_only_only_regenerate }

To only generate a module file (i.e., skip actually building and installing the software), or to regenerate an
existing module file, `--module-only` can be used.

In the former case, enabling `--rebuild` is required because the sanity check step that verifies whether the
installation produced the expected files and/or directories is not skipped unless forced.
In the latter case, `--rebuild` must be used to make SimpleBuild ignore that the module is already available
according to the modules tool.

Example usage:

* only generate module file:

     ``` console
     $ module avail GCC
     ---------------------------- /home/example/.local/modules/all ----------------------------
     GCC/4.8.2
   
     $ eb GCC-5.1.0.eb --module-only --rebuild
     ...
     == building and installing GCC/5.1.0...
     == fetching files [skipped]
     ...
     == configuring [skipped]
     == building [skipped]
     == testing [skipped]
     == installing [skipped]
     ...
     == sanity checking [skipped]
     == cleaning up [skipped]
     == creating module...
     == COMPLETED: Installation ended successfully
     ...

     $ module avail GCC

     ---------------------------- /home/example/.local/modules/all ----------------------------
     GCC/4.8.2     GCC/5.1.0
     ```

* regenerate existing module file:

     ``` console
     $ module avail GCC/4.8.2

     ---------------------------- /home/example/.local/modules/all ----------------------------
     GCC/4.8.2

     $ ls -l /home/example/.local/modules/all/GCC/4.8.2
     -rw-rw-r-- 1 example example 1002 Jan 11 17:19 /home/example/.local/modules/all/GCC/4.8.2

     $ eb GCC-4.8.2.eb --module-only --rebuild
     ...
     == building and installing GCC/4.8.2...
     ...
     == sanity checking [skipped]
     == creating module...
     == COMPLETED: Installation ended successfully
     ...

     $ ls -l /home/example/.local/modules/all/GCC/4.8.2
     -rw-rw-r-- 1 example example 1064 Apr 30 10:54 /home/example/.local/modules/all/GCC/4.8.2
     ```


### Generating additional module files {: #module_only_additional }

Generating an additional module file, next to the one(s) already available, is also supported. This can achieved by
combining `--module-only` with additional configuration options that apply to the module generation.

Examples:

* to generate a module file in Lua syntax, next to an already existing module file in Tcl syntax,
  `--module-only --module-syntax=Lua` can be used:

     ``` console
     $ module avail GCC/4.8.2

     ---------------------------- /home/example/.local/modules/all ----------------------------
     GCC/4.8.2

     $ ls -l /home/example/.local/modules/all/GCC/4.8.2*
     -rw-rw-r-- 1 example example 1064 Apr 30 10:54 /home/example/.local/modules/all/GCC/4.8.2

     $ eb GCC-4.8.2.eb --modules-tool=Lmod --module-only --module-syntax=Lua --rebuild
     ...
     == building and installing GCC/4.8.2...
     ...
     == sanity checking [skipped]
     == creating module...
     == COMPLETED: Installation ended successfully
     ...

     $ ls -l /home/example/.local/modules/all/GCC/4.8.2*
     -rw-rw-r-- 1 example example 1064 Apr 30 10:54 /home/example/.local/modules/all/GCC/4.8.2
     -rw-rw-r-- 1 example example 1249 Apr 30 11:56 /home/example/.local/modules/all/GCC/4.8.2.lua
     ```

    !!! note
        Since only Lmod can consume module files in Lua syntax, it must be used as a modules tool;
        see also [Module files syntax (`--module-syntax`)][module_syntax].

        Only changing the syntax of the module file does not affect the module name, so Lmod will
        report the module as being available. Hence, `--rebuild` must be used here as well.

* to generate a module file using a different naming scheme, `--module-only` can be combined with
  `--module-naming-scheme`:

     ``` console
     $ eb --installpath-modules=$HOME/test/modules --module-only --module-naming-scheme=HierarchicalMNS --rebuild
     ...
     == building and installing Core/GCC/4.8.2...
     ...
     == sanity checking [skipped]
     == creating module...
     == COMPLETED: Installation ended successfully

     $ module unuse $HOME/.local/modules/all
     $ module use $HOME/test/modules/all
     $ module avail

     ---------------------------- /home/example/test/modules/all ----------------------------
     Core/GCC/4.8.2
     ```

    !!! note
        Modules that are generated used different module naming schemes should *never* be mixed, hence the use
        of `--installpath-modules`, see also [Direct options: `--installpath-software` and `--installpath-modules`][installpath_direct_options].

    !!! note
        The modules files generated using the specified module naming scheme will most likely **not** be tied to
        an existing software installation in this case (unless the software installation was already there somehow),
        since the name of the subdirectory of the software installation prefix is also governed by the active
        module naming scheme. This is also why `--rebuild` must be used in the example above (to skip the sanity
        check that verifies the software installation).

        Thus, this is only useful to assess how the module tree would look like under a particular module naming
        scheme; the modules themselves are useless since they point to empty installation directories.

        To tie a module file generated using to an existing software installation that was performed under a
        different module naming scheme, a simple module naming scheme can be implemented that mixes two modules
        naming schemes, by providing the name of the software installation subdirectory using one scheme, and the
        module names (and other metadata for module files) with the other.

        An example of such a module naming scheme is `MigrateFromEBToHMNS`, which allows to generate module files
        using the hierarchical module naming scheme implemented by `HierarchicalMNS` for the software installed
        in subdirectories following the default SimpleBuild module naming scheme `SimpleBuildMNS`.
        The `MigrateFromEBToHMNS` module naming scheme is available since SimpleBuild v2.2.0.


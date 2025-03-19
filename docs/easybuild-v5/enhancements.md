# Enhancements in EasyBuild v5.0

*(for a full overview of changes in EasyBuild v5.0, see [here](index.md))*

Various significant enhancements are included in EasyBuild v5.0, including:

- [New function to run shell commands: `run_shell_cmd`][run_shell_cmd]
- [Interactive debugging of failing shell commands via `env.sh` and `cmd.sh` scripts][interactive-debugging-failing-shell-commands]
- [Mark support for installing extensions in parallel as stable (no longer experimental)][parallel-extensions-install-stable]
- [Mark easystack support as stable (no longer experimental)][easystack-stable]
- [Reproducible tarballs for sources created via `git_config`][reproducible-tarballs-git_config]
- [Granular exit codes][granular-exit-codes]
- [Copy build directory and/or log file(s) if installation failed to path specified via `--failed-install-build-dirs-path` or `--failed-install-logs-path`][copy-build-log-failed-installs]
- [Specify changes that should be made by generated module files via `module_load_environment`][module-load-environment]
- [Add support for alternate easyconfig parameters/templates/constants][alternative-easyconfig-parameters-templates-constants]
- [`keep-debug-symbols` configuration option to set default value of '`debug`' toolchain option][keep-debug-symbols]
- [Provide control over how generated modules update search path for header files (via `--module-search-path-headers`)][module-search-path-headers]
- [Provide control over how EasyBuild specifies path to header files during installation (via `--search-path-cpp-headers`)][search-path-cpp-headers]
- [Provide control over how EasyBuild specifies path to libraries during installation (via `--search-path-linker`)][search-path-linker]
- [Support not using `$PYTHONPATH` to specify the location of installed Python packages (via `--prefer-python-search-path`)][PYTHONPATH-vs-EBPYTHONPREFIXES]
- [Detect Fortran `.mod` files in `GCCcore` installations][mod-files]
- [Let `ConfigureMake` generic easyblock error out on unknown `configure` options][configuremake-unknown-configure-options]

---

## New function to run shell commands: `run_shell_cmd` { : #run_shell_cmd }

See dedicated page on the new [`run_shell_cmd` function](run_shell_cmd.md).

---

## Interactive debugging of failing shell commands via `env.sh` and `cmd.sh` scripts {: #interactive-debugging-failing-shell-commands }


See [dedicated page](../interactive-debugging-failing-shell-commands.md).

---

## Granular exit codes { : #granular-exit-codes }

EasyBuild v5 now uses a range of ~50 exit codes instead of just 0 for normal
termination and 1 for unexpected termination. Each non-zero exit code
correlates to the specific type of error or failure that caused the
termination of the program. For instance, a missing easyconfig or a failed
checksum check. The full list of exit codes is defined in the class
[easybuild.tools.build_log.EasyBuildExit](https://github.com/easybuilders/easybuild-framework/blob/main/easybuild/tools/build_log.py#L74).

EasyBuild will always return its own exit codes on termination. Other exit
codes from external processes executed through `run_shell_cmd` or HTTP response
status codes are reported in the corresponding logs.

---

## Mark support for installing extensions in parallel as stable (no longer experimental) {: #parallel-extensions-install-stable }

*(more info soon)*

---


## Mark easystack support as stable (no longer experimental) {: #easystack-stable }

*(more info soon)*

---


## Reproducible tarballs for sources created via `git_config` { : #reproducible-tarballs-git_config }

EasyBuild can now generate reproducible tarballs of sources cloned from Git
repositories. This means that easyconfigs with sources using the `git_config`
option can now have consistent contents across different systems and across
time, allowing to reliably validate them with checksums.

EasyBuild follows the [archival guidelines from reproducible-builds.org](https://reproducible-builds.org/docs/archives/) 
to generate reproducible tarballs. The new method to create archives in
EasyBuild 5.0 is fully implemented in Python, which removes our dependency on
external tools such as [GNU Tar](https://www.gnu.org/software/tar/) or file
compressors for this task. However, extraction of archives continues to work
by executing external commands on the host system.

Reproducible tarballs have the following restrictions:

- Sources cloned with `keep_git_dir` enabled cannot be archived in a
reproducible manner. Including the `.git` folder in the sources is inherently
time-dependent as it contains information about the clone action itself, which
hinders the creation of a reproducible tarball. Hence, EasyBuild 5.0 will
create the archive of sources with `keep_git_dir`, but their checksums cannot
be validated across systems.

- Reproducible archives are supported in uncompressed TAR format (`.tar`) or
for tarballs compressed with [XZ compression](https://en.wikipedia.org/wiki/XZ_Utils)
(`.tar.zx`). The wide-spread [GZip compression](https://en.wikipedia.org/wiki/Gzip)
is not currently supported because its implementation injects metadata in the
compressed archive that is time dependent.

- Systems running EasyBuild with Python < 3.9 will skip checksum validation for
sources from Git repos. Due to changes in the low-level code of the `tarfile`
module in the Python base distribution, tarballs generated before version 3.9
result in archives with different contents than those generated in Python 3.9+.

Easyconfigs found in the repository of EasyBuild that contain sources from Git
repos without `keep_git_dir` have already been updated to use reproducible
tarballs. Archives will be created in `.tar.xz` format and checksums will be
validated on Python 3.9+. Therefore, beware that EasyBuild 5.0 might generate
new archives for sources that were already cloned in your system due to this
changes in format.

---

## Copy build directory and/or log file(s) if installation failed to path specified via `--failed-install-build-dirs-path` or `--failed-install-logs-path` {: #copy-build-log-failed-installs }

*(more info soon)*

---


## Specify changes that should be made by generated module files via `module_load_environment` {: #module-load-environment }

See [separate dedicated section](../implementing-easyblocks.md#module_load_environment).

---

## Add support for alternate easyconfig parameters/templates/constants {: #alternative-easyconfig-parameters-templates-constants }

*(more info soon)*

---


## `keep-debug-symbols` configuration option to set default value of '`debug`' toolchain option {: #keep-debug-symbols }

*(more info soon)*

---

## Provide control over how generated modules update search path for header files (via `--module-search-path-headers`) { : #module-search-path-headers }

EasyBuild 5.0 introduces a new option called `--module-search-path-headers`.
This option can be used to select which environment variables will be injected
in modules generated by EasyBuild to define search paths to C/C++ header files
or Fortran MOD files, which are commonly found in `include` directories.

Available settings follow what is supported by current versions of C/C++ and
Fortran compilers from GNU and Intel, which all support the
[environment variables defined by GNU C Pre-Processor](https://gcc.gnu.org/onlinedocs/cpp/Environment-Variables.html):

- `cpath` (default): This is the traditional mode of operation of EasyBuild.
Module files generated by EasyBuild 5.0 continue to prepend search paths to
headers to the `CPATH` environment variable by default. The `CPATH` environment
variable has a high precedence, only surpassed by explicit `-I` options in the
compilation command. 

- `include_paths`: Module files generated by EasyBuild 5.0 will prepend search
paths to headers to the environment variables `C_INCLUDE_PATH`,
`CPLUS_INCLUDE_PATH` and `OBJC_INCLUDE_PATH`. These three environment variables
have lower precedence than `CPATH` and the paths defined in the option
`-isystem`. Therefore, this setting is useful for software providing include
folders that could collide with those from other loaded modules.

This option is also available as easyconfig parameter
`module_search_path_headers`. Which has precedence over the global
`--module-search-path-headers` build option.

The Easyconfig parameter `modextrapaths` has a new special key called
`MODULE_LOAD_ENV_HEADERS` that allows to add search paths in the generated
module according to `--module-search-path-headers`.

```python
modextrapaths = {
    MODULE_LOAD_ENV_HEADERS: 'include/extra_dir',
}
```

Adding search paths explicitly to `CPATH` or any other environment variable by
name continues to work as usual in EasyBuild 5.0.

---

## Provide control over how EasyBuild specifies path to header files during installation (via `--search-path-cpp-headers`) { : #search-path-cpp-headers}

EasyBuild 5.0 introduces a new option called `--search-path-cpp-headers`
that controls the method used at build time to pass search paths to `include`
directories to the compiler.

Available settings follow what is supported by current versions of C/C++ and
Fortran compilers from GNU and Intel, which all support the
[environment variables defined by GNU C Pre-Processor](https://gcc.gnu.org/onlinedocs/cpp/Environment-Variables.html):

- `flags` (default): EasyBuild sets the environment variable `CPPFLAGS` in the
build environment with the list of paths to include directories as `-I`
options. Passing search paths through `CPPFLAGS` has the highest precedence as
[GNU Make](https://www.gnu.org/software/make/) will inject its contents
directly in the preprocessor and compiler commands. Hence, this method
minimizes the risk that the build process could be perturbed by the environment
of the host system. This is the traditional mode of operation of EasyBuild.

- `cpath`: EasyBuild adds search paths to `include` directories to the
environment variable `CPATH` in the build environment. This option has less
precedence than the `-I` options injected by `flags`, but still has more
precedence than any other option.

- `include_paths`: EasyBuild adds search paths to `include` directories to the
environment variables `C_INCLUDE_PATH`, `CPLUS_INCLUDE_PATH` and
`OBJC_INCLUDE_PATH` in the build environment. These three environment variables
have lower precedence than the `-I` options or `CPATH`. Therefore, this setting
is advisable for builds needing minor perturbations to their own build settings
and those defined by the loaded modules.

Search paths added by EasyBuild at build time are independent to those that
might be defined by the modules of loaded dependencies. EasyBuild will generate
a new list of search paths from scratch to existing include directories in
installations of loaded dependencies. This approach improves the resilience of
the build by detaching the build process from modifications done by modules to
the environment. Nonetheless, changes to the environment made by loaded modules
still come into play, but with less precedence by default.

This option is also available as easyconfig parameter
`search_path_cpp_headers`. Which has precedence over the global
`--search-path-cpp-headers` build option.

---

## Provide control over how EasyBuild specifies path to libraries during installation (via `--search-path-linker`) { : #search-path-linker }

EasyBuild 5.0 introduces a new option called `--search-path-linker`
that controls the method used at build time to pass search paths to libraries
to the linker.

Available settings:

- `flags` (default): EasyBuild sets the environment variable `LDFLAGS` in the
build environment with the list of search paths to libraries as `-L` options.
Passing search paths through `LDFLAGS` has the highest precedence as
[GNU Make](https://www.gnu.org/software/make/) will inject its contents
directly in the linker and compiler commands. Hence, this method
minimizes the risk that the build process could be perturbed by the environment
of the host system. This is the traditional mode of operation of EasyBuild.

- `cpath`: EasyBuild adds search paths to libraries to the environment variable
[LIBRARY_PATH](https://gcc.gnu.org/onlinedocs/gcc/Environment-Variables.html#index-LIBRARY_005fPATH)
in the build environment. This option has less precedence than the `-L` options
injected by `flags`.

Search paths added by EasyBuild at build time are independent to those that
might be defined by the modules of loaded dependencies. EasyBuild will generate
a new list of search paths from scratch to existing library sub-directories in
installations of loaded dependencies. This approach improves the resilience of
the build by detaching the build process from modifications done by modules to
the environment. Nonetheless, changes to the environment made by loaded modules
still come into play, but with less precedence by default.

This option is also available as easyconfig parameter
`search_path_linker`. Which has precedence over the global
`--search-path-linker` build option.

---

## Support not using `$PYTHONPATH` to specify the location of installed Python packages (via `--prefer-python-search-path`) { : #PYTHONPATH-vs-EBPYTHONPREFIXES }

*(more info soon)*

---

## Let `ConfigureMake` generic easyblock error out on unrecognized `configure` options { : #configuremake-unrecognized-configure-options }

*(more info soon)*

---

## Detect Fortran `.mod` files in `GCCcore` installations { : #mod-files }

Fortran `.mod` files should not be mixed between compilers. As `GCCcore` installed software is
available for use by software installed with other compilers, such as the Intel Fortran compiler,
this means that software that produces Fortran `.mod` files should not be at the `GCCcore` level.

By default `.mod` there will be a warning if `.mod` files are detected. This can be changed to a
build failure with the command line option `--fail-on-mod-files-gcccore`.

If the software uses the `.mod` extension for a different type of file then the EasyConfig variable
`skip_mod_files_sanity_check` can be set to mark that this use is expected.

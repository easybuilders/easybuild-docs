# Enhancements in EasyBuild v5.0

*(for a full overview of changes in EasyBuild v5.0, see [here](index.md))*

Various significant enhancements are included in EasyBuild v5.0, including:

- [New function to run shell commands: `run_shell_cmd`][run_shell_cmd]
- [Interactive debugging of failing shell commands via `env.sh` and `cmd.sh` scripts][interactive-debugging-failing-shell-commands]
- [Don't raise error when required extensions are not found when installing extensions in parallel][parallel-extensions-install]
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

## Don't raise error when required extensions are not found when installing extensions in parallel {: #parallel-extensions-install }

*(more info soon)*

---


## Mark support for installing extensions in parallel as stable (no longer experimental) {: #parallel-extensions-install-stable }

*(more info soon)*

---


## Mark easystack support as stable (no longer experimental) {: #easystack-stable }

*(more info soon)*

---


## Reproducible tarballs for sources created via `git_config` { : #reproducible-tarballs-git_config }

EasyBuild can now generate reproducible tarballs of sources cloned from Git
repositories. This means that those sources using the `git_config` option will
now have consistent contents across different systems and across time, allowing
to reliably validate them with checksums. EasyBuild follows the
[archival guidelines from reproducible-builds.org](https://reproducible-builds.org/docs/archives/) 
to generate those reproducible tarballs.

This new feature does not apply to sources cloned with `keep_git_dir` enabled.
Including the `.git` folder in the sources is inherently time-dependent as it
contains information about the clone action itself, which hinders the creation
of a reproducible tarball.

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

* `cpath` (default): This is the traditional mode of operation of EasyBuild.
Module files generated by EasyBuild 5.0 continue to prepend search paths to
headers to the `CPATH` environment variable by default. The `CPATH` environment
variable has a high precedence, only surpassed by explicit `-I` options in the
compilation command. 

* `include_paths`: Module files generated by EasyBuild 5.0 will prepend search
paths to headers to the environment variables `C_INCLUDE_PATH`,
`CPLUS_INCLUDE_PATH` and `OBJC_INCLUDE_PATH`. These three environment variables
have lower precedence tthan `CPATH` and the paths defined in the option
`-isystem`. Therefore, this setting is useful for software providing include
folders that could collide with those from other loaded modules.

This option is also available as easyconfig parameter
`module_search_path_headers`. Which has precedence over the global
`--module-search-path-headers` build option.

The Easyconfig parameter `modextrapaths` has a new special key called
`MODULE_LOAD_ENV_HEADERS` that allows to add search paths in the generated
module according to `--module-search-path-headers`.

```
modextrapaths = {
    MODULE_LOAD_ENV_HEADERS: 'include/extra_dir',
}
```

Adding search paths explicitly to `CPATH` or any other environment variable by
name continues to work as usual in EasyBuild 5.0.

---

## Provide control over how EasyBuild specifies path to header files during installation (via `--search-path-cpp-headers`) { : #search-path-cpp-headers}

*(more info soon)*

---

## Provide control over how EasyBuild specifies path to libraries during installation (via `--search-path-linker`) { : #search-path-linker }

*(more info soon)*

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

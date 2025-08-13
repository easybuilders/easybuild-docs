# Changed default configuration or behaviour in EasyBuild v5.0

*(for a full overview of changes in EasyBuild v5.0, see [here](index.md))*

The default value for several EasyBuild configuration settings has been changed in EasyBuild v5.0.

**Changed default configuration in EasyBuild framework**

- [RPATH linking is enabled by default (`--rpath`)][rpath]
- [Trace output is enabled by default (`--trace`)][trace]
- [Including `extensions` statement in generated modules is enabled by default (`--module-extensions`)][module-extensions]
- [Using `depends_on` for dependencies in generated modules is enabled by default (`module-depends-on`)][module-depends-on]
- [Use Slurm as default job backend (`--job-backend`)][job-backend]
- [Default maximum build parallelism is set to 16 (`--max-parallel`)][max-parallel-16]

**Changed behaviour in EasyBuild framework**

- [Change semantics of `--dry-run` (`-D`), so it doesn't imply `--robot` (`-r`)][dry-run-robot]
- [Move verifying of checksums from `source` to `fetch` step, to include it with `--fetch`][verifying-checksums]
- [Create `lib` to `lib64` symlink (and vice versa) *before* running `postinstallcmds`][lib-lib64-symlink]
- [Use `sha256` as the default checksum type][sha256]
- [Use default value `$XDG_CONFIG_DIRS` from XDG basedir spec: `/etc/xdg` (instead of `/etc`)][XDG_CONFIG_DIRS_default]
- [Reverse order for parsing files in `$XDG_CONFIG_DIRS`][XDG_CONFIG_DIRS_order]
- [Don't allow unresolved templates in easyconfig parameters by default][unresolved-templates]
- [Refactor `make_extension_string` method in `EasyBlock` class][make_extension_string]
- [Change default for `change_into_dir` option in `extract_file` function to to `False`][extract_file]
- [Change `Toolchain.get_flag` so it doesn't automatically prepend a dash (`-`) to compiler][toolchain-get-flag-dash]
- [Enforce correct `.patch(.*)` extension for patch files][patch-extension]
- [Run sanity checks commands from an empty temporary directory rather than the software install directory][sanity-check-commands]
- [Only allow use of `rpath` toolchain option when `system` toolchain is used][system-toolchain-options]

**Changed defaults in easyblocks**

- [`download_dep_fail`, `use_pip`, `sanity_pip_check` are enabled by default for Python package installations][python-pkgs-defaults]
- [`CMakeMake` easyblock sets `LIBDIR` configuration option to `lib` by default][cmakemake-libdir]

---

## RPATH linking is enabled by default (`--rpath`) {: #rpath }

[RPATH linking][rpath_support] is enabled by default in EasyBuild v5.0.

The benefits for enabling RPATH are explained in [Why RPATH?][rpath_support_why].

This enhancement **does not** add any filtering of environment variables. This means `$LD_LIBRARY_PATH`
will continue to be appended by the environment module files EasyBuild generates,
unless it is configured to filter these variables (via `--filter-env-vars`,
see also [Relation to `$LD_LIBRARY_PATH`][rpath_support_LD_LIBRARY_PATH]).

The RPATH part of the EasyBuild sanity check has been relaxed (by default,
to allow for installing software that uses RPATH linking on top of existing software installations that do not use RPATH.
The RPATH sanity check can be made strict again via the `strict-rpath-sanity-check` EasyBuild configuration setting.

To disable RPATH linking, either:

- Use the `--disable-rpath` command line option;
- Set the `$EASYBUILD_DISABLE_RPATH` environment variable;
- Disable RPATH linking in an EasyBuild [configuration file](../configuration.md#configuration_file):

    ``` ini
    [override]
    rpath=0
    ```

---

## Trace output is enabled by default (`--trace`) {: #trace }

The [`--trace` option](../tracing-progress.md) is enabled by default.

This makes the output produced by the `eb` command more informative, by providing more information about what's going on in the background.

To disable trace output, either:

- Use the `--disable-trace` command line option;
- Set the `$EASYBUILD_DISABLE_TRACE` environment variable;
- Disable trace mode in a [configuration file](../configuration.md#configuration_file):

    ``` ini
    [override]
    trace=0
    ```

---

## Including `extensions` statement in generated modules is enabled by default (`module-extensions`) {: #module-extensions }

*(more info soon)*

---

## Using `depends_on` for dependencies in generated modules is enabled by default (`module-depends-on`) {: #module-depends-on }

*(more info soon)*

---

## Use Slurm as default job backend (`job-backend`) {: #job-backend }

*(more info soon)*


---

## Default maximum build parallelism is set to 16 (`max-parallel`) {: #max-parallel-16 }

For EasyBuild 5.0, we have changed to using at most 16 cores by default for builds. If there are fewer cores
available then the number of available cores will be used. Where an easyconfig or easyblock specifies a lower level
of parallelism to be used, then that is respected.

In recent years we have seen a large rise in the core counts of the systems used to build software. Before, we used
all available cores for the build. This, however, can lead to problems with many threads building at once leads to
poor performance for the filesystem or a build failure due to exhausting the available memory.

Tests were performed on two systems and the data from those tests is in the
[initial pull request for the change](https://github.com/easybuilders/easybuild-framework/pull/4606). As can be seen
from those tests, there was limited speed up seen when using more than 16 cores and anyone considering increasing this
from the default of 16 should run selective tests to see if this will give a noticeable improvement in build times on
their system.

---

## Change semantics of `--dry-run` (`-D`), so it doesn't imply `--robot` (`-r`) {: #dry-run-robot }

For EasyBuild 5.0, we have changed so that `--dry-run` (`-D`) no longer implies `--robot` (`-r`).
Those wanting the previous behaviour should use both options together `--dry-run --robot` (`-Dr`). 

---

## Move verifying of checksums from `source` to `fetch` step, to include it with `--fetch` {: #verifying-checksums }

Checksums are now verified in the `fetch` step, instead of the `source` step.
This means that the checksums are verified at the point EasyBuild checks that the file is present or downloads it if it is not.

Note, also, that the [`source` step has been renamed to `extract` step][source-step].

---

## Create `lib` to `lib64` symlink (and vice versa) *before* running `postinstallcmds` {: #lib-lib64-symlink }

In EasyBuild 5.0 the `lib` / `lib64` symlink is created before running the `postinstallcmds`.
This change simplifies writing postinstallcmds because it ensures the `lib` directory already exists.

---

## Use `sha256` as the default checksum type {: #sha256 }

The default checksum type, used in EasyConfigs, is now set to `sha256`.

We have also [deprecated the older checksums types](deprecated-functionality.md#checksums).

---

## Use default value `$XDG_CONFIG_DIRS` from XDG basedir spec: `/etc/xdg` (instead of `/etc`) {: #XDG_CONFIG_DIRS_default }

*(more info soon)*

---


## Reverse order for parsing files in `$XDG_CONFIG_DIRS` {: #XDG_CONFIG_DIRS_order }

*(more info soon)*

---

## Don't allow unresolved templates in easyconfig parameters by default {: #unresolved-templates }

*(more info soon, incl. support for `allow-unresolved-templates` configuration setting)*

---

## Refactor `make_extension_string` method in `EasyBlock` class {: #make_extension_string }

*(more info soon)*

---

## Change default for `change_into_dir` option in `extract_file` function to to `False` {: #extract_file }

*(more info soon)*

---


## Change `Toolchain.get_flag` so it doesn't automatically prepend a dash (`-`) to compiler {: #toolchain-get-flag-dash }

*(more info soon)*

---

## Enforce correct `.patch(.*)` extension for patch files {: #changes.md#patch-extension }

*(more info soon)*

---


## Run sanity checks commands from an empty temporary directory rather than the software install directory { : #sanity-check-commands }

*(more info soon)*

---

## Only allow use of `rpath` toolchain option when `system` toolchain is used {: #system-toolchain-options }

*(more info soon)*

---

## `download_dep_fail`, `use_pip`, `sanity_pip_check` are enabled by default for Python package installations { : #python-pkgs-defaults }

The `download_dep_fail`, `use_pip`, and `sanity_pip_check` easyconfig parameters are now enabled by default
in the `PythonPackage` and `PythonBundle` generic easyblocks (and the easyblocks that derive from them).

This means that these should no longer be explicitly set to `True` in easyconfig files using these easyblocks.

---

## `CMakeMake` easyblock sets `LIBDIR` configuration option to `lib` by default { : #cmakemake-libdir }

The generic `CMakeMake` easyblock will use `-DCMAKE_INSTALL_LIBDIR=lib` by default as option to the `cmake` command.
Easyconfig files that specify this via `configopts` should be adjusted accordingly.

A custom easyconfig parameter named `install_libdir` has been added to `CMakeMake` to specify a custom value should that
be required.

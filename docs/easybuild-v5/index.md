# EasyBuild v5.0

A high-level overview of changes in EasyBuild version 5.0 is listed below.

Click on a particular item for more information.

!!! warning "EasyBuild version 5.0.0 is not released yet"

    EasyBuild v5.0.0 is still under active development via the `5.0.x` branches in the EasyBuild GitHub repositories.

    Shortly after the release of EasyBuild v5.0.0, the `5.0.x` branches will be collapsed in the corresponding
    `develop` branches, and the `5.0.x` branches will then only be used as a staging area for additional EasyBuild
    v5.0.x releases.

    The overview below is known to be incomplete, and will be gradually completed as we approach
    the release of EasyBuild v5.0.0.

---

## Breaking changes {: #breaking-changes }

EasyBuild v5.0 includes a number of backwards-incompatible changes:

- [Python 3.6+ is required to run EasyBuild v5.0.0](python36-required.md)
- If Lmod is used as modules tool, then version >= 8.0 is required;
- If Environment Modules is used as modules tool, then version >= 4.3.0 is required;

See also the [overview of removed functionality][removed-functionality] below.


---

## Changes in default configuration or behaviour

The default value for several EasyBuild configuration settings or EasyBuild behaviour has been changed in EasyBuild v5.0.

### Changes to default configuration in EasyBuild framework

- [RPATH linking is enabled by default (`--rpath`)](changes-in-default-configuration.md#rpath)
- [Trace output is enabled by default (`--trace`)](changes-in-default-configuration.md#trace)
- [`sha256` is used as the default checksum type](changes-in-default-configuration.md#sha256)
- [Default maximum build parallelism is set to 16 (`--parallel`)](changes-in-default-configuration.md#parallel-16)

- TODO: change default for change_into_dir to False for extract_file <https://github.com/easybuilders/easybuild-framework/pull/4246>
- TODO: create `lib` -> `lib64` symlink (or vice versa) *before* running `postinstallcmds` <https://github.com/easybuilders/easybuild-framework/pull/4435>
- TODO: enable `--module-extensions` by default (+ resolve template values used in extension version) <https://github.com/easybuilders/easybuild-framework/pull/4501>
- TODO: Enable `module-depends-on` by default <https://github.com/easybuilders/easybuild-framework/pull/4500>
- TODO: don't allow unresolved templates in easyconfig parameters by default + add support for `--allow-unresolved-templates` configuration option <https://github.com/easybuilders/easybuild-framework/pull/4516>
- TODO: Use default value `$XDG_CONFIG_DIRS` from XDG basedir spec: `/etc/xdg` (instead of `/etc`) <https://github.com/easybuilders/easybuild-framework/pull/4591> and Reverse order for parsing files in `XDG_CONFIG_DIRS` <https://github.com/easybuilders/easybuild-framework/pull/4630>
- TODO: move verifying of checksums from `source` to `fetch` step, to include it with `--fetch` <https://github.com/easybuilders/easybuild-framework/pull/4624>
- TODO: use Slurm as the default job backend + deprecate support for GC3Pie as job backend <https://github.com/easybuilders/easybuild-framework/pull/4659>
- TODO: change semantics of `--dry-run`, so it doesn't imply `--robot` <https://github.com/easybuilders/easybuild-framework/pull/4704>
- TODO: change `Toolchain.get_flag` so it doesn't automatically prepend a dash (`-`) to compiler flags, add deprecation warning for `optarch` value without leading dash, renam... <https://github.com/easybuilders/easybuild-framework/pull/4698>

### Changed behaviour in EasyBuild framework

- TODO: run sanity checks commands from an empty temporary directory (rather than the software install directory) <https://github.com/easybuilders/easybuild-framework/pull/4723>

### Changed defaults in easyblocks

- [`download_dep_fail`, `use_pip`, `sanity_pip_check` enabled by default for `PythonPackage` easyblock](changes-in-default-configuration.md#python-pkgs-defaults)
- [`CMakeMake` easyblock sets `LIBDIR` configuration option to `lib` by default](changes-in-default-configuration.md#cmakemake-libdir)




---

## Enhancements

Various significant enhancements are included in EasyBuild v5.0, including:

- [New function to run shell commands: `run_shell_cmd`](run_shell_cmd.md)
- [Interactive debugging of failing shell commands via `env.sh` and `cmd.sh` scripts](../interactive-debugging-failing-shell-commands.md)
- [Granular exit codes](enhancements.md#granular-exit-codes)
- [Reproducible tarballs](enhancements.md#reproducible-tarballs)
- [Detect Fortran `.mod` files in `GCCcore` installations](enhancements.md#mod-files)
- [Specifying changes that should be made by generated module files via `module_load_environment`](../implementing-easyblocks.md#module_load_environment)
- [Provide control over how generated modules update search path for header files (via `--module-search-path-headers`)](enhancements.md#module-search-path-headers)
- [Provide control over how EasyBuild specifies path to header files during installation (via `--search-path-cpp-headers`)](enhancements.md#search-path-cpp-headers)
- [Provide control over how EasyBuild specifies path to libraries during installation (via `--search-path-linker`)](enhancements.md#search-path-linker)
- [Let `ConfigureMake` generic easyblock error out on unknown `configure` options](enhancements.md#configuremake-unknown-configure-options)
- [Support not using `$PYTHONPATH` to specify the location of installed Python packages (via `--prefer-python-search-path`)](enhancements.md#PYTHONPATH-vs-EBPYTHONPREFIXES)
 

---

## Removed functionality {: #removed-functionality }

Functionality that was deprecated a while ago has been removed:

- [EasyBuild bootstrap script is removed](removed-functionality.md#bootstrap_script) 
- [Experimental support for `.yeb` easyconfig format is removed](removed-functionality.md#yeb)


---

## Deprecated functionality {: #deprecated-functionality }

Some functionality is being deprecated in EasyBuild v5.0, and is scheduled to be removed in EasyBuild v6.0:

- [`run_cmd` and `run_cmd_qa` functions](deprecated-functionality.md#run_cmd)
- [`easybuild.tools.py2vs3` module](deprecated-functionality.md#py2vs3)
- [Deprecation of older checksums types](deprecated-functionality.md#checksums)
- deprecate support for `EnvironmentModulesC` and `EnvironmentModulesTcl` module tools <https://github.com/easybuilders/easybuild-framework/pull/4439>

---

## Other changes

TODO: decide if these should be in another section...

- TODO: Archiving / toolchain policy / removed blocks & ecs
- TODO: Rename:
   - `post_install_step` to `post_processing_step` <https://github.com/easybuilders/easybuild-easyblocks/pull/3525>
   - rename `run` method to `install_extension`, and likewise for `prerun` to `pre_install_extension`, `postrun` to `post_install_extension`, and `run_async` to `install_extension_async` <https://github.com/easybuilders/easybuild-easyblocks/pull/3064> / <https://github.com/easybuilders/easybuild-framework/pull/4400>
   - Rename '`source`' step to '`extract`' (affects `skipsteps` easyconfig parameter + `--stop` option) <https://github.com/easybuilders/easybuild-framework/pull/4629>
   - Rename `post_install_step` to `post_processing_step` + deprecate use of `post_install_step` <https://github.com/easybuilders/easybuild-framework/pull/4715>
- TODO: add `--keep-debug-symbols` configuration option to set default value of '`debug`' toolchain option, ~and enable it by default so `-g` is included in `$CXXFLAGS` & co~ <https://github.com/easybuilders/easybuild-framework/pull/4688>
   - this needs documenting, to include a warning that we disabled it due to large build sizes

---

## FAQ

*(coming soon)*


---

## Other links

- [Beta releases and release candidates](release-candidates.md)
- [GitHub Project board for EasyBuild v5.0](https://github.com/orgs/easybuilders/projects/18)
- [Talk on EasyBuild 5.0 at EasyBuild User Meeting 2023](https://easybuild.io/eum23/#easybuild5)
- [Talk on EasyBuild 5.0 at EasyBuild User Meeting 2024](https://easybuild.io/eum24/#eb5)

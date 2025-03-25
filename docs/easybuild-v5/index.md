# EasyBuild v5.0

A high-level overview of changes in EasyBuild version 5.0.0 is listed below.

Click on a particular item for more information.

!!! warning

    (Tue 18 March 2025)
    The sections linked to from this overview below are known to be incomplete.
    Extra information will be gradually added over the next couple of days.

---

## Breaking changes {: #breaking-changes }

EasyBuild v5.0 includes a number of backwards-incompatible changes:

- [Python 3.6+ is required to run EasyBuild v5.0.0](python36-required.md)
- If Lmod is used as modules tool, then version >= 8.0 is required;
- If Environment Modules is used as modules tool, then version >= 4.3.0 is required;

See also the [overview of removed functionality][removed-functionality] below.


---

## Changed default configuration or behaviour

The default value for several EasyBuild configuration settings + default behaviour of EasyBuild has been changed in EasyBuild v5.0.

### Changed default configuration in EasyBuild framework

- [RPATH linking is enabled by default (`rpath`)](changes.md#rpath)
- [Trace output is enabled by default (`trace`)](changes.md#trace)
- [Including `extensions` statement in generated modules is enabled by default (`module-extensions`)](changes.md#module-extensions)
- [Using `depends_on` for dependencies in generated modules is enabled by default (`module-depends-on`)](changes.md#module-depends-on)
- [Use Slurm as default job backend (`job-backend`)](changes.md#job-backend)
- [Default maximum build parallelism is set to 16 (`max-parallel`)](changes.md#max-parallel-16)

### Changed behaviour in EasyBuild framework

- [Change semantics of `--dry-run` (`-D`), so it doesn't imply `--robot` (`-r`)](changes.md#dry-run-robot)
- [Move verifying of checksums from `source` to `fetch` step, to include it with `--fetch`](changes.md#verifying-checksums)
- [Create `lib` to `lib64` symlink (and vice versa) *before* running `postinstallcmds`](changes.md#lib-lib64-symlink)
- [Use `sha256` as the default checksum type](changes.md#sha256)
- [Use default value `$XDG_CONFIG_DIRS` from XDG basedir spec: `/etc/xdg` (instead of `/etc`)](changes.md#XDG_CONFIG_DIRS_default)
- [Reverse order for parsing files in `$XDG_CONFIG_DIRS`](changes.md#XDG_CONFIG_DIRS_order)
- [Don't allow unresolved templates in easyconfig parameters by default](changes.md#unresolved-templates)
- [Refactor `make_extension_string` method in `EasyBlock` class](changes.md#make_extension_string)
- [Change default for `change_into_dir` option in `extract_file` function to to `False`](changes.md#extract_file)
- [Change `Toolchain.get_flag` so it doesn't automatically prepend a dash (`-`) to compiler flags](changes.md#toolchain-get-flag-dash)
- [Enforce correct `.patch(.*)` extension for patch files](changes.md#patch-extension)
- [Run sanity checks commands from an empty temporary directory rather than the software install directory](changes.md#sanity-check-commands)
- [Only allow use of `rpath` toolchain option when `system` toolchain is used](changes.md#system-toolchain-options)

### Changed defaults in easyblocks

- [`download_dep_fail`, `use_pip`, `sanity_pip_check` enabled by default for `PythonPackage` easyblock](changes.md#python-pkgs-defaults)
- [`CMakeMake` easyblock sets `LIBDIR` configuration option to `lib` by default](changes.md#cmakemake-libdir)

---

## Enhancements

Various significant enhancements are included in EasyBuild v5.0, including:

- [New function to run shell commands: `run_shell_cmd`](run_shell_cmd.md)
- [Interactive debugging of failing shell commands via `env.sh` and `cmd.sh` scripts](../interactive-debugging-failing-shell-commands.md)
- [New collection of easyconfig templates](enhancements.md#collection-easyconfig-templates)
- [Mark support for installing extensions in parallel as stable (no longer experimental)](enhancements.md#parallel-extensions-install-stable)
- [Mark easystack support as stable (no longer experimental)](enhancements.md#easystack-stable)
- [Reproducible tarballs for sources created via `git_config`](enhancements.md#reproducible-tarballs-git_config)
- [New home for the archive of easyconfigs](enhancements.md#new-easyconfig-archive)
- [Granular exit codes](enhancements.md#granular-exit-codes)
- [Copy build directory and/or log file(s) if installation failed to path specified via `--failed-install-build-dirs-path` or `--failed-install-logs-path`](enhancements.md#copy-build-log-failed-installs)
- [Specify changes that should be made by generated module files via `module_load_environment`](../implementing-easyblocks.md#module_load_environment)
- [Add support for alternate easyconfig parameters/templates/constants](enhancements.md#alternative-easyconfig-parameters-templates-constants)
- [`keep-debug-symbols` configuration option to set default value of '`debug`' toolchain option](enhancements.md#keep-debug-symbols)
- [Provide control over how generated modules update search path for header files (via `--module-search-path-headers`)](enhancements.md#module-search-path-headers)
- [Provide control over how EasyBuild specifies path to header files during installation (via `--search-path-cpp-headers`)](enhancements.md#search-path-cpp-headers)
- [Provide control over how EasyBuild specifies path to libraries during installation (via `--search-path-linker`)](enhancements.md#search-path-linker)
- [Support not using `$PYTHONPATH` to specify the location of installed Python packages (via `--prefer-python-search-path`)](enhancements.md#PYTHONPATH-vs-EBPYTHONPREFIXES)
- [Revamp of easyconfig parameter `modextrapaths`](enhancements.md#modextrapaths-revamp)
- [Detect Fortran `.mod` files in `GCCcore` installations](enhancements.md#mod-files)
- [Let `ConfigureMake` generic easyblock error out on unrecognized `configure` options](enhancements.md#configuremake-unknown-configure-options)
- [Require `download_instructions` for non-public sources](enhancements.md#require_download_instructions)

---

## Removed functionality {: #removed-functionality }

Functionality that was deprecated a while ago in EasyBuild v4.x has been ***removed*** in EasyBuild v5.0:

- [EasyBuild bootstrap script](removed-functionality.md#bootstrap_script) 
- [Experimental support for `.yeb` easyconfig](removed-functionality.md#yeb)
- [`accept-eula` configuration setting](removed-functionality.md#accept-eula)
- [`--wait-on-lock` configuration setting](removed-functionality.md#wait-on-lock)
- [`is_generic_easyblock` function from `easybuild.framework.easyconfig.easyconfig`](removed-functionality.md#easyconfig-is_generic_easyblock)
- [`copytree`, `rmtree2` functions from `easybuild.filetools`](removed-functionality.md#filetools-copytree-rmtree2)
- [`fetch_extension_sources` method in `EasyBlock` class](removed-functionality.md#EasyBlock-fetch_extension_sources)
- [`mod_exists_regex_template` options in `ModulesTool.exist` method](removed-functionality.md#ModulesTool-exist-mod_exists_regex_template)
- [`Toolchain.add_dependencies` method](removed-functionality.md#Toolchain-add_dependencies)
- [`disable_templating` + `default_fallback` options in `get_easyblock_class` function](removed-functionality.md#get_easyblock_class)
- [`skip_lower` option from `template_constant_dict` function](removed-functionality.md#template_constant_dict)
- [`use_git_am` option for `apply_patch` function](removed-functionality.md#apply_patch-use_git_am)
- [`skip_symlinks` option for `adjust_permissions` function](removed-functionality.md#adjust_permissions-skip_symlinks)
- [`log_error` option in `which` function](removed-functionality.md#which-log_error)
- [`descr` option for `simple_option` function](removed-functionality.md#simple_option-descr)
- [`dummy` toolchain](removed-functionality.md#dummy-toolchain)
- [Support for 32-bit targets](removed-functionality.md#32-bit-targets)

In addition, several software-specific easyblocks that were no longer used have been removed: ACML, ALADIN, Allinea, ARB, ATLAS, BamTools, Bioconductor, BiSearch, BLACS, Blender , BWISE, CFDEMcoupling, Chapel, CHARMM, cppcheck, DL_POLY_Classic, DOLFIN, Doris, Doxygen, EggLib, EPD, ESPResSo, fastStructure, FoldX, FreeFEM, HEALPix, IMOD, IPP, IronPython, libsmm, MetaVelvet, Modeller, Molpro, Mono, Mothur, MSM, MTL4, MyMediaLite, mutil, MVAPICH2, ncurses, NEMO, OpenIFS, Pasha, pbdMPI, pbdSLAP, PGI, picard, pplacer, Primer3, PyQuante, python_meep, Samcef, SAS, Scalasca v1.x, SHRiMP, SNPhylo, SOAPdenovo, TAU, TotalView, UFC, VSC-tools, and WRF-Fire.

Easyconfig files for unsupported toolchains were archived in the [`easyconfigs-archive`](https://github.com/easybuilders/easybuild-easyconfigs-archive) repository.


---

## Deprecated functionality {: #deprecated-functionality }

Some functionality is being deprecated in EasyBuild v5.0, and is scheduled to be removed in EasyBuild v6.0:

- [`parallel` easyconfig parameter](deprecated-functionality.md#parallel-easyconfig-parameter)
- [`run_cmd` and `run_cmd_qa` functions](deprecated-functionality.md#run_cmd) (replaced with [`run_shell_cmd`](run_shell_cmd.md))
- [`'source'` step](deprecated-functionality.md#source-step) (renamed to `'extract'`)
- [`post_install_step` method in `EasyBlock` class](deprecated-functionality.md#post_install_step) (renamed to `post_processing_step`)
- [`make_module_req_guess` method in `EasyBlock` class](deprecated-functionality.md#make_module_req_guess) (replaced with `module_load_environment` class attribute)
- [`run`, `prerun`, `postrun`, `run_async` methods in `EasyBlock` class](deprecated-functionality.md#run-methods-extensions)
- [`easybuild.tools.py2vs3` module](deprecated-functionality.md#py2vs3)
- [Older checksum types](deprecated-functionality.md#checksum-types)
- [`EnvironmentModulesC` or `EnvironmentModulesTcl` modules tools](deprecated-functionality.md#modules-tools)
- [GC3Pie as job backend](deprecated-functionality.md#gc3pie-job-backend)
- [Using `optarch` value without leading dash](deprecated-functionality.md#optarch-dash)
- [`COMPILER*_FLAGS` attributes in `Compiler` class](deprecated-functionality.md#compiler-constants) (replaced with `COMPILER*_OPTIONS`)
- [Easyconfig parameter `modextrapaths_append`](deprecated-functionality.md#deprec_modextrapaths_append) (integrated in `modextrapaths`)
- [Easyconfig parameter `allow_append_abs_path`](deprecated-functionality.md#deprec_allow_append_abs) (integrated in `modextrapaths`)
- [Easyconfig parameter `allow_prepend_abs_path`](deprecated-functionality.md#deprec_allow_prepend_abs) (integrated in `modextrapaths`)

---

## Other changes

- [Toolchain support policy](../policies/toolchains.md)

---

## FAQ

*(coming soon)*


---

## Other links

- [Beta releases and release candidates](release-candidates.md)
- [GitHub Project board for EasyBuild v5.0](https://github.com/orgs/easybuilders/projects/18)
- [Talk on EasyBuild 5.0 at 8th EasyBuild User Meeting (EUM'23)](https://easybuild.io/eum23/#easybuild5)
- [Talk on EasyBuild 5.0 at 9th EasyBuild User Meeting (EUM'24)](https://easybuild.io/eum24/#eb5)
- [Talk on EasyBuild 5.0 at 10th EasyBuild User Meeting (EUM'25)](https://easybuild.io/eum25/#eb5)

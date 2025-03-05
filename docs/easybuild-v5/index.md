# EasyBuild v5.0

A high-level overview of changes in EasyBuild version 5.0 is listed below.

Click on a particular item for more information.

!!! warning "EasyBuild version 5.0.0 is not released yet"

    EasyBuild v5.0.0 is still under active development via the `5.0.x` branches in the EasyBuild GitHub repositories.

    Shortly before the release of EasyBuild v5.0.0, the `5.0.x` branches will be collapsed in the corresponding
    `develop` branches, and the `5.0.x` branches will then only be used as a staging area for additional EasyBuild
    v5.0.x releases.

    The overview below is known to be incomplete, and will be gradually completed as we approach
    the release of EasyBuild v5.0.0.

---

## Breaking changes {: #breaking-changes }

EasyBuild v5.0 includes a number of backwards-incompatible changes:

- [Python 3.6+ is required to run EasyBuild v5.0.0](python36-required.md)
- Require Lmod >=8 <https://github.com/easybuilders/easybuild-framework/pull/4424>
- If using Tmod 4.x, then require >= 4.3.0 <https://github.com/easybuilders/easybuild-framework/pull/4425>

See also the [overview of removed functionality][removed-functionality] below.


---

## Changes in default configuration

The default value for several EasyBuild configuration settings has been changed in EasyBuild v5.0:

- [RPATH linking is enabled by default (`--rpath`)](changes-in-default-configuration.md#rpath)
- [Trace output is enabled by default (`--trace`)](changes-in-default-configuration.md#trace)


---

## Enhancements

Various significant enhancements are included in EasyBuild v5.0, including:

- [`run_shell_cmd` function](run_shell_cmd.md)
- [Granular exit codes](enhancements.md#granular_exit_codes)
- [Reproducible tarballs](enhancements.md#reproducible_tarballs)
 

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


---

## Other changes

*(coming soon)*


---

## FAQ

*(coming soon)*


---

## Other links

- [Beta releases and release candidates](release-candidates.md)
- [GitHub Project board for EasyBuild v5.0](https://github.com/orgs/easybuilders/projects/18)
- [Talk on EasyBuild 5.0 at EasyBuild User Meeting 2023](https://easybuild.io/eum23/#easybuild5)
- [Talk on EasyBuild 5.0 at EasyBuild User Meeting 2024](https://easybuild.io/eum24/#eb5)

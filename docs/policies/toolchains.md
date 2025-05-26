# Supported Toolchain Generations Policy {: #policy_toolchains }

For the central EasyBuild repositories, we support a set of [common toolchain][common_toolchains] generations.

* Accept PRs only for the 6 most recent toolchain generations.
* Deprecate toolchains generations 7 and 8, including closing PRs and issues for these toolchains.
* Archive easyconfigs using toolchain generation 9 (and older).

## Notes

* This assumes we continue with two toolchain generations per year.
* A toolchain generation exists when we have an lettered (i.e. 2024a) toolchain in `develop`.

## Background

The central easyconfigs repository is intended to provide references easyconfigs. For the reference easyconfigs we
aim to have only one version of a software being used as a dependency in each toolchain generation. (There are
exceptions, but we aim to keep these limited.)

Sites and users can then supplement these easyconfigs via there own collection of easyconfigs. This additional
collection is added via the [robot search path][robot_search_path].

## Current situation

As of September 2024 (EasyBuild 4.9.4) the latest toolchain generation is `2024a`.

* Supported:
    * 2025a (GCC 14.2.0)
    * 2024a (GCC 13.3.0)
    * 2023b (GCC 13.2.0)
    * 2023a (GCC 12.3.0)
    * 2022b (GCC 12.2.0)
    * 2022a (GCC 11.3.0)
* Deprecated: 2021b (GCC 11.2.0), 2021a (GCC 10.3.0)
* Archived (and unsupported): 2020b (GCC 10.2.0), and older

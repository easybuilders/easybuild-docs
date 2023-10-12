# Supported Toolchain Generations Policy {: #policy_toolchains }

!!! note
     This policy will be implemented as part of the release of [EasyBuild 5.0][overview]

For the central EasyBuild repositories, we support a set of toolchain generations.

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

## Example

As of November 2023 the latest toolchain generation is `2023b`.

* Supported: 2023b, 2023a, 2022b, 2022a, 2021b, 2021a
* Deprecated: 2020b and 2020a
* Archived (and unsupported): 2019b and older


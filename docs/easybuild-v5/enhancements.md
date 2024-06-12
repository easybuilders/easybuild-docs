# Enhancements in EasyBuild v5.0

*(for a full overview of changes in EasyBuild v5.0, see [here](overview-of-changes.md))*

Various significant enhancements are included in EasyBuild v5.0, including:

* [`run_shell_cmd` function][run_shell_cmd]
* [Require `download_instructions` to be specified][require_download_instructions]

---

## `run_shell_cmd` function { : #run_shell_cmd }

See dedicated page on the new [`run_shell_cmd` function](run_shell_cmd.md).

---

## Require `download_instructions` to be specified {: require_download_instructions }

[`download_instructions`][download_instructions] is used in easyconfigs to specify instructions, or information, on
how to obtain sources that are not directly downloadable. In EasyBuild 5, we've updated the testsuite for the `easybuild-easyconfigs`
repository to require that all easyconfigs for which sources can not be downloaded automatically must specify these
(see [easybuild-easyconfigs PR #19881](https://github.com/easybuilders/easybuild-easyconfigs/pull/19881)).

As part of this enhancement we also added `download_instructions` to all easyconfigs that require them (see the PRs linked from 
[easybuild-easyconfigs PR #19881](https://github.com/easybuilders/easybuild-easyconfigs/pull/19881)). In addition to the
`download_instructions` we also clearly specify the active source path (see
[easybuild-framework PR #4459](https://github.com/easybuilders/easybuild-framework/pull/4459)).

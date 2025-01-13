# Enhancements in EasyBuild v5.0

*(for a full overview of changes in EasyBuild v5.0, see [here](index.md))*

Various significant enhancements are included in EasyBuild v5.0, including:

- [`run_shell_cmd` function][run_shell_cmd]
- [Granular exit codes][granular_exit_codes]
- [Reproducible tarballs][reproducible_tarballs]
* [Require `download_instructions` to be specified][require_download_instructions]

---

## `run_shell_cmd` function { : #run_shell_cmd }

See dedicated page on the new [`run_shell_cmd` function](run_shell_cmd.md).

---

## Granular exit codes { : #granular_exit_codes }

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

## Reproducible tarballs { : #reproducible_tarballs}

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

## Require `download_instructions` to be specified {: require_download_instructions }

[`download_instructions`][download_instructions] is used in easyconfigs to specify instructions, or information, on
how to obtain sources that are not directly downloadable. In EasyBuild 5, we've updated the testsuite for the `easybuild-easyconfigs`
repository to require that all easyconfigs for which sources can not be downloaded automatically must specify these
(see [easybuild-easyconfigs PR #19881](https://github.com/easybuilders/easybuild-easyconfigs/pull/19881)).

As part of this enhancement we also added `download_instructions` to all easyconfigs that require them (see the PRs linked from 
[easybuild-easyconfigs PR #19881](https://github.com/easybuilders/easybuild-easyconfigs/pull/19881)). In addition to the
`download_instructions` we also clearly specify the active source path (see
[easybuild-framework PR #4459](https://github.com/easybuilders/easybuild-framework/pull/4459)).

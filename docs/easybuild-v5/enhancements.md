# Enhancements in EasyBuild v5.0

*(for a full overview of changes in EasyBuild v5.0, see [here](overview-of-changes.md))*

Various significant enhancements are included in EasyBuild v5.0, including:

* [`run_shell_cmd` function][run_shell_cmd]
* [Enable `--trace` by default][trace]

---

## `run_shell_cmd` function { : #run_shell_cmd }

See dedicated page on the new [`run_shell_cmd` function](run_shell_cmd.md).

---

## Enable `--trace` by default {: #trace }

The [`--trace` option](../tracing-progress.md) is enabled by default (see [easybuild-framework PR #4250](https://github.com/easybuilders/easybuild-framework/pull/4250)).

This makes the output produced by the `eb` command more informative, by providing more information about what's going on in the background.

To disable trace output, either:

* Use the `--disable-trace` command line option;
* Set the `$EASYBUILD_DISABLE_TRACE` environment variable;
* Disable trace mode in a [configuration file](../configuration.md#configuration_file):

    ``` ini
    [override]
    trace=0
    ```

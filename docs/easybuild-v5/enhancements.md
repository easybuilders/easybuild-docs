# Enhancements in EasyBuild v5.0

*(for a full overview of changes in EasyBuild v5.0, see [here](overview-of-changes.md))*

Various significant enhancements are included in EasyBuild v5.0, including:

* [`run_shell_cmd` function][run_shell_cmd]
* [Enable `--rpath` by default][rpath]
* [Enable `--trace` by default][trace]

---

## `run_shell_cmd` function { : #run_shell_cmd }

See dedicated page on the new [`run_shell_cmd` function](run_shell_cmd.md).

---

## Enable `--rpath` by default {: #rpath }

The [`--rpath` option][rpath_support] is enabled by default (see [easybuild-framework PR #4448](https://github.com/easybuilders/easybuild-framework/pull/4448)). The benefits for enabling RPATH are explained in [Why RPATH?][rpath_support_why].

This enhancement **does not** add any filtering of envirnoment variables. This means that environment variables, such as
`$LD_LIBRARY_PATH`, will continue to appear in the module files unless EasyBuild is configured to filter these variables
(see [Relation to `$LD_LIBRARY_PATH`][rpath_support_LD_LIBRARY_PATH]).

To disable RPATH output, either:

* Use the `--disable-rpath` command line option;
* Set the `$EASYBUILD_DISABLE_RPATH` environment variable;
* Disable trace mode in a [configuration file](../configuration.md#configuration_file):

    ``` ini
    [override]
    rapth=0
    ```


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

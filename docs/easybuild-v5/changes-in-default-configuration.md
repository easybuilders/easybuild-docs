# Changes in default configuration in EasyBuild v5.0

*(for a full overview of changes in EasyBuild v5.0, see [here](overview-of-changes.md))*

Various changes in default configuration included in EasyBuild v5.0, including:

* [Enable RPATH linking by default][rpath]
* [Enable `--trace` by default][trace]

---

## Enable RPATH linking by default {: #rpath }

[RPATH linking][rpath_support] is enabled by default in EasyBuild v5.0 (see [easybuild-framework PR #4448](https://github.com/easybuilders/easybuild-framework/pull/4448)).

The benefits for enabling RPATH are explained in [Why RPATH?][rpath_support_why].

This enhancement **does not** add any filtering of environment variables. This means `$LD_LIBRARY_PATH`
will continue to be appended by the environment module files EasyBuild generates,
unless it is configured to filter these variables (via `--filter-env-vars`,
see also [Relation to `$LD_LIBRARY_PATH`][rpath_support_LD_LIBRARY_PATH]).

To disable RPATH linking, either:

* Use the `--disable-rpath` command line option;
* Set the `$EASYBUILD_DISABLE_RPATH` environment variable;
* Disable RPATH linking in an EasyBuild [configuration file](../configuration.md#configuration_file):

    ``` ini
    [override]
    rpath=0
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

# Changes in default configuration in EasyBuild v5.0

*(for a full overview of changes in EasyBuild v5.0, see [here](index.md))*

The default value for several EasyBuild configuration settings has been changed in EasyBuild v5.0:

- [RPATH linking is enabled by default (`--rpath`)](rpath)
- [Trace output is enabled by default (`--trace`)](trace)

---

## RPATH linking is enabled by default (`--rpath`) {: #rpath }

[RPATH linking][rpath_support] is enabled by default in EasyBuild v5.0.

The benefits for enabling RPATH are explained in [Why RPATH?][rpath_support_why].

This enhancement **does not** add any filtering of environment variables. This means `$LD_LIBRARY_PATH`
will continue to be appended by the environment module files EasyBuild generates,
unless it is configured to filter these variables (via `--filter-env-vars`,
see also [Relation to `$LD_LIBRARY_PATH`][rpath_support_LD_LIBRARY_PATH]).

The RPATH part of the EasyBuild sanity check has been relaxed (by default,
to allow for installing software that uses RPATH linking on top of existing software installations that do not use RPATH.
The RPATH sanity check can be made strict again via the `strict-rpath-sanity-check` EasyBuild configuration setting.

To disable RPATH linking, either:

- Use the `--disable-rpath` command line option;
- Set the `$EASYBUILD_DISABLE_RPATH` environment variable;
- Disable RPATH linking in an EasyBuild [configuration file](../configuration.md#configuration_file):

    ``` ini
    [override]
    rpath=0
    ```

---

## Trace output is enabled by default (`--trace`) {: #trace }

The [`--trace` option](../tracing-progress.md) is enabled by default.

This makes the output produced by the `eb` command more informative, by providing more information about what's going on in the background.

To disable trace output, either:

- Use the `--disable-trace` command line option;
- Set the `$EASYBUILD_DISABLE_TRACE` environment variable;
- Disable trace mode in a [configuration file](../configuration.md#configuration_file):

    ``` ini
    [override]
    trace=0
    ```

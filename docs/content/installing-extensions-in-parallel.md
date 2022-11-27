# Installing extensions in parallel *(experimental!)* {: #installing_extensions_in_parallel }

Since EasyBuild v4.5.0 (initial) support is available for installing
extensions in parallel, that is to run the installation command for
multiple extensions that are ready to install at the same time in the
background, to exploit the availability of multiple cores.

**Note: this is an**
[experimental feature][experimental_features]. **Some of the mentioned functionality may be subject to
change or be prone to errors.**

## Configuration {: #installing_extensions_in_parallel_configuration }

To let EasyBuild install extensions in parallel, the
`parallel-extensions-install` configuration option must be enabled.

In addition, since the support for installing extensions in parallel is
an experimental feature, the `experimental` configuration option must be
also be enabled (see also [Experimental features][experimental_features]).

How many extension installations should be started (at maximum) at the
same time is controlled by the `parallel` configuration option.

## Requirements {: #installing_extensions_in_parallel_requirements }

For EasyBuild to be able to install a list of extensions in parallel,
two requirements must be met:

- The easyblock(s) that are used for installing the extensions must
    have support for determining which installed extensions are required
    to fulfil the dependencies for a particular extension. This is done
    via the `required_deps` property method.
- EasyBuild must be able to start a single shell command
    (asynchronously, so it runs in the background) to perform the
    installation of the extension via the `run_async` method, and check
    whether the command has completed via the `async_cmd_check` method.

For an example of how `required_deps`, `run_async`, and
`async_cmd_check` can be implemented, see the
[RPackage](https://github.com/easybuilders/easybuild-easyblocks/blob/main/easybuild/easyblocks/generic/rpackage.py)
easyblock.

## Caveats and Known issues {: #installing_extensions_in_parallel_caveats_known_issues }

*(last update: EasyBuild v4.5.0)*

There are a couple of caveats and known issues with installing
extensions in parallel, which we hope to resolve in future EasyBuild
releases.

This is also why the support for installing extensions in parallel is
currently marked as an experimental feature.

### Only works for R extensions {: #installing_extensions_in_parallel_caveats_known_issues_only_r }

The support for installing extensions in parallel currently only works
for R extensions, since only the `RPackage` easyblock (which is used to
install R packages as extensions) implements the necessary methods (see
[Requirements][installing_extensions_in_parallel_requirements]).

Supporting other types of extensions (Python, Perl, etc.) requires that
the corresponding easyblocks that are used to install those extensions
(like `PythonPackage`, `PerlModule`) are enhanced to support determining
required dependencies and starting the installation command
asynchronously.

### List of extensions must be self-contained {: #installing_extensions_in_parallel_caveats_known_issues_exts_list }

The EasyBuild framework currently enforces that all required
dependencies for a particular extension are included in the list of
extensions that is being installed (specified via the `exts_list`
easyconfig parameter). Extensions provided by dependencies are not taken
into account (yet).

As a result, trying to install an
[R-bundle-Bioconductor](https://github.com/easybuilders/easybuild-easyconfigs/tree/main/easybuild/easyconfigs/r/R-bundle-Bioconductor)
easyconfig with `parallel-extensions-install` enabled will result in an
error reporting missing required dependencies.

### Skipping of installed extensions is still done sequentially {: #installing_extensions_in_parallel_caveats_known_issues_skip }

Checking which extensions are already installed for which the
installation can be skipped when `--skip` (see
[Installing additional extensions using `-k`/`-skip`][partial_installation_skip]) is being used
is still done sequentially.

Additional work is needed to also run these checks in parallel across
the cores that are available to EasyBuild.

### Sanity check for extensions is still run sequentially {: #installing_extensions_in_parallel_caveats_known_issues_sanity_check }

The sanity checks that are done for each extension are still done
through a sequential loop over the list of extensions.

Additional work is needed to also run these checks in parallel across
the cores that are available to EasyBuild.

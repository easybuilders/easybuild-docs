# Installing extensions in parallel {: #installing_extensions_in_parallel }

Since EasyBuild v4.5.0 support is available for installing R libraries
(extensions in an easyconfig) in parallel, that is to run the installation
command for multiple extensions that are ready to install at the same time
in the background, to exploit the availability of multiple cores.


## Configuration {: #installing_extensions_in_parallel_configuration }

To let EasyBuild install extensions in parallel, the
`parallel-extensions-install` configuration option must be enabled.

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

*(last update: EasyBuild v5.0.0)*

There are a couple of caveats and known issues with installing
extensions in parallel, which we hope to resolve in future EasyBuild
releases.

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

### Sanity check for extensions is still run sequentially {: #installing_extensions_in_parallel_caveats_known_issues_sanity_check }

The sanity checks that are done for each extension are still done
through a sequential loop over the list of extensions.

Additional work is needed to also run these checks in parallel across
the cores that are available to EasyBuild.

# Deprecated easyconfigs {: #deprecated_easyconfigs }

Since EasyBuild v3.8.0, individual easyconfig files or particular
(versions of) toolchains can be marked as deprecated.

## Symptoms {: #deprecated_easyconfigs_symptoms }

Using an easyconfig file or toolchain that was marked as deprecated
results in a warning message like:

``` console
WARNING: Deprecated functionality, will no longer work in v4.0: easyconfig file '/home/example/test.eb' is marked as deprecated:
This is an example message explaining why the easyconfig file was deprecated.
(see also http://easybuild.readthedocs.org/en/latest/Deprecated-easyconfigs.html)
```

Or, in case you are trying to use an easyconfig file or toolchain that
was marked deprecated in a previous major version of EasyBuild:

``` console
ERROR: Failed to process easyconfig /home/example/test.eb: DEPRECATED (since v4.0) functionality used: easyconfig file '/home/example/test.eb' is marked as deprecated:
This is an example message explaining why the easyconfig file was deprecated.
(see also http://easybuild.readthedocs.org/en/latest/Deprecated-easyconfigs.html)
```

## Reasons for deprecation {: #deprecated_easyconfigs_why }

There are several possible reasons why a particular easyconfig file or
toolchain was deprecated, some of which include:

- old/obsolete versions of software or toolchain components
- toolchains that are superseded by other toolchains
- known installation problems that are hard to resolve (or not worth
    the effort to resolve)

## Implications {: #deprecated_easyconfigs_implications }

Easyconfig files that are deprecated or which use a deprecated toolchain
are *not actively maintained*, and are *no longer included in the
EasyBuild regression test* (which means they may be broken by recent
changes to the EasyBuild framework or relevant easyblocks).

In a future major version of EasyBuild, these easyconfig files will be
archived (see also [Archived easyconfigs][archived_easyconfigs]).

## Deprecated and archived toolchains {: #deprecated_easyconfigs_toolchains }

Our [support policy on toolchain generations][policy_toolchains] determines the
lifespan of toolchains in EasyBuild repositories. Once a toolchain becomes
deprecated, it will stop being actively developed and tested. Once it becomes
archived, it is transferred into the
[easybuild-easyconfigs-archive](https://github.com/easybuilders/easybuild-easyconfigs-archive)
repository.

## Obsolete toolchains {: #obsolete_easyconfigs_toolchains }

Some toolchains might become obsolete, this means that they will not receive
any new versions and ultimately be completely archived. Overview of obsolete
toolchains:

### Toolchains with CUDA {: #obsolete_easyconfigs_toolchains_cuda }

- *deprecated since:* EasyBuild v4.9.0
- *will be archived in:* EasyBuild v5.1.0

The following toolchains are obsolete: `gcccuda`, `gompic`, `goolfc`,
`intelcuda`, `iomklc`.

Since the `2021a` toolchain generation, CUDA is included as a regular
dependency in common toolchains instead of having specific toolchains including
CUDA in their definition. This approach is more flexible and avoids duplication
of identical easyconfigs between CUDA and non-CUDA toolchains.

### Toolchains with legacy Intel compilers {: #obsolete_easyconfigs_toolchains_iccifort }

- *deprecated since:* EasyBuild v4.9.0
- *will be archived in:* EasyBuild v5.1.0

The following toolchains are obsolete: `icc`, `ifort`, `iccifort`.

Since the `2021a` toolchain generation, toolchains based on legacy Intel
compilers have been replaced by the new `intel-compilers` toolchain based on
the oneAPI compilers from Intel.

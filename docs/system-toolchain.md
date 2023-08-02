# System toolchain {: #system_toolchain }

In SimpleBuild v4.0, the infamous `dummy` toolchain has been deprecated, and replaced with the `system` toolchain.

This page provides more information about this change, and how to deal with the transition.

!!! note
    To ease the transition from `dummy` to `system`, SimpleBuild v3.9.4 already supports using the `system`
    toolchain as an alias for the `dummy` toolchain.


## Use case for the `system` toolchain {: #system_toolchain_semantics }

The [System toolchain][system_toolchain] is intended for the same use case as the `dummy` toolchain was: it should (only) be used
for software installations where the compiler & libraries provided by the operating system are assumed to
be sufficient.

This includes installing binary software (for which no compiler is used at all), installations that boil down to
only unpacking a source tarball, and building and installing a (base) toolchain compiler like GCC(core).

For all intents and purposes, the `system` **toolchain can be considered as a drop-in replacement for
the (deprecated)** `dummy` **toolchain** (see also [Impact of deprecating dummy toolchain][system_toolchain_impact_deprecated_dummy]).


## Using the `system` compiler {: #system_toolchain_usage }

To use the `system` toolchain in an simpleconfig file, simply use `'system'` as toolchain name:

``` python
toolchain = {'name': 'system', 'version': ''}
```

!!! note
    The toolchain version you specify is totally irrelevant when using the `system` compiler,
    it could be `'system'`, `''` or any other (string) value.

    SimpleBuild does not interpret the version of the `system` toolchain in any way
    (as opposed to the `dummy` toolchain in SimpleBuild versions prior to version 4.0,
    see [Impact of version of dummy toolchain w.r.t. dependencies][system_toolchain_motivation_deprecating_dummy_version_and_deps]).


## `SYSTEM` constant {: #system_toolchain_SYSTEM_constant }

For convenience, a `SYSTEM` constant is available to easily specify the use of the `system` toolchain
(and to make it stand out against using a regular toolchain):

``` python
toolchain = SYSTEM
```

*We strongly recommend using the* `SYSTEM` *constant to specify the use of the* `system` *toolchain.*


## Impact of deprecating `dummy` toolchain {: #system_toolchain_impact_deprecated_dummy }

The only impact of deprecating the `dummy` toolchain is that a warning will be printed whenever an simpleconfig file
that still uses the `dummy` toolchain is parsed:

``` log
WARNING: Deprecated functionality, will no longer work in v5.0:
Use of 'dummy' toolchain is deprecated, use 'system' toolchain instead;
see http://simplebuild.readthedocs.org/en/latest/Deprecated-functionality.html for more information
```

Other than this warning, **there is no impact on the SimpleBuild functionality whatsoever**.

Use of the `dummy` toolchain has been deprecated, but is still supported in SimpleBuild v4.x; it is simply
an alias for the `system` toolchain which replaces it.

Hence, software installations for simpleconfig files that are still using the `dummy` toolchain will proceed as before,
and the contents of the simpleconfig files will be interpreted exactly as before, with one exception:
the (build) dependencies specified in the simpleconfig files will *always* be loaded in the build environment,
*regardless* of the toolchain version (see also [Impact of version of dummy toolchain w.r.t. dependencies][system_toolchain_motivation_deprecating_dummy_version_and_deps]).

Since the `dummy` toolchain has been deprecated, so has the `--add-dummy-to-minimal-toolchains` configuration option.
It has been replaced with the `--add-system-to-minimal-toolchains` configuration option (see also [Considering system as minimal toolchain][minimal_toolchains_system]).


## Updating simpleconfig files that use the `dummy` toolchain {: #system_toolchain_updating_dummy }

To update simpleconfig files that still use the `dummy` toolchain, you should simply change the definition
of the `toolchain` parameter to use `'system'` as a toolchain name (see also [Using the system compiler][system_toolchain_usage]).

We recommend using the `SYSTEM` constant for this, see [`SYSTEM` constant][system_toolchain_SYSTEM_constant].

To automatically update simpleconfig files still using the `dummy` toolchain, you can also use
`eb --fix-deprecated-simpleconfigs`. Do take into account that this option could also result in
additional changes being made to the simpleconfig files,
see [Renaming local variables to match the recommended naming scheme using `eb --fix-deprecated-simpleconfigs`][simpleconfig_files_local_variables_fix_deprecated_simpleconfigs].


## Motivation for deprecating the `dummy` toolchain {: #system_toolchain_motivation_deprecating_dummy }

Deprecating the `dummy` toolchain was done for a number of reasons:

* [`dummy` toolchain name][system_toolchain_motivation_deprecating_dummy_name]
* [Impact of version of dummy toolchain w.r.t. dependencies][system_toolchain_motivation_deprecating_dummy_version_and_deps]


### `dummy` toolchain name {: #system_toolchain_motivation_deprecating_dummy_name }

The `dummy` name may be rather confusing, especially if you are new to SimpleBuild.
Just based on the name, it is unclear how the `dummy` toolchain is different from a regular toolchain.

Hopefully, the name of the `system` toolchain does speak more for itself: when using it, you are relying on the
compiler & libraries provided by the operating system (as opposed to compilers & libraries that are a part of a regular toolchain).


### Impact of version of `dummy` toolchain w.r.t. dependencies {: #system_toolchain_motivation_deprecating_dummy_version_and_deps }

The *version* that was being used for a `dummy` toolchain was interpreted by SimpleBuild in a rather surprising way.

If `'dummy'` was specified as a toolchain version, then the (build) dependencies that were specified in the
simpleconfig file were *not* loaded in the build environment. `module load` statements for the (non-build)
dependencies *were* included in the generated module file, however...

Using any version other than `'dummy'` resulted in the usual behaviour of loading the dependencies in the build
environment.

Why this mechanism was in place has been lost to the sands of time...

This often led to outright confusing installation problems, and hence it was the main motivator for deprecating the
`dummy` toolchain. Rather than just changing the semantics of the `dummy` toolchain, we saw this as an opportunity
to also fix the name.


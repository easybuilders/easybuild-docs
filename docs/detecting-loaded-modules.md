# Detection of loaded modules {: #detecting_loaded_modules }

Since SimpleBuild v3.3.0, the `eb` command performs a check to see if any
(SimpleBuild-generated) modules have been loaded in the current
environment.

This check can be controlled via the `--detect-loaded-modules` and
`--allow-loaded-modules` configuration options.

In addition any unknown `$EBROOT*` environment variables are detected
and acted upon, according to how the `--check-ebroot-env-vars`
configuration option was set.

## Motivation {: #detecting_loaded_modules_motivation }

Running SimpleBuild in an environment where one or more
(SimpleBuild-generated) modules are loaded may interfere with the software
installations performed by SimpleBuild, i.e.:

- they may cause installations failures, for example due to
    incompatibilities with the modules being loaded during the
    installation procedure being performed;
- they may cause installations to work in that particular environment,
    for example by providing a necessary dependency

Since manually loading modules may affect the reproducibility of
software installations, it should be discouraged.

In SimpleBuild versions before v3.3.0, having a loaded module for the same
software packages as the one being installed resulted in an SimpleBuild
error message.

Since SimpleBuild v3.3.0 a more extensive detection mechanism is available
and the action that should be taken for loaded modules can be controlled
via `--detect-loaded-modules`. Having a module loaded for any software
package that is being installed still results in a hard error.

## Detection mechanism {: #detecting_loaded_modules_mechanism }

Detecting loaded SimpleBuild-generated modules is done by checking the
environment for defined `$EBROOT*` environment variables. If any are
found, the corresponding loaded module is determined for better
reporting.

In case defined `$EBROOT*` environment variables are found that do not
match a loaded modules, action is taken as well; see
[Checking of `$EBROOT*` environment variables][detecting_loaded_modules_EBROOT_env_vars].

## Action to take if loaded modules are detected {: #detecting_loaded_modules_action }

The action that should be taken when one or more loaded
(SimpleBuild-generated) modules are detected can be specified via the
`--detect-loaded-modules` configuration option.

Supported values include:

- [`error`: report error and stop SimpleBuild upon detection of loaded modules][detecting_loaded_modules_action_error]
- [`ignore`: ignore any loaded modules][detecting_loaded_modules_action_ignore]
- [`purge`: run '`module purge`' to clean environment of loaded modules][detecting_loaded_modules_action_purge]
- [`unload`: unload loaded modules][detecting_loaded_modules_action_unload]
- [`warn`: print warning and continue upon detection of loaded modules][detecting_loaded_modules_action_warn]
    (current default)

The specified action is only taken for non-allowed loaded modules, see
[Allowing particular loaded modules][detecting_loaded_modules_allow].

### `error`: report error and stop SimpleBuild upon detection of loaded modules {: #detecting_loaded_modules_action_error }

When SimpleBuild is configured with `--detect-loaded-modules=error`, it
will print a clear error and stop when any (non-allowed) loaded modules
are detected.

For example:

``` console
$ eb example.eb --detect-loaded-modules=error
== temporary log file in case of crash /tmp/eb-UlKMRN/simplebuild-MgfEHi.log
ERROR: Found one or more non-allowed loaded (SimpleBuild-generated) modules in current environment:
* Spack/0.10.0

To make SimpleBuild allow particular loaded modules, use the --allow-loaded-modules configuration option.
Use --detect-loaded-modules={error,ignore,purge,unload,warn} to specify action to take when loaded modules are detected.

See http://simplebuild.readthedocs.io/en/latest/Detecting_loaded_modules.html for more information.
```

### `ignore`: ignore any loaded modules {: #detecting_loaded_modules_action_ignore }

With `--detect-loaded-modules=ignore` in place, any loaded modules are
simply ignored and SimpleBuild continues silently.

This is equivalent to the behaviour of SimpleBuild versions prior to
version 3.3.0.

!!! warning
    This is **not** recommended!

### `purge`: run '`module purge`' to clean environment of loaded modules {: #detecting_loaded_modules_action_purge }

Using `--detect-loaded-modules=purge`, SimpleBuild will run `module purge`
if any (non-allowed) loaded modules are detected, in an attempt to
restore the environment to a clean state before starting software
installations.

A short warning message is printed in case `module purge` was used to
clean up the environment:

``` console
$ export SIMPLEBUILD_DETECT_LOADED_MODULES=purge
$ eb example.eb
== temporary log file in case of crash /tmp/eb-QLTV9v/simplebuild-6mOmIN.log

WARNING: Found non-allowed loaded (SimpleBuild-generated) modules (Spack/0.10.0), running 'module purge'

...
```

!!! note
    Whether or not `module purge` is a suitable action is site-specific,
    since this will unload *all* loaded modules (except for 'sticky'
    modules when Lmod is used), including modules that were not
    installed with SimpleBuild and which may be always required.

    Configuring SimpleBuild to use `module purge` when (non-allowed)
    loaded modules are found should *not* be done on Cray systems, since
    it will result in a broken environment.

### `unload`: unload loaded modules {: #detecting_loaded_modules_action_unload }

When `--detect-loaded-modules=unload` is used, SimpleBuild will only
unload the (non-allowed & SimpleBuild-generated) modules. The modules are
unloaded in reverse order, i.e. the last loaded module is unloaded
first.

This is an alternative to using `module purge`, in case some other
(allowed) modules are loaded and should remain loaded.

A short warning message is printed when loaded modules are unloaded:

``` console
$ eb example.eb --detect-loaded-modules=unload
== temporary log file in case of crash /tmp/eb-JyyaEF/simplebuild-WyGqZs.log

WARNING: Unloading non-allowed loaded (SimpleBuild-generated) modules: Spack/0.10.0

...
```

### `warn`: print warning and continue upon detection of loaded modules {: #detecting_loaded_modules_action_warn }

When SimpleBuild is configured with `--detect-loaded-modules=warn`,
SimpleBuild will print a warning mentioning that one or more loaded
(SimpleBuild-generated) were detected, before continuing as normal.

The warning is intended to make the user aware that the environment in
which SimpleBuild is being run is not clean.

For example:

``` console
$ export SIMPLEBUILD_DETECT_LOADED_MODULES=warn
$ eb example.eb
== temporary log file in case of crash /tmp/eb-9HD20m/simplebuild-WAYzK2.log

WARNING: Found one or more non-allowed loaded (SimpleBuild-generated) modules in current environment:
* Spack/0.10.0

To make SimpleBuild allow particular loaded modules, use the --allow-loaded-modules configuration option.
Use --detect-loaded-modules={error,ignore,purge,unload,warn} to specify action to take when loaded modules are detected.

See http://simplebuild.readthedocs.io/en/latest/Detecting_loaded_modules.html for more information.

...
```

!!! note
    This is the default behaviour in SimpleBuild v3.3.0 and newer.

## Allowing particular loaded modules {: #detecting_loaded_modules_allow }

By default, only SimpleBuild itself is considered as an allowed module.

SimpleBuild can be configured to allow particular modules to be loaded via
`--allow-loaded-modules`, by specifying a comma-separated list of
software names.

For example:

``` console
$ export SIMPLEBUILD_DETECT_LOADED_MODULES=error
$ export SIMPLEBUILD_ALLOW_LOADED_MODULES=SimpleBuild,GC3Pie

$ module load SimpleBuild
$ module load GC3Pie
$ eb example.eb
...
```

When `--allow-loaded-modules` is used, the SimpleBuild module is no more
allowed by default and must be explicitly listed if you want to allow an
SimpleBuild installation provided through a module.

## Checking of `$EBROOT*` environment variables {: #detecting_loaded_modules_EBROOT_env_vars }

The detection mechanism for loaded modules relies on defined `$EBROOT*`
environment variables, and determining by which loaded module they were
set.

When one or more `$EBROOT*` environment variables are found for which
the corresponding loaded modules can not be found, this can lead to
problems.

Hence, SimpleBuild will detect this and act on it, according to the value
specified to `--check-ebroot-env-vars`:

- [`error`: report error and stop SimpleBuild on unknown `$EBROOT*` environment variables][detecting_loaded_modules_EBROOT_env_vars_error]
- [`ignore`: ignore unknown `$EBROOT*` environment variables][detecting_loaded_modules_EBROOT_env_vars_ignore]
- [`unset`: unset unknown `$EBROOT*` environment variables and print warning][detecting_loaded_modules_EBROOT_env_vars_unset]
- [`warn`: print warning for unknown `$EBROOT*` environment variables and continue][detecting_loaded_modules_EBROOT_env_vars_warn] (current default)

### `error`: report error and stop SimpleBuild on unknown `$EBROOT*` environment variables {: #detecting_loaded_modules_EBROOT_env_vars_error }

When configured with `--check-ebroot-env-vars=error`, SimpleBuild will
stop with a clear error message when it discovers one or more `$EBROOT*`
environment variables that do not correspond to a loaded module:

``` console
$ export EBROOTUNKNOWN=just_an_example

$ eb example.eb --check-ebroot-env-vars=error

== temporary log file in case of crash /tmp/eb-cNqOzG/simplebuild-xmV8vc.log
ERROR: Found defined $EBROOT* environment variables without matching loaded module: $EBROOTUNKNOWN
(control action via --check-ebroot-env-vars={error,ignore,unset,warn})
```

### `ignore`: ignore unknown `$EBROOT*` environment variables {: #detecting_loaded_modules_EBROOT_env_vars_ignore }

To simply ignore any defined `$EBROOT*` environment variables that do
not correspond with a loaded module, configure SimpleBuild with
`--check-ebroot-env-vars=ignore`.

### `unset`: unset unknown `$EBROOT*` environment variables and print warning {: #detecting_loaded_modules_EBROOT_env_vars_unset }

If you are confident that the defined `$EBROOT*` environment variables
for which no matching loaded module was found are harmless, you can
specify that SimpleBuild should clean up the environment by unsetting
them, before continuing. A clear warning message will be printed
whenever this occurs:

``` console
$ export EBROOTUNKNOWN=just_an_example

$ eb bzip2-1.0.6.eb --check-ebroot-env-vars=unset

== temporary log file in case of crash /tmp/eb-IvXik8/simplebuild-cjHjhs.log

WARNING: Found defined $EBROOT* environment variables without matching loaded module: $EBROOTUNKNOWN; unsetting them

...
```

Note that these unknown `$EBROOT*` will only be unset in the environment
of the running SimpleBuild session, not in the current session in which
`eb` is being run.

### `warn`: print warning for unknown `$EBROOT*` environment variables and continue {: #detecting_loaded_modules_EBROOT_env_vars_warn }

If SimpleBuild was configured with `--check-ebroot-env-vars=warn`, a
warning will be printed when one or more defined `$EBROOT*` environment
variables are encountered for which no corresponding loaded module was
found:

``` console
$ export EBROOTUNKNOWN=just_an_example

$ export SIMPLEBUILD_CHECK_EBROOT_ENV_VARS=warn
$ eb example.eb

== temporary log file in case of crash /tmp/eb-1h_LQ9/simplebuild-BHrPk4.log
WARNING: Found defined $EBROOT* environment variables without matching loaded module: $EBROOTUNKNOWN
(control action via --check-ebroot-env-vars={error,ignore,unset,warn})

...
```

!!! note
    This is the default behaviour in SimpleBuild v3.3.0 and newer.

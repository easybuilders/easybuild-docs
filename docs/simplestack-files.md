# Simplestack files {: #simplestack }

This documentation covers aspects of specifying a software stack to
install with Simplebuild with *simplestack files*.

**Note: this is an**
[experimental feature][experimental_features]. **Some of the mentioned functionality may be subject to
change or be prone to errors.**

!!! note
    Some breaking changes were made to the experimental simplestack support in SimpleBuild v4.7.0.

    Simplestack files must now use the `simpleconfigs` top-level key to list *simpleconfig filenames*,
    as opposed to the `software` top-level key and separate subkeys like `version`, `versionsuffix` and
    `toolchain` to specify aspects of an simpleconfig file that were supported before.


## The basics {: #simplestack_basics }

*Simplestack files* describe an entire software stack, and can be used to
specify to SimpleBuild what to install.

## Usage {: #simplestack_usage }

To build software with *Simplestack*, type:

``` shell
eb --simplestack example.yaml --experimental
```

where `example.yaml` is the file with specifications that you just
created (more about this in the next section).


## Structure of an simplestack file {: #simplestack_structure }

Simplestack files are written in [YAML
syntax](https://learnxinyminutes.com/docs/yaml).

Essentially, an simplestack file lists the simpleconfig files you want to install, which are specified under the
`simpleconfigs` key.

For example:

``` yaml
simpleconfigs:
  - PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb
  - OpenFOAM-v2206-foss-2022a.eb
```

!!! note
    You must use '`-`' to list the simpleconfigs in an simplestack file.

In addition, you can specify additional configuration options via the `options` subkey
which will only apply to the installation of a particular simpleconfig file.

For example:

``` yaml
simpleconfigs:
  - PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb:
      options:
        from-pr: 15924
        debug: True
  - Hypre-2.25.0-foss-2022a.eb:
  - OpenFOAM-v2206-foss-2022a.eb:
      options:
        installpath: /my/custom/installpath
        parallel: "1"
```

!!! note
    You need to take care with some values in YAML, especially integers, booleans, etc.

    If the specified value definitely must be a string value, you should use quotes (`'...'`) to avoid
    that the YAML parser automatically converts the value to be of a specific type.
    
    If you wish to use _1_ (the number one), such as for the value to `parallel` option in the example
    above, then this should be quoted, to avoid it being treated as the boolean `True`.

    In other cases, the automatic conversion is useful, like for the `True` used above,
    since `debug` is a boolean configuration option.

The configuration options that are valid for the `eb` command can be used (see `eb --help`),
but the `-` or `--` prefixes that are commonly used on the command line are omitted in simplestack files.

Using the example simplestack file above would be equivalent to running:

``` shell
eb PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb --from-pr 15924 --debug
eb Hypre-2.25.0-foss-2022a.eb
eb OpenFOAM-v2206-foss-2022a.eb --installpath /my/custom/installpath
```

!!! note
    Whenever configuration options are *not* specified (as is the case for `Hypre` in the example simplestack file above),
    you are still allowed to use '`:`' after the simpleconfig filename: there is no difference in behaviour in ending with or without '`:`'.

Specifying short options in an simplestack file is allowed, for example:

``` yaml
simpleconfigs:
  - OpenFOAM-v2206-foss-2022a.eb:
      options:
        D: True
```

This is not recommended however, as short options are more difficult to interpret by humans.


## Combining command line options with options in an simplestack file {: #simplestack_combining_options }

When building software with an simplestack file, you can still add additional options on the command line as well.
These apply to *all* items in the simplestack file. For example, if you have an simplestack file named
`my_simplestack.yaml`

``` yaml
simpleconfigs:
  - PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb:
      options:
        from-pr: 15924
        debug: True
  - OpenFOAM-v2206-foss-2022a.eb:
```

and you run with

``` shell
eb --experimental --simplestack my_simplestack.yaml --dry-run
```

this will have the same effect as running

``` shell
eb PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb --dry-run --from-pr 15924 --debug
eb OpenFOAM-v2206-foss-2022a.eb --dry-run --installpath /my/custom/installpath
```

Note that options specified on the command line are placed *before* the simpleconfig-specific options in the simplestack file.
SimpleBuild will always respect the argument that was put *last*.

For example:

``` shell
eb PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb --dry-run --disable-dry-run
```

will effectively run *without* enabling dry run mode, since `--disable-dry-run` is specified after `--dry-run`.

Since simpleconfig-specific configuration options specified in the simplestack file are put *last*,
they take priority over the the ones on the command line, if the same configuration option is specified in both.

For example, running:

``` shell
eb --experimental --simplestack my_simplestack.yaml --disable-debug
```

will effectively cause `PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb` to be installed with debug logging enabled,
while `OpenFOAM-v2206-foss-2022a.eb` will be effectively installed *without* debug logging.

## To be developed

In the future, we are planning to support additional also global options specified in the simplestack file. For example:

``` yaml
options:
  robot: True
simpleconfigs:
  - PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb
  - OpenFOAM-v2206-foss-2022a.eb
```

would installed both `PyTorch-1.12.0-foss-2022a-CUDA-11.7.0.eb` and `OpenFOAM-v2206-foss-2022a.eb` using `--robot`
(see [issue #4105](https://github.com/simplebuilders/simplebuild-framework/issues/4105)).

Additionally, we plan to support specifying for which SimpleBuild version an simplestack file was intended,
which can be helpful in more accurately recreating a certain software stack
(see [issue #4106](https://github.com/simplebuilders/simplebuild-framework/issues/4106)).

In the future, the `--simplestack` option will probably be dropped, and SimpleBuild will automatically detect
the use of simplestack files (see [issue #4104](https://github.com/simplebuilders/simplebuild-framework/issues/4104)).

Finally, we plan to support specifying *labels*, which would make it more simple to install only a certain subset of
the items listed in an simplestack file. For example, by labelling all GPU-capable software with a `gpu` label,
one could easily choose to *not* build anything labeled `gpu` on a CPU node
(see [issue #3512](https://github.com/simplebuilders/simplebuild-framework/issues/3512)).


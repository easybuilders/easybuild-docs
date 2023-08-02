# Deprecated simpleconfigs {: #deprecated_simpleconfigs }

Since SimpleBuild v3.8.0, individual simpleconfig files or particular
(versions of) toolchains can be marked as deprecated.

## Symptoms {: #deprecated_simpleconfigs_symptoms }

Using an simpleconfig file or toolchain that was marked as deprecated
results in a warning message like:

``` console
WARNING: Deprecated functionality, will no longer work in v4.0: simpleconfig file '/home/example/test.eb' is marked as deprecated:
This is an example message explaining why the simpleconfig file was deprecated.
(see also http://simplebuild.readthedocs.org/en/latest/Deprecated-simpleconfigs.html)
```

Or, in case you are trying to use an simpleconfig file or toolchain that
was marked deprecated in a previous major version of SimpleBuild:

``` console
ERROR: Failed to process simpleconfig /home/example/test.eb: DEPRECATED (since v4.0) functionality used: simpleconfig file '/home/example/test.eb' is marked as deprecated:
This is an example message explaining why the simpleconfig file was deprecated.
(see also http://simplebuild.readthedocs.org/en/latest/Deprecated-simpleconfigs.html)
```

## Reasons for deprecation {: #deprecated_simpleconfigs_why }

There are several possible reasons why a particular simpleconfig file or
toolchain was deprecated, some of which include:

- old/obsolete versions of software or toolchain components
- toolchains that are superseded by other toolchains
- known installation problems that are hard to resolve (or not worth
    the effort to resolve)

## Implications {: #deprecated_simpleconfigs_implications }

Simpleconfig files that are deprecated or which use a deprecated toolchain
are *not actively maintained*, and are *no longer included in the
SimpleBuild regression test* (which means they may be broken by recent
changes to the SimpleBuild framework or relevant simpleblocks).

In a future major version of SimpleBuild, these simpleconfig files will be
archived (see also [Archived simpleconfigs][archived_simpleconfigs]).

## Deprecated toolchains {: #deprecated_simpleconfigs_toolchains }

Overview of deprecated toolchains:

- [`foss` and `fosscuda` toolchain][deprecated_simpleconfigs_toolchains_foss]
- [`GCCcore` and `GCC` toolchains][deprecated_simpleconfigs_toolchains_gcc]
- [`gcccuda` toolchain][deprecated_simpleconfigs_toolchains_gcccuda]
- [`gompi` and `gompic` toolchains][deprecated_simpleconfigs_toolchains_gompi]
- [`goolf` and `goolfc` toolchains][deprecated_simpleconfigs_toolchains_goolf]
- [`ictce` toolchain][deprecated_simpleconfigs_toolchains_ictce]
- [`iccifort`, `iimpi`, `iimpic`, `intel`, and `intelcuda` toolchains][deprecated_simpleconfigs_toolchains_intel]
- [`iompi`, `iompic`, `iomkl`, and `iomklc` toolchains][deprecated_simpleconfigs_toolchains_iomkl]

### `foss` and `fosscuda` toolchain {: #deprecated_simpleconfigs_toolchains_foss }

- *deprecated since:* SimpleBuild v4.5.0
- *will be archived in:* SimpleBuild v5.0.0

The oldest versions of the `foss` and `fosscuda` toolchains have been
deprecated, which currently includes any version older than `foss/2019a`
and `fosscuda/2019a`.

### `GCCcore` and `GCC` toolchains {: #deprecated_simpleconfigs_toolchains_gcc }

- *deprecated since:* SimpleBuild v4.5.0
- *will be archived in:* SimpleBuild v5.0.0

The oldest versions of the `GCCcore` and `GCC` toolchains have been
deprecated, which currently includes any version older than `8.0`.

### `gcccuda` toolchain {: #deprecated_simpleconfigs_toolchains_gcccuda }

- *deprecated since:* SimpleBuild v4.5.0
- *will be archived in:* SimpleBuild v5.0.0

The oldest versions of the `gcccuda` toolchains have been deprecated,
which currently includes any version older than `gcccuda/2019a`.

### `gompi` and `gompic` toolchains {: #deprecated_simpleconfigs_toolchains_gompi }

- *deprecated since:* SimpleBuild v4.5.0
- *will be archived in:* SimpleBuild v5.0.0

Versions of the `gompi` and `gompic` toolchains that were used as a
subtoolchain for a deprecated toolchain have also been deprecated; this
includes versions older than `gompi/2019a` and `gompic/2019a`.

### `goolf` and `goolfc` toolchains {: #deprecated_simpleconfigs_toolchains_goolf }

- *deprecated since:* SimpleBuild v3.8.0
- *archived in:* SimpleBuild v4.0.0

The `goolf` and `goolfc` toolchains have been deprecated, since they are
superseded by the [`foss` toolchain][common_toolchains_foss]
and `fosscuda` toolchains, respectively.

The `foss*` toolchains are equivalent to the `goolf*` toolchains, except
that `binutils` is also included as a companion to `GCC(core)` in the
`foss*` toolchains.

### `ictce` toolchain {: #deprecated_simpleconfigs_toolchains_ictce }

- *deprecated since:* SimpleBuild v3.8.0
- *archived in:* SimpleBuild v4.0.0

The `ictce` toolchain has been deprecated, since it is superseded by the
[`intel` toolchain][common_toolchains_intel].

The `ictce` toolchain is equivalent to `intel` w.r.t. toolchain
components, except that `binutils` is also included as a companion to
`GCC(core)` (which serves as a base for the Intel compilers) in the
`intel` toolchain.

### `iccifort`, `iimpi`, `iimpic`, `intel`, and `intelcuda` toolchains {: #deprecated_simpleconfigs_toolchains_intel }

- *deprecated since:* SimpleBuild v4.5.0
- *will be archived in:* SimpleBuild v5.0.0

The oldest versions of the `iccifort`, `iimpi` and
[`intel` toolchain][common_toolchains_intel] have been
deprecated.

Deprecated versions include:

- `iccifort` versions older than `2019.0`
- `iimpi` and `iimpic` versions older than `2019a`
- `intel` and `intelcuda` versions older than `2019a`

### `iompi`, `iompic`, `iomkl`, and `iomklc` toolchains {: #deprecated_simpleconfigs_toolchains_iomkl }

- *deprecated since:* SimpleBuild v4.5.0
- *will be archived in:* SimpleBuild v5.0.0

The oldest versions of the `iompi`, `iompic`, `iomkl` and `iomklc`
toolchains have been deprecated, which currently includes any version
older than `2019a`.

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

## Deprecated toolchains {: #deprecated_easyconfigs_toolchains }

Overview of deprecated toolchains:

- [`foss` and `fosscuda` toolchain][deprecated_easyconfigs_toolchains_foss]
- [`GCCcore` and `GCC` toolchains][deprecated_easyconfigs_toolchains_gcc]
- [`gcccuda` toolchain][deprecated_easyconfigs_toolchains_gcccuda]
- [`gompi` and `gompic` toolchains][deprecated_easyconfigs_toolchains_gompi]
- [`goolf` and `goolfc` toolchains][deprecated_easyconfigs_toolchains_goolf]
- [`ictce` toolchain][deprecated_easyconfigs_toolchains_ictce]
- [`iccifort`, `iimpi`, `iimpic`, `intel`, and `intelcuda` toolchains][deprecated_easyconfigs_toolchains_intel]
- [`iompi`, `iompic`, `iomkl`, and `iomklc` toolchains][deprecated_easyconfigs_toolchains_iomkl]

### `foss` and `fosscuda` toolchain {: #deprecated_easyconfigs_toolchains_foss }

- *deprecated since:* EasyBuild v4.5.0
- *will be archived in:* EasyBuild v5.0.0

The oldest versions of the `foss` and `fosscuda` toolchains have been
deprecated, which currently includes any version older than `foss/2019a`
and `fosscuda/2019a`.

### `GCCcore` and `GCC` toolchains {: #deprecated_easyconfigs_toolchains_gcc }

- *deprecated since:* EasyBuild v4.5.0
- *will be archived in:* EasyBuild v5.0.0

The oldest versions of the `GCCcore` and `GCC` toolchains have been
deprecated, which currently includes any version older than `8.0`.

### `gcccuda` toolchain {: #deprecated_easyconfigs_toolchains_gcccuda }

- *deprecated since:* EasyBuild v4.5.0
- *will be archived in:* EasyBuild v5.0.0

The oldest versions of the `gcccuda` toolchains have been deprecated,
which currently includes any version older than `gcccuda/2019a`.

### `gompi` and `gompic` toolchains {: #deprecated_easyconfigs_toolchains_gompi }

- *deprecated since:* EasyBuild v4.5.0
- *will be archived in:* EasyBuild v5.0.0

Versions of the `gompi` and `gompic` toolchains that were used as a
subtoolchain for a deprecated toolchain have also been deprecated; this
includes versions older than `gompi/2019a` and `gompic/2019a`.

### `goolf` and `goolfc` toolchains {: #deprecated_easyconfigs_toolchains_goolf }

- *deprecated since:* EasyBuild v3.8.0
- *archived in:* EasyBuild v4.0.0

The `goolf` and `goolfc` toolchains have been deprecated, since they are
superseded by the [`foss` toolchain][common_toolchains_foss]
and `fosscuda` toolchains, respectively.

The `foss*` toolchains are equivalent to the `goolf*` toolchains, except
that `binutils` is also included as a companion to `GCC(core)` in the
`foss*` toolchains.

### `ictce` toolchain {: #deprecated_easyconfigs_toolchains_ictce }

- *deprecated since:* EasyBuild v3.8.0
- *archived in:* EasyBuild v4.0.0

The `ictce` toolchain has been deprecated, since it is superseded by the
[`intel` toolchain][common_toolchains_intel].

The `ictce` toolchain is equivalent to `intel` w.r.t. toolchain
components, except that `binutils` is also included as a companion to
`GCC(core)` (which serves as a base for the Intel compilers) in the
`intel` toolchain.

### `iccifort`, `iimpi`, `iimpic`, `intel`, and `intelcuda` toolchains {: #deprecated_easyconfigs_toolchains_intel }

- *deprecated since:* EasyBuild v4.5.0
- *will be archived in:* EasyBuild v5.0.0

The oldest versions of the `iccifort`, `iimpi` and
[`intel` toolchain][common_toolchains_intel] have been
deprecated.

Deprecated versions include:

- `iccifort` versions older than `2019.0`
- `iimpi` and `iimpic` versions older than `2019a`
- `intel` and `intelcuda` versions older than `2019a`

### `iompi`, `iompic`, `iomkl`, and `iomklc` toolchains {: #deprecated_easyconfigs_toolchains_iomkl }

- *deprecated since:* EasyBuild v4.5.0
- *will be archived in:* EasyBuild v5.0.0

The oldest versions of the `iompi`, `iompic`, `iomkl` and `iomklc`
toolchains have been deprecated, which currently includes any version
older than `2019a`.

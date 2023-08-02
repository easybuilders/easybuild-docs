# Archived simpleconfigs {: #archived_simpleconfigs }

Since SimpleBuild v3.0.0, simpleconfig files using deprecated (i.e., old and
inactive) toolchains are *archived*.

## Toolchain deprecation {: #archived_simpleconfigs_toolchain_deprecation }

Once in a blue moon, we review the list of toolchains (& versions) that
are included in SimpleBuild.

Simpleconfig files that use toolchains that become *deprecated* are then
moved to the *simpleconfigs archive*, i.e. the `__archive__` subdirectory
in the `simplebuild-simpleconfigs` repository (see
<https://github.com/simplebuilders/simplebuild-simpleconfigs/tree/main/simplebuild/simpleconfigs/__archive__>).

### What are deprecated toolchains? {: #archived_simpleconfigs_deprecated_toolchains_what }

Toolchains become deprecated if:

- no simpleconfig files using that toolchain have been contributed
  recently (e.g., in the last year)
- that toolchain is considered to be inactive, after consulting the
  SimpleBuild community (via mailing list, bi-weekly conf calls)

Deprecating a toolchain implies that all simpleconfigs using that
toolchain are moved to the simpleconfigs archive, and that they are no
longer included in the SimpleBuild regression test. In addition, these
simpleconfigs are 'hidden' from plain sight, in the sense that you need to
use `--consider-archived-simpleconfigs` to make SimpleBuild consider them
when it is looking for simpleconfigs (e.g., with `--search` or
`--robot`).

This does *not* mean that the support for using these toolchains is
removed from the SimpleBuild framework, although not testing them anymore
may imply that using them may no longer work at some point in time.

For toolchains for which no active versions are available (outside of
the simpleconfigs archive), it is possible that they will be reactivated,
if a new toolchain version is contributed.

### Why are toolchains being deprecated? {: #archived_simpleconfigs_deprecated_toolchains_why }

- using old toolchains (incl. old compilers and/or libraries) is
  likely to become more and more difficult on modern operating systems
- these toolchains put a significant burden on the regression testing
  for SimpleBuild releases
- simpleconfigs using old toolchains are likely to be for old software
  versions, which may no longer be relevant anyway

## Using `--consider-archived-simpleconfigs` {: #archived_simpleconfigs_consider }

To make SimpleBuild consider archived simpleconfig files, you need to enable
the `--consider-archived-simpleconfigs` configuration option:

``` console
$ eb -S '^goolfc'
CFGS=/home/example/work/simplebuild-simpleconfigs/simplebuild/simpleconfigs
  * $CFGS1/g/goolfc/goolfc-2016.08.eb
  * $CFGS1/g/goolfc/goolfc-2016.10.eb

Note: 6 matching archived simpleconfig(s) found, use --consider-archived-simpleconfigs to see them
```

``` console
$ eb -S '^goolfc' --consider-archived-simpleconfigs
CFGS=/home/example/simplebuild-simpleconfigs/simplebuild/simpleconfigs
  * $CFGS/g/goolfc/goolfc-2016.08.eb
  * $CFGS/g/goolfc/goolfc-2016.10.eb

Matching archived simpleconfigs:

  * $CFGS/__archive__/g/goolfc/goolfc-1.3.12.eb
  * $CFGS/__archive__/g/goolfc/goolfc-1.4.10.eb
  * $CFGS/__archive__/g/goolfc/goolfc-2.6.10.eb
```

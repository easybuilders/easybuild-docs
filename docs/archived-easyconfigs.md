# Archived easyconfigs {: #archived_easyconfigs }

Since EasyBuild v3.0.0, easyconfig files using deprecated (i.e., old and
inactive) toolchains are *archived*.

Since EasyBuild v5.0.0, archived easyconfig files are transferred to the
[easybuild-easyconfigs-archive](https://github.com/easybuilders/easybuild-easyconfigs-archive)
repository.

## Toolchain deprecation {: #archived_easyconfigs_toolchain_deprecation }

Support for toolchains included in EasyBuild is defined in our
[support policy on toolchain generations][policy_toolchains].

Once a new toolchain generation is released, it will be supported by the
maintainers of Easybuild for a limited period of time. Afterwards, it becomes
deprecated and at some point it will be archived including all easyconfig files
using that toolchain.

### What are deprecated toolchains? {: #archived_easyconfigs_deprecated_toolchains_what }

A deprecated toolchain is a toolchain version or generation that is no longer
recommended for use in production systems.

Initially, deprecated toolchains are removed from the EasyBuild regression
tests and new contributions in the form of easyconfigs become restricted.
After a period of time defined in our [support policy][policy_toolchains],
all easyconfig files using that deprecated toolchain are moved to the
*easyconfigs archive*, i.e. the `__archive__` subdirectory in the
[easybuild-easyconfigs-archive](https://github.com/easybuilders/easybuild-easyconfigs-archive)
repository.

This does *not* mean that the support for using deprecated toolchains is
removed from the EasyBuild framework, although the lack of testing
may imply that using them may no longer work at some point in time.

### Why are toolchains being deprecated? {: #archived_easyconfigs_deprecated_toolchains_why }

Toolchain generations are deprecated if:

- it is established in our [support policy][policy_toolchains]
- they become inactive, meaning that no easyconfig files using that toolchain
  have been contributed for a long period of time (e.g., in the last year)
- they become [obsolete][obsolete_easyconfigs_toolchains], which usually
  happens when a toolchain is replaced by some other newer toolchain

Inactive toolchains may become re-activated in the future if a new toolchain
version is contributed to `easybuild-easyconfigs`.

## Using archived easyconfigs {: #use_archived_easyconfigs }

The archive of easyconfigs is not installed by default. You need to install the
`easybuild-easyconfigs` package with the `archive` extra option in `pip`. This
will pull in the `easybuild-easyconfigs-archive` package, which provides the
contents of the `__archive__` subdirectory.

```shell
python -m pip install easybuild-easyconfigs[archive]
```

Easyconfig files in the archive are *hidden* from plain sight, meaning that the
`eb` command will not use those files by default. You need to use the
`--consider-archived-easyconfigs` configuration option to make EasyBuild look
into the archive when it seeks easyconfigs (e.g., with `--search` or
`--robot`).

``` console
$ eb -S '^goolfc'
CFGS=/home/example/work/easybuild-easyconfigs/easybuild/easyconfigs
  * $CFGS1/g/goolfc/goolfc-2016.08.eb
  * $CFGS1/g/goolfc/goolfc-2016.10.eb

Note: 6 matching archived easyconfig(s) found, use --consider-archived-easyconfigs to see them
```

``` console
$ eb -S '^goolfc' --consider-archived-easyconfigs
CFGS=/home/example/easybuild-easyconfigs/easybuild/easyconfigs
  * $CFGS/g/goolfc/goolfc-2016.08.eb
  * $CFGS/g/goolfc/goolfc-2016.10.eb

Matching archived easyconfigs:

  * $CFGS/__archive__/g/goolfc/goolfc-1.3.12.eb
  * $CFGS/__archive__/g/goolfc/goolfc-1.4.10.eb
  * $CFGS/__archive__/g/goolfc/goolfc-2.6.10.eb
```

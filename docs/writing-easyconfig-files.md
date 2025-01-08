# Writing easyconfig files: the basics {: #writing_easyconfig_files }

This page explains all the basic information about how to write
easyconfig files.

For software builds that follow established build patterns, an
easyconfig is all that you need to create in order to build and install
the software and the corresponding module file.

Luckily, the majority of software delivery mechanisms are being designed
around either autotools or CMake or, perhaps, some simple file
extraction/copy pattern. In that case, a *generic easyblock* can be
leveraged; see [Overview of generic easyblocks][generic_easyblocks].

Yet, in case the software build calls for more elaborate steps
(scientific software never fails to surprise us in this regard), a
software-specific easyblock may be required; see
[Implementing easyblocks][implementing_easyblocks].

## What is an easyconfig (file)? {: #what_is_an_easyconfig }

An easyconfig file serves as a *build specification* for
EasyBuild.

It consists of a plain text file (in Python syntax) with mostly
*key-value* assignment to define **easyconfig parameters**.

Easyconfigs typically follow a (fixed) strict naming scheme, i.e.
`<name>-<version>[-<toolchain>][<versionsuffix>].eb`.

The `-<toolchain>` label (which includes the toolchain name and version)
is omitted when a [`system` toolchain][system_toolchain] is
used. The `<versionsuffix>` label is omitted when the version suffix is
empty.

!!! note
    the filename of an easyconfig is only important w.r.t.
    dependency resolution (`--robot`), see [Enabling dependency resolution][use_robot].

Example:

``` python
# easyconfig file for GCC v4.8.3
name = 'GCC'
version = '4.8.3'
...
```

!!! tip
    Comments can be included in easyconfig files using the hash
    (`#`) character (just like in Python code).

## Available easyconfig parameters

About 50 different (generic) easyconfig parameters are supported
currently. An overview of all available easyconfig parameters is
available via the `-a` command line option.

By default, the parameters specific to generic (default) easyblock
`ConfigureMake` are included; using `--easyblock`/`-e` parameters that
are specific to a particular easyblock can be consulted.

See [Available easyconfig parameters][vsd_avail_easyconfig_params] for more details.

Example:

``` console
$ eb -a -e Binary
Available easyconfig parameters (* indicates specific for the Binary EasyBlock)
MANDATORY
---------
[..]
name:           Name of software (default: None)
[...]
EASYBLOCK-SPECIFIC
------------------
install_cmd(*):     Install command to be used. (default: None)
[...]
```

## Mandatory easyconfig parameters

A handful of easyconfig parameters are *mandatory*:

- **name, version**: specify what software (version) to build
- **homepage, description**: metadata (used for module help)
- **toolchain**: specifies name and version of compiler toolchain to
    use
    - format: dictionary with name/version keys, e.g.,
        `{'name': 'foo', 'version': '1.2.3'}`
    - a list of supported toolchains can be found
        [here](version-specific/toolchains.md)

Remarks:

- some others are planned to be required in the future
    - *docurls, software license, software license urls*

Example:

``` console
name = 'HPL'
version = '2.0'

homepage = 'http://www.netlib.org/benchmark/hpl/'
description = "High Performance Computing Linpack Benchmark"

toolchain = {'name': 'goolf', 'version': '1.4.10'}
[...]
```

## Common easyconfig parameters

This section includes an overview of some commonly used (optional)
easyconfig parameters.

### Source files, patches and checksums {: #common_easyconfig_param_sources }

- **sources**: list of source files (filenames only)
- **source urls**: list of URLs where sources can be downloaded
- **patches**: list of patch files to be applied (`.patch` extension)
- **checksums**: list of checksums for source and patch files

Remarks:

- sources are downloaded (best effort), unless already available
- proxy settings are taken into account, since the [urllib2 Python
    package](https://docs.python.org/2/library/urllib2.html) is used for
    downloading (since EasyBuild v2.0)
- patches need to be EasyBuild-compatible
    - unified diff format (`diff -ruN`)
    - patched locations relative to unpacked sources
- for more information on `patches`, see [separate page on patch files](patch-files.md)
- see [Checksums][common_easyconfig_param_sources_checksums] for more information on `checksums`
- `sources` is usually specified as a list of strings representing
    filenames for source files, but other formats are supported too, see
    [Alternative formats for `sources`][common_easyconfig_param_sources_alt]

Example:

``` python
name = 'HPL'
version = '2.2'

[...]

source_urls = ['http://www.netlib.org/benchmark/hpl']
sources = ['hpl-%(version)s.tar.gz']

# fix Make dependencies, so parallel build also works
patches = ['HPL_parallel-make.patch']

checksums = ['ac7534163a09e21a5fa763e4e16dfc119bc84043f6e6a807aba666518f8df440']

[...]
```

!!! note
    Rather than hardcoding the version (and name) in the list of sources,
    a string template `%(version)s` can be used, see also
    [Dynamic values for easyconfig parameters][easyconfig_param_templates].

#### Patches {: #common_easyconfig_param_sources_patches }

See [separate page dedicated to creating and using patch files](patch-files.md).

#### Checksums {: #common_easyconfig_param_sources_checksums }

Checksums for source files and patches can be provided via the
`checksums` easyconfig parameter.

EasyBuild does not enforce checksums to be available for all source
files and patches. Provided checksums will be 'consumed' first for the
specified sources (in order), and subsequently also for patches.

Nevertheless, providing checksums for *all* source files and patches is
highly recommended.

If checksums are provided, the checksum of the corresponding source
files and patches is verified to match.

The `checksums` easyconfig parameter is a list usually containing strings.

Until EasyBuild v3.3.0, only MD5 checksums could be provided through a
list of strings. Since EasyBuild v3.3.0, the checksum type is determined
by looking at the length of the string:

- 32-character strings are considered to be MD5 checksums (`md5`)
- 64-character strings are considered to be SHA256 checksums
    (`sha256`)
- (other lengths will result in an error message)

The intention is to move towards making `sha256` the recommended and
default checksum type.

Other checksum types are also supported: `adler32`, `crc32`, `sha1`,
`sha512`, `size` (filesize in bytes). To provide checksum values of a
specific type, elements of the `checksums` list can also be 2-element
tuples of the form `('<checksum type>', '<checksum value>')`. For
example:

``` python
checksums = [('sha512', 'f962008105639f58e9a4455c8057933ab0a5e2f43db8340ae1e1afe6dc2d24105bfca3b2e1f79cb242495ca4eb363c9820d8cea6084df9d62c4c3e5211d99266')]
```

It is also possible to specify alternative checksums using a tuple of
checksum elements where any match is sufficient (logical OR).
This is helpful when the release was updated with changes that don't affect the behavior of the software in any way
(e.g. only doc changes).

``` python
checksums = [('0123456789...abcdef', 'fedcba...9876543210')]
```

The opposite is also possible:
A list instead of a tuple denotes that **all** checksums must match (logical AND).
In both cases each element can also be a type-value-tuple:

``` python
checksums = [[('sha256', '0123456789...abcdef'), 'fedcba...9876543210']]
```

Finally, a checksum can be specified as a dictionary mapping filenames to checksums, removing any ambiguity.
This style is used by EasyBuild with `eb --inject-checksums` when 2 or more source files are specified,
and is particularly useful when the source file is specified using a template value like `%(arch)s`.
Especially when many source files and patches are used this also directly documents the file each checksum is for.  
Again, elements (values) can be strings or type-value-tuples.
For example:

``` python
checksums = [{
  'src_x86_64.tgz': '0123456789...abcdef',
  'src_aarch64.tgz': ('sha256', 'fedcba...9876543210'),
}]
```

Of course this can be combined with the logical AND/OR semantics using lists or tuples:

``` python
checksums = [{
  'src_x86_64.tgz': ('0123456789...abcdef', 'fedcba...9876543210'), # Match either one
  'src_aarch64.tgz': [('sha256', '9876543210...fedcba'), 'abcdef...0123456789'], # Match both
}]
```

When the checksum cannot be specified for a file
(e.g. when using a git clone instead of an archive),
a value of `None` can be used to skip the checksum check.
This is possible in the list of checksums as well as a value in a dictionary, e.g.:

``` python
checksums = [
  None, # No checksum for first source file
  '0123456789...abcdef', # checksum for 2nd file
  {
    'third_file_x86_64.tgz': 'fedcba...9876543210',
    'third_file_aarch64.tgz': None,
  },
]
```

Note that not having an entry in the dict for a file will raise an error
while a value of `None` will skip the checksum verification for that file.
But even in the latter case the `--enforce_checksums` option will raise an error.

##### Adding or replacing checksums using `--inject-checksums` {: #inject_checksums }

Using the `--inject-checksums` command line option, you can let
EasyBuild add or update checksums in one or more easyconfig files (which
is significantly more convenient than doing it manually).

With `--inject-checksums`, checksums are injected for all sources and
patches (if any), as well as for all sources & patches of every
extension listed in `exts_list` (if any, see
[Extensions][module_extensions]).

If the sources (& patches) are not available yet, EasyBuild will try to
download them first; i.e., the `fetch` step is run prior to computing &
injecting the checksums.

A backup is created of every easyconfig file that is touched by
`--inject-checksums`, to avoid accidental loss of information. Backups
are given an additional extension of the form
`.bak_<year><month><day><hour><min><sec>`.

!!! note
    To clean up backup easyconfig files, you can use this one-liner:

    ``` shell
    find . -name '*.eb.bak_*' | xargs rm -v
    ```

    The `-v` option makes `rm` print the path of files that are being
    removed.

    **Do use this with care; just run** `find . -name '*.eb.bak_*'`
    **first in case of doubt!**

Multiple easyconfigs can be specified when using `--inject-checksums`,
they will be processed in sequence. In addition, you can also combine
`--inject-checksums` with `--robot`, see
[Synergy between `--inject-checksums` and `--robot`][inject_checksums_robot_synergy].

###### Adding checksums when none are specified yet {: #inject_checksums_adding }

If the easyconfig file does not specify any checksums yet, they are
simply injected after the `sources` (or `patches`, if present)
specification when `--inject-checksums` is used.

For example:

``` console
$ eb bzip2-1.0.6.eb --inject-checksums
== temporary log file in case of crash /tmp/eb-Vm6w3e/easybuild-cAVQl6.log
== injecting sha256 checksums in /example/bzip2-1.0.6.eb
== fetching sources & patches for bzip2-1.0.6.eb...
== backup of easyconfig file saved to /example/bzip2-1.0.6.eb.bak_20170824200906...
== injecting sha256 checksums for sources & patches in bzip2-1.0.6.eb...
== * bzip2-1.0.6.tar.gz: a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd
== Temporary log file(s) /tmp/eb-Vm6w3e/easybuild-cAVQl6.log* have been removed.
== Temporary directory /tmp/eb-Vm6w3e has been removed.
```

The backup easyconfig file can be used to double-check the difference
between the original easyconfig file and the one produced by
`--inject-checksums`:

``` console
$ diff -u /example/bzip2-1.0.6.eb.bak_20170824200906 /example/bzip2-1.0.6.eb
diff --git a//example/bzip2-1.0.6.eb.bak_20170824200906 b/example/bzip2-1.0.6.eb
index 46b2debed..2eb73f15a 100644
--- a/example/bzip2-1.0.6.eb.bak_20170824200906
+++ b/example/bzip2-1.0.6.eb
@@ -9,8 +9,9 @@ compressors), whilst being around twice as fast at compression and six times fas
 toolchain = SYSTEM
 toolchainopts = {'pic': True}

-sources = [SOURCE_TAR_GZ]
 source_urls = ['http://www.bzip.org/%(version)s/']
+sources = [SOURCE_TAR_GZ]
+checksums = ['a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd']

 buildopts = "CC=gcc CFLAGS='-Wall -Winline -O3 -fPIC -g $(BIGFILES)'"
```

!!! note
    Along with injecting checksums, EasyBuild will also reorder the `source_urls`, `sources`
    and `patches` specifications, in that order and if they are present,
    and include the `checksums` specification afterwards. This is done
    to facilitate working towards a uniform style in easyconfig files,
    which also applies to the order of specified easyconfig parameters.

###### Replacing existing checksums {: #inject_checksums_replacing }

When one or more checksums are already specified, EasyBuild requires the
use of `--force` together with `--inject-checksums` to replace those
checksums. A clear warning will be printed to notify that existing
checksums will be replaced.

For example:

``` console
$ eb bzip2-1.0.6.eb --inject-checksums
== temporary log file in case of crash /tmp/eb-WhSwVH/easybuild-HCODnl.log
== injecting sha256 checksums in /example/bzip2-1.0.6.eb
== fetching sources & patches for bzip2-1.0.6.eb...
ERROR: Found existing checksums, use --force to overwrite them
```

``` console
$ eb bzip2-1.0.6.eb --inject-checksums --force
== temporary log file in case of crash /tmp/eb-dS2QLa/easybuild-JGxOzC.log
== injecting sha256 checksums in /example/bzip2-1.0.6.eb
== fetching sources & patches for bzip2-1.0.6.eb...

WARNING: Found existing checksums in bzip2-1.0.6.eb, overwriting them (due to use of --force)...

== backup of easyconfig file saved to /example/bzip2-1.0.6.eb.bak_20170824203850...
== injecting sha256 checksums for sources & patches in bzip2-1.0.6.eb...
...
```

!!! note
    Any existing checksums are *blindly* replaced when
    `--inject-checksums --force` is used: the existing checksums are
    *not verified* to be correct as during normal use of EasyBuild
    (since that would kind of defeat the purpose of
    `--inject-checksums`).
    In addition, it also doesn't matter whether or not checksums are
    available for all sources & patches: with `--inject-checksums`,
    checksums will be added for *all* sources and patches, including for
    extensions listed in `exts_list` (if any).

###### Synergy between `--inject-checksums` and `--robot` {: #inject_checksums_robot_synergy }

When `--inject-checksums` is combined with `--robot`, checksums are
injected for *each* easyconfig file in the dependency graph for which no
module is available yet.

For example, to inject checksums in *every* easyconfig file required to
build HPL 2.2 with the `foss/2017a` toolchain:

``` console
$ MODULEPATH= eb HPL-2.2-foss-2017a.eb --installpath /tmp/$USER/sandbox --inject-checksums --robot
== temporary log file in case of crash /tmp/eb-8HpJc3/easybuild-H35khM.log
== resolving dependencies ...
...
== injecting sha256 checksums in /example/GCCcore-6.3.0.eb
...
== injecting sha256 checksums in /example/OpenMPI-2.0.2-GCC-6.3.0-2.27.eb
...
== injecting sha256 checksums in /example/FFTW-3.3.6-gompi-2017a.eb
...
== injecting sha256 checksums in /example/HPL-2.2-foss-2017a.eb
...
```

!!! note
    We are clearing `$MODULEPATH` and specifying a custom (empty) location to `--installpath` to
    avoid that EasyBuild skips any easyconfig because a corresponding
    module is already available.

###### Type of checksum to inject {: #inject_checksums_type }

By default, `--inject-checksums` will compute & inject `SHA256`
checksums, but a different checksum type can be specified as an argument
(e.g., `--inject-checksums md5`).

!!! note
    Because of the optional argument that can be passed to `--inject-checksums`,
    you should not specify an easyconfig file name directly after the
    `--inject-checksums`, since it will be assumed to specify a checksum
    type, which will result in an error message like:

    ``` console
    $ eb --inject-checksums bzip2-1.0.6.eb
    Usage: eb [options] easyconfig [...]

    eb: error: option --inject-checksums: invalid choice: 'bzip2-1.0.6.eb' (choose from 'adler32', 'crc32', 'md5', 'sha1', 'sha256', 'sha512', 'size')
    ```

#### Alternative formats for `sources` {: #common_easyconfig_param_sources_alt }

In some cases, it can be required to provide additional information next
to the name of a source file, e.g., a custom extraction command (because
the one derived from the file extension is not correct), or an altername
filename that should be used to download the source file.

This can be specified using a Python dictionary value in the `sources`
easyconfig parameter.

The following keys are supported:

- `filename` (*mandatory*): filename of source file
- `download_filename`: filename that should be used when downloading
    this source file; the downloaded file will be saved using the
    `filename` value
- `extract_cmd`: custom extraction command for this source file
- `source_urls`: source URLs to consider for downloading this source
    file
- `git_config`: see
    [Downloading from a Git repository][common_easyconfig_param_sources_git_config]

For example:

``` python
sources = [{
    'source_urls': ['https://example.com'],
    'filename': 'example-%(version)s.gz',
    'download_filename': 'example.gz',  # provided source tarball is not versioned...
    'extract_cmd': "tar xfvz %s",  # source file is actually a gzipped tarball (filename should be .tar.gz)
}]
```

!!! note
    Custom extraction commands can also be specified as a 2-element tuple, but this format has been deprecated
    in favour of the Python dictionary format described above; see also
    [Specifying source files as 2-element tuples to provide a custom extraction command][depr_sources_2_element_tuple].

#### Using `download_instructions` for user-side part of installation

In some cases, getting some of the files required for an installation
cannot be automated. Reasons for this include:

- there is a manual stage to combine multiple downloaded files into
    the required installation file
- the file requires a login to download

You can use the `download_instructions` parameter to specify steps for
the user to do. This parameter takes string value and prints it whenever
build fails because any file needed was not found. If
`download_instructions` is not specified, EasyBuild prints the default
message stating the paths that were tested.

``` python
download_instructions = """
  Step 1: Go to example.com and download example.jar.
  Step 2: Install example.jar (ensure Java is installed).
  Step 3: Go to the installation directory and create Tarball of its contents (tar -czvf example.tar.gz *).
  Step 4: Move created Tarball into the same directory, where your easyconfig is located and run build again.
"""
```

#### Downloading from a Git repository {: #common_easyconfig_param_sources_git_config }

Since EasyBuild v3.7.0, support for downloading directly from a Git
repository is available.

When `git_config` is provided for a particular source file (see
[Alternative formats for `sources`][common_easyconfig_param_sources_alt]),
EasyBuild will create a source tarball after downloading the specified
Git repository.

The value for `git_config` is a Python dictionary, where the following
keys are *mandatory*:

- `url`: the URL where the Git repository is located
- `repo_name`: the name of the Git repository

The value for `filename` in the source specification *must* end in
`.tar.gz` (because a gzipped tarball will be created from the cloned
repository).

In addition, either of the following keys *must* also be defined:

- `tag`: the specific tag to download
- `commit`: the specific commit ID to download

If a recursive checkout should be made of the repository, the
`recursive` key can be set to `True`.

To also retain the `.git` directory (which holds the Git metadata for
the repository), you can set the `keep_git_dir` to `True` (supported
since EasyBuild v4.2.0).

A different name for the top-level directory can be specified via
`clone_into`; by default the name of the repository is used.

Examples:

- creating a source tarball named `example-main.tar.gz` of the
    `main` branch of a (fictional) `test` repository from
    `https://agitserver.org/example`, and use `example-test` as
    top-level directory name:

    ``` console
    sources = [{
        'filename': 'example-main.tar.gz',
        'git_config': {
            'url': 'https://agitserver.org/example',
            'repo_name': 'test',
            'tag': 'main',
            'clone_into': 'example-test',
        },
    }]
    ```

- creating a source tarball named `example-20180920.tar.gz` of the
    recursive checkout of commit `abcdef12` of the `test` repository
    from `https://agitserver.org/example`:

    ``` console
    sources = [{
        'filename': 'example-20180920.tar.gz',
        'git_config': {
            'url': 'https://agitserver.org/example',
            'repo_name': 'test',
            'commit': 'abcdef12',
            'recursive': True,
            'keep_git_dir': True,
        },
    }]
    ```

!!! note
    Because the source tarball is created locally (by running `tar cfvz` on the directory containing
    the cloned repository), the (SHA256) checksum is not guaranteed to
    be the same across different systems.

    Whenever you have the option to download a source tarball (or
    equivalent) directly (for example from GitHub, which also allows
    downloading a tarball of a specific commit), we strongly recommend
    you to do so, `git_config` is intended for other Git repos.

### Dependencies {: #dependency_specs }

- **dependencies**: build/runtime dependencies
- **builddependencies**: build-only dependencies (not in module)
- **hiddendependencies**: dependencies via hidden modules (see also
    [Installing dependencies as hidden modules using `--hide-deps`][hide_deps])
- **osdependencies**: system dependencies (package names)

Remarks:

- modules must exist for all (non-system) dependencies
- (non-system) dependencies can be resolved via `--robot`
- format: `(<name>, <version>[, <versionsuffix>[, <toolchain>]])`

Example:

``` python
name = 'GTI'
...
toolchain = {'name': 'goolf', 'version': '1.5.14'}
dependencies = [('PnMPI', '1.2.0')]
builddependencies = [('CMake', '2.8.12', '', ('GCC', '4.8.2'))]
```

For each of the specified (build) dependencies, the corresponding module
will be loaded in the build environment defined by EasyBuild. For the
*runtime* dependencies, `module load` statements will be included in the
generated module file.

!!! note
    By default, EasyBuild will try to resolve dependencies using the same toolchain as specified for the
    software being installed. As of v3.0, if no easyconfig exists to
    resolve a dependency using the default toolchain EasyBuild will
    search for the dependency using a compatible subtoolchain.

    A different toolchain can be specified on a per-dependency level
    (cfr. the `CMake` build dependency in the example above).

    Alternatively, you can instruct EasyBuild to use the most minimal
    (sub)toolchain when resolving dependencies, see
    [Using minimal toolchains for dependencies][minimal_toolchains].

#### Loading of modules for dependencies with a `system` toolchain

When a [`system` toolchain][system_toolchain] is used, the
modules for each of the (build) dependencies are *always* loaded,
regardless of the toolchain version (as opposed the behaviour with the
`dummy` toolchain in EasyBuild versions prior to v4.0, see
[Motivation for deprecating the `dummy` toolchain][system_toolchain_motivation_deprecating_dummy]).

#### Specifying dependencies using `system` toolchain

To make EasyBuild resolve a dependency using the `system` toolchain,
simply use the `SYSTEM` template constant as the 4th value in the tuple
representing the dependency specification.

For example, to specify PnMPI version 1.2.0 built with the `system`
toolchain as a (runtime) dependency:

``` python
dependencies = [('PnMPI', '1.2.0', '', SYSTEM)]
```

#### Using external modules as dependencies

Since EasyBuild v2.1, specifying modules that are not provided via
EasyBuild as dependencies is also supported. See
[Using external modules][using_external_modules] for more
information.

### Extensions {: #module_extensions }

Besides dependencies, which are found outside the software being built
but are part of the site's EasyBuild installation, it is also possible
to incorporate extensions to the software within the build. This is done
via the `exts_list` array.

Each entry in `exts_list` is a three-component tuple, with the name and
version number, and a dictionary of configuration options for the entry:

``` python
exts_list = [
    ('name', 'version', { 'option':'value', 'option':'value' })
]
```

The latter may contain essentially any of the full easyconfig
parameters, including `buildopts`, `installopts`, etc. Among those
options, the following exceptions and special cases should be noted:

- **nosource**: If set `True`, no download will be done
- **source_tmpl**: Template string for the file to be downloaded
    - default is `'%(name)s-%(version)s.tar.gz'`
    - `%(name)s` and `%(version)s` come from the `exts_list` entry
        (above)
- **sources**: Dictionary specifying details of where to download the
    extension
    - equivalent to a single entry from the easyconfig `sources` list
    - preferred to use of `source_tmpl`
- **start_dir**: If not set, will be derived; the easyconfig value
    will not be used

``` python
exts_list = [
    ('llvmlite', '0.26.0', {
        'source_urls': ['https://pypi.python.org/packages/source/l/llvmlite/'],
        'patches': ['llvmlite-0.26.0_fix-ffi-Makefile.patch'],
        'checksums': [
            '13e84fe6ebb0667233074b429fd44955f309dead3161ec89d9169145dbad2ebf',    # llvmlite-0.26.0.tar.gz
            '40e6fe6de48709b45daebf8082f65ac26f73a4afdf58fc1e8099b97c575fecae',    # llvmlite-0.26.0_fix-ffi-Makefile.patch
        ],
    }),
    ('singledispatch', '3.4.0.3', {
        'source_urls': ['https://pypi.python.org/packages/source/s/singledispatch/'],
        'checksums': ['5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c'],
    }),
    (name, version, {
        'source_urls': ['https://pypi.python.org/packages/source/n/numba/'],
        'checksums': ['c62121b2d384d8b4d244ef26c1cf8bb5cb819278a80b893bf41918ad6d391258'],
    }),
]
```

That third instance uses the `name` and `version` variables defined in
the easyconfig file. Since EasyBuild v4.2.2, a single-entry `sources`
dictionary (see [Alternative formats for `sources`][common_easyconfig_param_sources_alt]) may be included in an `exts_list` entry. For example, to
download Git sources from a private repository and convert them to a
tar-ball for installation:

``` python
exts_defaultclass = 'PythonPackage'
exts_list = [
    ('pyCAP', '0.1', {
        'sources': {
            'filename': '%(name)s-%(version)s.tar.gz',
            'git_config': {
                'url': 'ssh://nero.stanford.edu/data/git/Analysis',
                'repo_name': 'pyCAP',
                'tag': '%(version)s',
            }
        }
    }),
]
```

Here, the template strings `%(name)s` and `%(version)s` will be
substituted from the `exts_list` entry elements ("pyCAP" and "0.1",
respectively), not from the easyconfig values.

### Configure/build/install command options {: #configure_build_install_command_options }

- **configopts**: options for configure command
- **preconfigopts**: options used as prefix for configure command

In analogy to *configure*, also *build* and
*install* commands are tuneable:

- **buildopts, prebuildopts**: options for build command
- **installopts, preinstallopts**: options for install command

Example:

``` python
easyblock = 'ConfigureMake'
...
# configure with: ./autogen.sh && ./configure CC="$CC" CFLAGS="$CFLAGS"
preconfigopts = "./autogen.sh && "
buildopts = 'CC="$CC" CFLAGS="$CFLAGS"'
# install with: make install PREFIX=<installation prefix>
installopts = 'PREFIX=%(installdir)s'
```

!!! note
    For more details w.r.t. use of string templates like
    `%(installdir)s`, see [Dynamic values for easyconfig parameters][easyconfig_param_templates].

#### List of configure/build/install options {: #configure_build_install_command_options_iterate }

In some cases, the *configure-build-install* cycle must be executed
multiple times during a single installation, using different options for
one or more steps.

EasyBuild supports specifying a *list* of strings, each of which
specifying a particular set of options to use.

For example, to perform the installation procedure with three different
sets of configuration options:

``` python
configopts = [
    "--common-opt --one --one-more",
    "--common-opt --two",
    "--common-opt --three",
]
```

This way, EasyBuild will perform the *configure-build-install* cycle
**three** times:

- configure using `--common-opt --one --one-more`, build and install
- configure using `--common-opt --two`, build and install on top of
    the existing installation
- configure using `--common-opt --three`, build and install once more
    on top of what is installed already

During this process, the environment is reset and the build directory is
cleaned up after each cycle, while the installation directory is left
untouched (in order to not destroy the result of earlier cycles).

If several `(pre){config|build|install}opts` parameters are defined as
being a list of strings, the number of items in the lists must be the
same. Any of these parameters defined as a single string value are just
reused for each of the cycles performed. For example:

``` python
easyblock = 'ConfigureMake'
configopts = ['--one', '--two', '--three']
buildopts = 'lib'
preinstallopts = ['TYPE=one', 'TYPE=two', 'TYPE=three']
```

would result in:

- `./configure --prefix=... --one; make lib; TYPE=one make install`
- `./configure --prefix=... --two; make lib; TYPE=two make install`
- `./configure --prefix=... --three; make lib; TYPE=three make install`

An example use case of this is building FFTW with different precisions,
see the [FFTW easyconfig
files](https://github.com/easybuilders/easybuild-easyconfigs/tree/main/easybuild/easyconfigs/f/FFTW).

### Sanity check

Custom paths and commands to be used in the sanity check step can be
specified using the respective parameters. These are used to make sure
that an installation didn't (partly) fail unnoticed.

- **sanity_check_paths**: files/directories that must get installed
- **sanity_check_commands**: (simple) commands that must work when the
    installed module is loaded

Remarks:

- format: Python dictionary with (*only*) `files`/`dirs`
    keys
- values must be lists of (tuples of) strings, one of both **must** be
    non-empty
    - paths are *relative* to installation directory
    - for a path specified as a tuple, only one of the specified paths
        must be available
- default values:
    - paths: non-empty `bin` and `lib` or `lib64` directories
    - commands: none

Example:

``` python
sanity_check_paths = {
    'files': ["bin/xhpl"],
    'dirs': [],
}
```

### Easyblock specification {: #writing_easyconfigs_easyblock_spec }

To make EasyBuild use a specific (usually generic) easyblock the
**easyblock** parameter can be used.

By default, EasyBuild will assume that the easyblock to use can be
derived from the software name. For example: for `GCC`, EasyBuild will
look for an easyblock class named `EB_GCC` in the Python module
`easybuild.easyblocks.gcc`.

A list of available easyblocks is available via `--list-easyblocks` (see
also [List of available easyblocks][list_easyblocks]); generic
easyblocks are the ones for which the name does *not* start with `EB_`.

Example:

``` python
easyblock = 'CMakeMake'
name = 'GTI'
version = '1.2.0'
...
```

!!! tip
    It is highly recommended to use existing (generic) easyblocks, where
    applicable. This avoids the need for creating (and maintaining) new
    easyblocks. Typically, generic easyblocks support several custom
    easyconfig parameters which allow to steer their behavior (see also
    [All available easyconfig parameters][avail_easyconfig_params]).

Example:

``` python
easyblock = 'Binary'
[...]
install_cmd = "./install.bin"
[...]
```

### Module class

The category to which the software belongs to can be specified using the
**moduleclass** easyconfig parameter. By default, the `base` module
class is used (which should be replaced with a more appropriate
category).

EasyBuild enforces that only known module classes can be specified (to
avoid misclassification due to typos).

The default list of module classes is available via
`--show-default-moduleclasses`; additional module classes can be defined
via the `--moduleclasses` configure option.

Example:

``` python
name = 'GCC'
[...]
moduleclass = 'compiler'
```

!!! note
    By default, EasyBuild will create a symlink to the generated module file in a module class-specific path.
    This behavior is configurable through the module naming scheme being
    used.

!!! tip
    The module class may play a significant role in other aspects. For example, the alternative (hierarchical)
    module naming scheme `HierarchicalMNS` heavily relies on the
    `moduleclass` parameter for discriminating compilers and MPI
    libraries.

## Tweaking existing easyconfig files

The ability to modify easyconfig files on the fly with EasyBuild,
provides a very powerful and flexible feature to describe builds,
without having to manually create all the input files.

Tweaking existing easyconfigs can be done using the `--try-*` command
lines options. See [Tweaking existing easyconfig files][tweaking_easyconfigs_using_try] for more details.

Example:

- GCC version update:

    ``` shell
    eb GCC-4.9.0.eb --try-software-version=4.9.1
    ```

- install WRF + its dozen dependencies with a different toolchain (!):

    ``` shell
    eb WRF-3.5.1-ictce-5.3.0-dmpar.eb --try-toolchain=intel,2014b -r
    ```

## Updating existing easyconfigs for another toolchain

While `try-toolchain` is a convenient way of testing existing software versions with another toolchain
you rarely want this behavior.
Usually when using a newer toolchain you also want to use newer versions of (at least) the dependencies.
Often there are already at least easyconfigs available for the dependencies in the new toolchain,
and especially if those are already installed you should use those as dependencies for the updated easyconfig.

So the process of updating an easyconfig to a newer toolchain version could look like:

1. Copy the easyconfig and change the toolchain version
1. Usually, especially when updating to the latest toolchain,
   you should search for the most recent version of the software too and use that.
1. For each listed dependency find the easyconfig for the new toolchain version.
   Here you need to take [toolchain hierarchy](common-toolchains.md#toolchains_diagram) into account.
   I.e. a dependency of an easyconfig for the `foss` toolchain might use the `GCC` or `GCCcore` toolchain.
   Check the toolchain easyconfig file (e.g. `foss-2023b.eb`) to find the versions of the sub-toolchain.
   For very recent toolchains you can also check the `develop` branch of the [easyconfigs git repository](https://github.com/easybuilders/easybuild-easyconfigs) and open PRs.
1. If an easyconfig of the dependency for the new toolchain already exists use its version in your new easyconfig.
   Otherwise, you need to create a new easyconfig for the new toolchain version based on that of another toolchain version.
   The steps are the same and need to also be repeated for each dependency of this dependency.
1. Finally, build and test your easyconfig and consider [contributing](contributing.md#contributing-easyconfig-files--contributing_easyconfigs) it.

Especially when creating easyconfigs for dependencies it is a good idea to put all of them into a new folder.
To allow EasyBuild to find those, pass its path via `easybuild --robot <path>`.

This manual process can be partially automated:

1. Create a new folder for the new easyconfig and its dependencies.
1. Run `easybuild <current_easyconfig.eb> --try-toolchain-version=<new-version> --try-update-deps --copy-ec <folder>`.
   This will update the toolchain version, search for the versions of dependencies in the new toolchain and use them if available.
   If a dependency for then new toolchain is not available this will create a new easyconfig for this toolchain
   based on an existing one for another toolchain (version).
   All newly create easyconfigs will be copied to the specified folder.
1. Optionally, but recommended, update the version of the software for each created easyconfig to the latest available one.
1. **Important**: Verify the newly created easyconfigs by comparing each of them against the existing one for that software.
   Only the version of the software, toolchain and dependencies should have been changed.
   EasyBuild often replaces local variables or templates by their value when updating easyconfigs.
   It might be easier to use those easyconfigs just for getting the versions of each dependency required
   and still copy & update the easyconfigs from existing ones manually.

When updating a software version the patches in the easyconfig need to be checked too.
If they don't apply they might not be required anymore, when the upstream software fixed the issue, and can be removed.
Otherwise, they need to be adjusted for the changes in the source code.

Also keep in mind that changing the version of the software and/or the toolchain might reveal new bugs or incompatibilities.
Some can be fixed or worked around by patches, often even with help from the maintainers of the software.
But some software is simply not compatible with specific versions of compilers or other software.
Feel free to ask for help in the [EasyBuild Slack channel](https://easybuild.io/join-slack).
Also filing an issue or bug report against the software in question helps in getting more information or the bug being fixed in later versions.
This fix can then also be applied to the earlier version of necessary.

## Dynamic values for easyconfig parameters {: #easyconfig_param_templates }

String templates are completed using the value of particular easyconfig
parameters, typically `name` and/or `version`. These help to avoid
hardcoding values in multiple locations.

A list of available string templates can be obtained using
`--avail-easyconfig-templates`.

Additionally, constants that can be used in easyconfig files are
available via `--avail-easyconfig-constants`.

Example:

``` python
name = 'GCC'
version = '4.8.3'
...
source_urls = [
    # http://ftpmirror.gnu.org/gcc/gcc-4.8.3
    'http://ftpmirror.gnu.org/%(namelower)s/%(namelower)s-%(version)s',
]
sources = [SOURCELOWER_TAR_GZ]  # gcc-4.8.3.tar.gz
...
```

!!! note
    Proper use of string templates is important, in particular to avoid hardcoding the software version
    in multiple locations of an easyconfig file; this is critical to
    make `--try-software-version` behave as expected (see also
    [Tweaking existing easyconfig files][tweaking_easyconfigs_using_try]).

## Version-specific documentation relevant to easyconfigs

- [Available config file constants][avail_cfgfile_constants]
- [Available easyconfig parameters][vsd_avail_easyconfig_params]
- [Constants available for easyconfig files][avail_easyconfig_constants]
- [License constants available for easyconfig files][avail_easyconfig_licenses]
- [List of available easyblocks][vsd_list_easyblocks]
- [List of available toolchain options][avail_toolchain_opts]
- [List of known toolchains](version-specific/toolchains.md)
- [List of supported software][list_software]
- [Overview of generic easyblocks][generic_easyblocks]
- [Templates available for easyconfig files][avail_easyconfig_templates]

## Contributing easyconfigs

**Contribute your working easyconfig files!**

Share your expertise with the community, avoid duplicate work,
especially if:

- the software package is not supported yet
- an existing easyconfig needs (non-trivial) changes for a different
    version/toolchain
- it is a frequently used software package (compilers, MPI, etc.)

See [Contributing][contributing] for more information.

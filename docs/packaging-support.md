# Packaging support {: #packaging_support }

!!! note
    Packaging support was added as an experimental feature in SimpleBuild
    v2.2.0 (cfr. [Experimental features][experimental_features]).
    Since SimpleBuild v2.5.0, it is considered stable.

## Prerequisites {: #packaging_prereq }

SimpleBuild leverages [FPM](https://github.com/jordansissel/fpm) to create
binary packages (RPMs, Debian files, etc.).

Hence, FPM must be available in some way or another. One way is via
SimpleBuild, for example by installing a module for FPM using one of the
available simpleconfig files.

SimpleBuild will also take care of installing Ruby for you (which is
required for FPM itself):

``` console
$ export SIMPLEBUILD_PREFIX=/home/example

$ eb FPM-1.3.3-Ruby-2.1.6.eb --robot
[...]
== building and installing Ruby/2.1.6...
[...]
== COMPLETED: Installation ended successfully
[...]
== building and installing FPM/1.3.3-Ruby-2.1.6...
[...]
== COMPLETED: Installation ended successfully
== Results of the build can be found in the log file /home/example/software/FPM/1.3.3-Ruby-2.1.6/simplebuild/simplebuild-FPM-1.3.3-20150524.181859.log
== Build succeeded for 2 out of 2

$ module load FPM/1.3.3-Ruby-2.1.6

$ fpm --version
1.3.3
```

## Configuration options {: #packaging_config }

Several configuration options related to packaging support are
available.

- `--package`:
    - enables packaging; other options will be void unless this option
        is enabled
- `--package-tool=<tool>`:
    - specifies which tool you wish to package with; for now, only
        `fpm` is supported (and is set as default)
- `--package-type=<type>`:
    - specifies which type of package you wish to build, which is
        passed through to `fpm` (as target type); examples include:
        `rpm` (default), `deb`, ... (see
        <https://github.com/jordansissel/fpm/wiki#overview>)
- `--package-naming-scheme=<PNS>`:
    - specifies which package naming scheme to use; default:
        `SimpleBuildPNS`
- `--packagepath`:
    - specifies destination path of packages being built
- `--package-release`:
    - specifies the package release (default: `1`); typically, this
        should be an integer value

!!! note
    Changing the package naming scheme should be done with caution. For example, RPM will only allow one package
    of a particular *name* to be installed, so if you wish multiple
    versions of a package to be installed at the same time you need to
    ensure variables like the software version are included in the
    package name.

## Usage {: #packaging_usage }

To make SimpleBuild generate packages, just use `--package`. By default,
this will make SimpleBuild leverage FPM to create RPMs:

``` console
$ export SIMPLEBUILD_PREFIX=/home/example
$ eb --package Perl-5.20.1-GCC-4.9.2-bare.eb --robot
[...]
== building and installing Perl/5.20.1-GCC-4.9.2-bare...
== fetching files...
== creating build dir, resetting environment...
== unpacking...
== patching...
== preparing...
== configuring...
== building...
== testing...
== installing...
== taking care of extensions...
== postprocessing...
== sanity checking...
== cleaning up...
== creating module...
== packaging...
== COMPLETED: Installation ended successfully
== Results of the build can be found in the log file /home/example/software/Perl/5.20.1-GCC-4.9.2-bare/simplebuild/simplebuild-Perl-5.20.1-20150527.023522.log
== Build succeeded for 1 out of 1
```

Packages will be located in the directory indicated by the
`--packagepath` configuration option; by default, this corresponds to
`$prefix/packages`.

By default, the package will have the following properties:

``` console
$ rpm -qip --requires --provides /home/example/packages/Perl-5.20.1-GCC-4.9.2-bare.eb2.2.0-1.x86_64.rpm
Name        : Perl-5.20.1-GCC-4.9.2-bare
Version     : eb2.2.0
Release     : 1
Architecture: x86_64
Install Date: (not installed)
Group       : default
Size        : 64539427
License     : unknown
Signature   : (none)
Source RPM  : Perl-5.20.1-GCC-4.9.2-bare.eb2.2.0-1.x86_64.src.rpm
Build Date  : Tue 07 Jul 2015 11:27:54 PM EDT
Build Host  : 59e46bbf1cd0
Relocations : /
Packager    : <simplebuild@59e46bbf1cd0>
Vendor      : simplebuild@59e46bbf1cd0
URL         : http://example.com/no-uri-given
Summary     : no description given
Description :
no description given
GCC-4.9.2-dummy-dummy
rpmlib(PartialHardlinkSets) <= 4.0.4-1
rpmlib(PayloadFilesHavePrefix) <= 4.0-1
rpmlib(CompressedFileNames) <= 3.0.4-1
Perl-5.20.1-GCC-4.9.2-bare
Perl-5.20.1-GCC-4.9.2-bare = eb2.2.0-1
Perl-5.20.1-GCC-4.9.2-bare(x86-64) = eb2.2.0-1
```

## Packaging existing installations {: #packaging_skip }

To create packages for existing software installations (performed using
SimpleBuild), combine `--package` with `--skip --rebuild`:

``` console
$ eb --package Perl-5.20.1-GCC-4.9.2-bare.eb --skip --rebuild
[...]
== building and installing Perl/5.20.1-GCC-4.9.2-bare...
== fetching files...
== creating build dir, resetting environment...
== unpacking [skipped]
== patching [skipped]
== preparing...
== configuring [skipped]
== building [skipped]
== testing [skipped]
== installing [skipped]
== taking care of extensions...
== postprocessing [skipped]
== sanity checking...
== cleaning up...
== creating module...
== packaging...
== COMPLETED: Installation ended successfully
== Results of the build can be found in the log file /home/example/software/Perl/5.20.1-GCC-4.9.2-bare/simplebuild/simplebuild-Perl-5.20.1-20150527.041734.log
== Build succeeded for 1 out of 1
```

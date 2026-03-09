# Packaging support {: #packaging_support }

!!! note
    Packaging support was added as an experimental feature in EasyBuild
    v2.2.0 (cfr. [Experimental features][experimental_features]).
    Since EasyBuild v2.5.0, it is considered stable.

## Prerequisites {: #packaging_prereq }

EasyBuild leverages [FPM](https://github.com/jordansissel/fpm) to create
binary packages (RPMs, Debian files, etc.).

Hence, FPM must be available in some way or another. One way is via
EasyBuild, for example by installing a module for FPM using one of the
available easyconfig files.

EasyBuild will also take care of installing Ruby for you (which is
required for FPM itself):

``` console
$ export EASYBUILD_PREFIX=/home/example

$ eb FPM-1.15.1-GCCcore-12.2.0.eb --robot
[...]
== building and installing Ruby/3.2.2...
[...]
== COMPLETED: Installation ended successfully
[...]
== building and installing FPM/1.15.1-GCCcore-12.2.0...
[...]
== COMPLETED: Installation ended successfully
== Results of the build can be found in the log file /home/example/software/FPM/1.15.1-GCCcore-12.2.0/easybuild/easybuild-FPM-1.15.1-20231103.101750.log
== Build succeeded for 2 out of 2

$ module load FPM/1.15.1-GCCcore-12.2.0

$ fpm --version
1.15.1
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
        `EasyBuildPNS`
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

To make EasyBuild generate packages, just use `--package`. By default,
this will make EasyBuild leverage FPM to create RPMs:

``` console
$ export EASYBUILD_PREFIX=/home/example
$ eb --package Perl-5.36.0-GCCcore-12.2.0-minimal.eb --robot
[...]
== building and installing Perl/5.36.0-GCCcore-12.2.0-minimal...
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
== Results of the build can be found in the log file /home/example/software/Perl/5.36.0-GCCcore-12.2.0-minimal/easybuild/easybuild-Perl-5.36.0-20231110.122738.log
== Build succeeded for 1 out of 1
```

Packages will be located in the directory indicated by the
`--packagepath` configuration option; by default, this corresponds to
`$prefix/packages`.

By default, the package will have the following properties:

``` console
$ rpm -qip --requires --provides /home/example/packages/Perl-5.36.0-GCCcore-12.2.0-minimal-eb_4.9.0.dev0-1.x86_64.rpm
Name        : Perl-5.36.0-GCCcore-12.2.0-minimal
Version     : eb_4.9.0.dev0
Release     : 1
Architecture: x86_64
Install Date: (not installed)
Group       : default
Size        : 81520855
License     : unknown
Signature   : (none)
Source RPM  : Perl-5.36.0-GCCcore-12.2.0-minimal-eb_4.9.0.dev0-1.src.rpm
Build Date  : Fri 10 Nov 2023 12:27:25 PM CET
Build Host  : 59e46bbf1cd0
Relocations : /
Packager    : <easybuild@59e46bbf1cd0>
Vendor      : none
URL         : https://www.perl.org/
Summary     : Larry Wall's Practical Extraction and Report Language
Description :
Larry Wall's Practical Extraction and Report Language
 .
This is a minimal build without any modules. Should only be used for build dependencies.
GCCcore-12.2.0
binutils-2.39-GCCcore-12.2.0
rpmlib(CompressedFileNames) <= 3.0.4-1
rpmlib(PartialHardlinkSets) <= 4.0.4-1
rpmlib(PayloadFilesHavePrefix) <= 4.0-1
zlib-1.2.12-GCCcore-12.2.0
Perl-5.36.0-GCCcore-12.2.0-minimal
Perl-5.36.0-GCCcore-12.2.0-minimal = eb_4.9.0.dev0-1
Perl-5.36.0-GCCcore-12.2.0-minimal(x86-64) = eb_4.9.0.dev0-1
```

## Packaging existing installations {: #packaging_skip }

To create packages for existing software installations (performed using
EasyBuild), combine `--package` with `--skip --rebuild`:

``` console
$ eb --package Perl-5.36.0-GCCcore-12.2.0-minimal.eb --skip --rebuild
[...]
== building and installing Perl/5.36.0-GCCcore-12.2.0-minimal...
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
== Results of the build can be found in the log file /home/example/software/Perl/5.36.0-GCCcore-12.2.0-minimal/easybuild/easybuild-Perl-5.36.0-20231110.124855.log
== Build succeeded for 1 out of 1
```

# Generating container recipes & images {: #containers }

SimpleBuild has support for generating Singularity and Docker *container
recipes* which will use SimpleBuild to build and install a specified
software stack. In addition, SimpleBuild can (optionally) leverage the
build tool provided by the container software of choice to create
*container images*.

!!! note
    The features documented here have been available since SimpleBuild v3.6.0 but are still *experimental*,  
    which implies they are subject to change in upcoming versions of
    SimpleBuild.

    **You will need to enable the** `--experimental` **configuration option
    in order to use them.**

    See [Experimental features][experimental_features] for
    more information.

Initially (since SimpleBuild v3.6.0), only Singularity
(<https://www.sylabs.io/singularity>) was supported. Since SimpleBuild
v3.6.2, generating (recipes for) Docker (<https://www.docker.com/>)
containers is also supported.

In SimpleBuild v3.9.2 the support for generating Singularity container
recipes/images was enhanced significantly.

## Requirements {: #containers_req }

- Docker, or Singularity version 2.4 (or more recent, incl. version 3.x)
- `sudo` permissions *(only required to actually build container images,
  see [Building container images][containers_usage_build_image])*

## Usage {: #containers_usage }

### Generating container recipes {: #containers_usage_containerize }

*(`--containerize` / `-C`)*

To generate container recipes, use `eb --containerize`, or `eb -C` for
short.

The resulting container recipe will, in turn, leverage SimpleBuild to
build and install the software that corresponds to the simpleconfig files
that are specified as arguments to the `eb` command (and all required
dependencies, if needed).

!!! note
    SimpleBuild will refuse to overwrite existing container recipes.

    To re-generate an already existing recipe file, use the `--force`
    command line option.

### Container template recipe {: #containers_usage_template_recipe }

*(`--container-template-recipe`)*

Via the `--container-template-recipe` configuration option, you can
specify a specific container template recipe that SimpleBuild should use
to generate container recipes.

This gives you control over a variety of aspects, including:

- the operating system (version) used in the container image
- the location where SimpleBuild installs software within the container
- how SimpleBuild is configured when installing software in the container
- etc.

When generating container recipes, SimpleBuild will replace the following
template values:

- `%(bootstrap)s`: bootstrap agent to use
    - see also <https://www.sylabs.io/guides/latest/user-guide/definition_files.html#header>
- `%(bootstrap_config)s`: configuration for the bootstrap agent
    - this is expected to include lines that specify `From:`, `MirrorURL:`, etc.
    - for more information, see [Container configuration][containers_usage_config]
- `%(simpleconfigs)s`: (list of) simpleconfig file name(s)/path(s) to pass to `eb` command
- `%(eb_args)s`: additional arguments for 'eb' command
- `%(include)s`: list of additional OS packages to include
    - see also [include keyword: OS packages to include][container_bootstrap_agent_linux_distro_include]
- `%(install_eb)s`: list of commands to install SimpleBuild
- `%(install_os_deps)s`: list of commands to install required OS packages (for example `yum install -y openssl`)
    - incl. `osdependencies` specified in simpleconfig files
- `%(mirrorurl)`: URI to use to download OS
    - see also [mirrorurl keyword: mirror URL to use to download OS][container_bootstrap_agent_linux_distro_mirrorurl]
- `%(modname)s`: module name(s) to load in environment
- `%(osversion)`: OS version to use
    - see also [osversion keyword: OS version to use][container_bootstrap_agent_linux_distro_osversion]
- `%(post_commands)s`: additional commands for the `post` section of the
  (Singularity) container recipe

### Container configuration {: #containers_usage_config }

*(`--container-config`)*

Using `--container-config`, values for specific template values can be
specified.

Values can be specified as a comma-separated list of `<key>=<value>`
pairs; for example:
`--container-config bootstrap=localimage,from:example.sif`.

Currently supported keywords include:

- `bootstrap`: bootstrap agent to use
    - two types of values are supported:
        - [Image-based bootstrap agents][container_bootstrap_agent_image_based]
        - [Linux distro bootstrap agents][container_bootstrap_agent_linux_distro]
- `eb_args`: additional arguments for 'eb' command
- `from`: argument to pass to bootstrap agent
    - *required/only valid with* `docker`, `library`, `localimage` *and*
        `shub` *bootstrap agents*
    - for more details, see [Image-based bootstrap agents][container_bootstrap_agent_image_based]
- `include`: list of additional OS packages to include
    - see also [include keyword: OS packages to include][container_bootstrap_agent_linux_distro_include]
- `install_eb`: commands to install SimpleBuild
- `mirrorurl`: URI to use to download OS
    - see also [mirrorurl keyword: mirror URL to use to download OS][container_bootstrap_agent_linux_distro_mirrorurl]
- `osversion`: OS version to use
    - see also [osversion keyword: OS version to use][container_bootstrap_agent_linux_distro_osversion]
- `post_commands`: additional commands for `post` section of
  (Singularity) container recipe

For more details on the last three, see [Linux distro bootstrap agents][container_bootstrap_agent_linux_distro].

!!! note
    Specifying any unknown keywords will results in an error.

#### Image-based bootstrap agents {: #container_bootstrap_agent_image_based }

*(e.g. `docker`, `library`, `localimage`, `shub`)*

These bootstrap agents involve using an existing container image as a
base.

Supported values include:

- `docker`: base container image hosted on Docker Hub
  (<https://hub.docker.com/>)
- `library`: base container image hosted on Sylabs Container Library
  (<https://cloud.sylabs.io/>)
- `localimage`: local base container image file
- `shub`: base container image hosted on Singularity Hub
  (<https://singularity-hub.org/>)

**The** `from` **keyword must also be specified when using one of these
bootstrap agents.**

The `localimage` bootstrap agents corresponds to using a local container
image file as a base, where it's path is specified using the `from`
keyword. For example:
"`bootstrap=localimage,from=/home/example/base.sif`".

Each of the other image-based bootstrap agents imply that the container
image to use as a base is downloaded from the corresponding registry, ad
specified through the `from` keyword, with a specific format:

- for `docker` bootstrap agent: `<registry>/<namespace>/<container>:<tag>@<digest>`
- for `library` bootstrap agent: `<entity>/<collection>/<container>:<tag>`
- for `shub` bootstrap agent: `<registry>/<username>/<container-name>:<tag>@digest`

For more details, see
<https://www.sylabs.io/guides/latest/user-guide/appendix.html#build-modules>.

##### Requirements for base container image {: #containers_usage_container_base_image_requirements }

There are a couple of specific requirements for the base container
image:

- all dependencies of SimpleBuild must be installed, including:
    - Python 2.7 or 3.6+
    - Lmod
    - standard tools & utilities like `make`, `patch`, `tar`, etc.
    - OS packages for system libraries like OpenSSL

See also [Requirements][requirements]

Each generated container recipe will include commands to create the
`simplebuild` user if it doesn't exist yet, as well as commands to create
the `/app` and `/scratch` directories and give the `simplebuild` user
write permissions to those locations.

!!! note
    The generated container recipe currently hardcodes some of this.  
    We intend to make this more configurable in a future version of
    SimpleBuild.

#### Linux distro bootstrap agents {: #container_bootstrap_agent_linux_distro }

*(e.g. `arch`, `busybox`, `debootstrap`, `yum`, `zypper`)*

Dedicated bootstrap agents are supported for different flavors of Linux
distributions, including:

- `arch`: Arch Linux
- `busybox`: BusyBox Linux
- `debootstrap`: apt-based systems like Ubuntu/Debian
- `yum`: yum-based systems like CentOS
- `zypper`: zypper-based systems like openSUSE

When one of these bootstrap agents is used, additional keywords can be
specified:

- [include keyword: OS packages to include][container_bootstrap_agent_linux_distro_include]
- [mirrorurl keyword: mirror URL to use to download OS][container_bootstrap_agent_linux_distro_mirrorurl]
- [osversion keyword: OS version to use][container_bootstrap_agent_linux_distro_osversion]

##### `include` keyword: OS packages to include {: #container_bootstrap_agent_linux_distro_include }

Via the `include` keywords, a list of packages can be specified that
should be include on top of the base OS installation.

For some bootstrap agents, a default value is used if no value is
specified:

- for the `yum` bootstrap agent: `yum`
- for the `zypper` bootstrap agent: `zypper`

See also
<https://www.sylabs.io/guides/latest/user-guide/appendix.html#yum-bootstrap-agent>
and
<https://www.sylabs.io/guides/latest/user-guide/appendix.html#zypper-bootstrap-agent>.

##### `mirrorurl` keyword: mirror URL to use to download OS {: #container_bootstrap_agent_linux_distro_mirrorurl }

For most of the Linux distro bootstrap agents (all except `arch`),
Singularity requires that a mirror URL is specified that will be used
when downloading the corresponding OS.

You can specify a value using the `mirrorurl` keyword. For example:
"`bootstrap=yum,mirrorurl=https://example.com`".

SimpleBuild will use a default value for `mirrorurl` if no other value is
specified:

- `busybox`:
  `https://www.busybox.net/downloads/binaries/%{OSVERSION}/busybox-x86_64`
- `debootstrap`: `http://us.archive.ubuntu.com/ubuntu/`
- `yum`:
  `http://mirror.centos.org/centos-%{OSVERSION}/%{OSVERSION}/os/x86_64/`
- `zypper`::
  `http://download.opensuse.org/distribution/leap/%{OSVERSION}/repo/oss/`

##### `osversion` keyword: OS version to use {: #container_bootstrap_agent_linux_distro_osversion }

Using the `osversion` keyword you can specify which OS version should be
installed.

Note that is this only required/used if value for the `mirrorurl` value
contains `%{OSVERSION}s`.

For example: "`bootstrap=yum,osversion=7`".

### Building container images {: #containers_usage_build_image }

*(`--container-build-image`)*

To instruct SimpleBuild to also build a container image from the generated
container recipe, use `--container-build-image` (in combination with
`-C` or `--containerize`).

SimpleBuild will leverage functionality provided by the container software
of choice (see [Type of container recipe/image to generate][containers_cfg_type]) to build the
container image.

For example, in the case of Singularity, SimpleBuild will run
`sudo /path/to/singularity build` on the generated container recipe.

!!! note
    In order to leverage the image building functionality of the container software, admin privileges are  
    typically required. Therefore, SimpleBuild will run the command to build
    the container image with `sudo`. You may need to enter your password to
    let the command execute.

    SimpleBuild will only run the actual container image build command with
    `sudo`. It will not use elevated privileges for anything else.

    In case of doubt, you can use `--extended-dry-run` or `-x` do perform a
    dry run, so you can evaluate which commands will be executed (see also
    [Extended dry run][extended_dry_run].

    If you're not comfortable with this, you can just let SimpleBuild generate
    the container recipe, and then use that to build the actual container
    images yourself, either locally or through Singularity Hub
    (<https://singularity-hub.org>).



The container image will be placed in the location specified by the
`--containerpath` configuration option (see [Location for generated container recipes & images][containers_cfg_path]),
next to the generated container recipe that was used to build the image.

!!! note  
    When building container images, make sure to use a file system location
    with sufficient available storage space. Singularity may pull metadata
    during the build, and each image can range from several hundred MBs to
    GBs, depending on software stack you are including in the container
    image.

!!! note
    SimpleBuild will refuse to overwrite existing container images.

    To re-generate an already existing image file, use the `--force`
    command line option.

### Example usage {: #containers_usage_example }

In this example, we will use a pre-built base container image located at
`example.sif` (see also [Image-based bootstrap agents][container_bootstrap_agent_image_based]).

To let SimpleBuild generate a container recipe for GCC 6.4.0 + binutils
2.28:

``` shell
eb GCC-6.4.0-2.28.eb --containerize --container-config bootstrap=localimage,from=example.sif --experimental
```

With other configuration options left to default (see output of
`eb --show-config`), this will result in a Singularity container recipe
using `example.sif` as base image, which will be stored in
`$HOME/.local/simplebuild/containers`:

``` console
$ eb GCC-6.4.0-2.28.eb --containerize --container-config bootstrap=localimage,from=example.sif --experimental
== temporary log file in case of crash /tmp/eb-dLZTNF/simplebuild-LPLeG0.log
== Singularity definition file created at /home/example/.local/simplebuild/containers/Singularity.GCC-6.4.0-2.28
== Temporary log file(s) /tmp/eb-dLZTNF/simplebuild-LPLeG0.log* have been removed.
== Temporary directory /tmp/eb-dLZTNF has been removed.
```

Docker supports a limited set of the container options. Example of
commands that can be used to generate Docker containers are:

``` shell
eb  --containerize --container-type=docker --experimental --container-config=ubuntu:20.04 zlib-1.2.11.eb
eb  --containerize --container-type=docker --experimental --container-config=centos:7 zlib-1.2.11.eb
```

#### Example of a generated container recipe {: #containers_example_recipe }

Below is an example of container recipe for that was generated by
SimpleBuild, using the following command:

``` shell
eb Python-3.6.4-foss-2018a.eb -C --container-config bootstrap=yum,osversion=7 --experimental
```

``` singularity
Bootstrap: yum
OSVersion: 7
MirrorURL: http://mirror.centos.org/centos-%{OSVERSION}/%{OSVERSION}/os/x86_64/
Include: yum

%post
yum install --quiet --assumeyes epel-release
yum install --quiet --assumeyes python setuptools Lmod
yum install --quiet --assumeyes python-pip
yum install --quiet --assumeyes bzip2 gzip tar zip unzip xz
yum install --quiet --assumeyes curl wget
yum install --quiet --assumeyes patch make
yum install --quiet --assumeyes file git which
yum install --quiet --assumeyes gcc-c++
yum install --quiet --assumeyes perl-Data-Dumper
yum install --quiet --assumeyes perl-Thread-Queue
yum --skip-broken --quiet --assumeyes install libibverbs-dev libibverbs-devel rdma-core-devel
yum --skip-broken --quiet --assumeyes install openssl-devel libssl-dev libopenssl-devel

# install SimpleBuild using pip
pip install -U setuptools
pip install 'vsc-install<0.11.4' 'vsc-base<2.9.0'
pip install simplebuild

# create 'simplebuild' user (if missing)
id simplebuild || useradd simplebuild

# create /app software installation prefix + /scratch sandbox directory
if [ ! -d /app ]; then mkdir -p /app; chown simplebuild:simplebuild -R /app; fi
if [ ! -d /scratch ]; then mkdir -p /scratch; chown simplebuild:simplebuild -R /scratch; fi

# install Lmod RC file
cat > /etc/lmodrc.lua << EOF
scDescriptT = {
  {
    ["dir"]       = "/app/lmodcache",
    ["timestamp"] = "/app/lmodcache/timestamp",
  },
}
EOF

# change to 'simplebuild' user
su - simplebuild

# verbose commands, exit on first error
set -ve

# configure SimpleBuild

# use /scratch as general prefix, used for sources, build directories, etc.
export SIMPLEBUILD_PREFIX=/scratch

# also use /scratch for temporary directories
export SIMPLEBUILD_TMPDIR=/scratch/tmp

# download sources to /scratch/sources, but also consider files located in /tmp/simplebuild/sources;
# that way, source files that can not be downloaded can be seeded in
export SIMPLEBUILD_SOURCEPATH=/scratch/sources:/tmp/simplebuild/sources

# install software & modules into /app
export SIMPLEBUILD_INSTALLPATH=/app

# use SimpleBuild to install specified software
eb Python-3.6.4-foss-2018a.eb --robot

# update Lmod cache
mkdir -p /app/lmodcache
$LMOD_DIR/update_lmod_system_cache_files -d /app/lmodcache -t /app/lmodcache/timestamp /app/modules/all

# exit from 'simplebuild' user
exit

# cleanup, everything in /scratch is assumed to be temporary
rm -rf /scratch/*

%runscript
eval "$@"

%environment
# make sure that 'module' and 'ml' commands are defined
source /etc/profile
# increase threshold time for Lmod to write cache in $HOME (which we don't want to do)
export LMOD_SHORT_TIME=86400
# purge any modules that may be loaded outside container
module --force purge
# avoid picking up modules from outside of container
module unuse $MODULEPATH
# pick up modules installed in /app
module use /app/modules/all
# load module(s) corresponding to installed software
module load Python/3.6.4-foss-2018a

%labels
```

The generated container recipe includes a bunch of `yum install`
commands to install additional required/useful OS packages,
`pip install` commands to install SimpleBuild (if it's not installed yet),
commands to create the `simplebuild` user and provide write access to the
`/app` and `/scratch` directories, and to configure Lmod and update the
Lmod cache after software was installed with SimpleBuild.

In addition, the generated module files will follow the default module
naming scheme (`SimpleBuildMNS`). The modules that correspond to the
simpleconfig files that were specified on the command line will be loaded
automatically, see the statements in the `%environment` section of the
generated container recipe.

#### Example of building container image {: #containers_example_build_image }

You can instruct SimpleBuild to also build the container image by also
using `--container-build-image`.

Note that you will need to enter your `sudo` password (unless you
recently executed a `sudo` command in the same shell session):

``` console
$ eb GCC-6.4.0-2.28.eb --containerize --container-config bootstrap=localimage,from=/tmp/example.sif --container-build-image --experimental
== temporary log file in case of crash /tmp/eb-aYXYC8/simplebuild-8uXhvu.log
== Singularity tool found at /usr/bin/singularity
== Singularity version '2.4.6' is 2.4 or higher ... OK
== Singularity definition file created at /home/example/.local/simplebuild/containers/Singularity.GCC-6.4.0-2.28
== Running 'sudo /usr/bin/singularity build  /home/example/.local/simplebuild/containers/GCC-6.4.0-2.28.sif /home/example/.local/simplebuild/containers/Singularity.GCC-6.4.0-2.28', you may need to enter your 'sudo' password...
== (streaming) output for command 'sudo /usr/bin/singularity build  /home/example/.local/simplebuild/containers/GCC-6.4.0-2.28.sif /home/example/.local/simplebuild/containers/Singularity.GCC-6.4.0-2.28':
Using container recipe deffile: /home/example/.local/simplebuild/containers/Singularity.GCC-6.4.0-2.28
Sanitizing environment
Adding base Singularity environment to container
...
== temporary log file in case of crash /scratch/tmp/eb-WnmCI_/simplebuild-GcKyY9.log
== resolving dependencies ...
...
== building and installing GCCcore/6.4.0...
...
== building and installing binutils/2.28-GCCcore-6.4.0...
...
== building and installing GCC/6.4.0-2.28...
...
== COMPLETED: Installation ended successfully
== Results of the build can be found in the log file(s) /app/software/GCC/6.4.0-2.28/simplebuild/simplebuild-GCC-6.4.0-20180424.084946.log
== Build succeeded for 15 out of 15
...
Building Singularity image...
Singularity container built: /home/example/.local/simplebuild/containers/GCC-6.4.0-2.28.sif
Cleaning up...
== Singularity image created at /home/example/.local/simplebuild/containers/GCC-6.4.0-2.28.sif
== Temporary log file(s) /tmp/eb-aYXYC8/simplebuild-8uXhvu.log* have been removed.
== Temporary directory /tmp/eb-aYXYC8 has been removed.
```

The inspect the container image, you can use `singularity shell` to
start a shell session *in* the container:

``` console
$ singularity shell --shell "/bin/bash --norc" $HOME/.local/simplebuild/containers/GCC-6.4.0-2.28.sif

Singularity GCC-6.4.0-2.28.sif:~> module list

Currently Loaded Modules:
  1) GCCcore/6.4.0   2) binutils/2.28-GCCcore-6.4.0   3) GCC/6.4.0-2.28

Singularity GCC-6.4.0-2.28.sif:~> which gcc
/app/software/GCCcore/6.4.0/bin/gcc

Singularity GCC-6.4.0-2.28.sif:~> gcc --version
gcc (GCC) 6.4.0
...
```

!!! note
    We are passing `--shell "/bin/bash --norc` to `singularity shell` to avoid that the `.bashrc` login  
    script that may be present in your home directory is sourced, since that
    may include statements that are not relevant in the container
    environment.

Or, you can use `singularity exec` to execute a command in the
container.

Compare the output of running `which gcc` and `gcc --version` locally:

``` console
$ which gcc
/usr/bin/gcc
$ gcc --version
gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-16)
...
```

and the output when running the same commands in the container:

``` console
$ singularity exec GCC-6.4.0-2.28.sif which gcc
/app/software/GCCcore/6.4.0/bin/gcc

$ singularity exec GCC-6.4.0-2.28.sif gcc --version
gcc (GCC) 6.4.0
...
```

## Configuration

!!! note
    You can specify each of these configuration options either as options to the `eb` command,  
    via the equivalent `$SIMPLEBUILD_CONTAINER*` environment variable, or via
    an SimpleBuild configuration file; see [Supported configuration types][configuration_types].

### Location for generated container recipes & images {: #containers_cfg_path }

*(`--containerpath`)*

To control the location where SimpleBuild will put generated container
recipes & images, use the `--containerpath` configuration setting. Next
to providing this as an option to the `eb` command, you can also define
the `$SIMPLEBUILD_CONTAINERPATH` environment variable or specify
`containerpath` in an SimpleBuild configuration file.

The default value for this location is
`$HOME/.local/simplebuild/containers`, unless the `--prefix` configuration
setting was provided, in which case it becomes `<prefix>/containers`
(see [Overall prefix path][prefix]).

Use `eb --show-full-config | grep containerpath` to determine the
currently active setting.

### Container image format {: #containers_cfg_image_format }

*(`--container-image-format`)*

!!! note
    This is only relevant when creating Singularity container images;  
    the value for `--container-image-format` is ignored when creating Docker
    container images.

The format for container images that SimpleBuild is produces via the
functionality provided by the container software can be controlled via
the `--container-image-format` configuration setting.

For Singularity containers (see [Type of container recipe/image to generate][containers_cfg_type]),
three image formats are supported:

- `squashfs` *(default when using Singularity 2.x)*: compressed images
  using `squashfs` read-only file system
- `sif` *(default when using Singularity 3.x)*: compressed read-only
  Singularity Image File (SIF)
- `ext3`: writable image file using `ext3` file system *(only supported
  with Singularity 2.x)*
- `sandbox`: container image in a regular directory

See also
<https://www.sylabs.io/guides/latest/user-guide/build_a_container.html>
.

### Name for container recipe & image {: #containers_cfg_image_name }

*(`--container-image-name`)*

By default, SimpleBuild will use the name of the first simpleconfig file
(without the `.eb` suffix) as a name for both the container recipe and
image.

You can specify an altername name using the `--container-image-name`
configuration setting.

The filename of generated container recipe will be `Singularity.<name>`.

The filename of the container image will be `<name><extension>`, where
the value for `<extension>` depends on the image format (see
[Container image format][containers_cfg_image_format]):

- '`.simg`' for `squashfs` Singularity container images *(only with
  Singularity 2.x)*
- '`.img`' for `ext3` Singularity container images *(only with
  Singularity 2.x)*
- '`.sif`' for Singularity container images in Singularity Image Format
  (SIF) *(only with Singularity 3.x)*
- *empty* for `sandbox` Singularity container images (in which case the
  container image is actually a directory rather than a file)
- *empty* for Docker container images

### Temporary directory for creating container images {: #containers_tmpdir }

*(`--container-tmpdir`)*

The container software that SimpleBuild leverages to build container
images may be using a temporary directory in a location that doesn't
have sufficient free space.

You can instruct SimpleBuild to pass an alternate location via the
`--container-tmpdir` configuration setting.

For Singularity, the default is to use `/tmp`, see
<https://www.sylabs.io/guides/latest/user-guide/build_env.html#temporary-folders>.
If `--container-tmpdir` is specified, the `$SINGULARITY_TMPDIR`
environment variable will be defined accordingly to let Singularity use
that location instead.

### Type of container recipe/image to generate {: #containers_cfg_type }

*(`--container-type`)*

With the `--container-type` configuration option, you can specify what
type of container recipe/image SimpleBuild should generated. Possible
values are:

- `docker`: Docker (<https://docs.docker.com/>) container recipe &
  images (supported since SimpleBuild v3.6.2)
- `singularity` *(default)*: Singularity
  (<https://www.sylabs.io/singularity>) container recipes & images

## 'Stacking' container images {: #containers_stacking }

To avoid long build times and excessive large container images, you can
construct your target container image step-by-step, by first building a
base container image for the compiler toolchain you want to use, and
then using it to build a container images for a particular (set of)
software package(s).

For example, to build a container image for Python 3.6.4 built with the
`foss/2018a` toolchain:

``` console
$ cd /tmp

# use current directory as location for generated container recipes & images
$ export SIMPLEBUILD_CONTAINERPATH=$PWD

# build base container image for OpenMPI + GCC parts of foss/2018a toolchain, on top of CentOS 7.4 base image
$ eb -C --container-build-image OpenMPI-2.1.2-GCC-6.4.0-2.28.eb --container-config bootstrap=yum,osversion=7 --experimental
...
== Singularity image created at /tmp/OpenMPI-2.1.2-GCC-6.4.0-2.28.sif
...

$ ls -lh OpenMPI-2.1.2-GCC-6.4.0-2.28.sif
-rwxr-xr-x 1 root root 590M Apr 24 11:43 OpenMPI-2.1.2-GCC-6.4.0-2.28.sif

# build another container image for the for the full foss/2018a toolchain, using the OpenMPI + GCC container as a base
$ eb -C --container-build-image foss-2018a.eb --container-config bootstrap=localimage,from=OpenMPI-2.1.2-GCC-6.4.0-2.28.sif --experimental
...
== Singularity image created at /tmp/foss-2018a.sif
...

$ ls -lh foss-2018a.sif
-rwxr-xr-x 1 root root 614M Apr 24 13:11 foss-2018a.sif

# build container image for Python 3.6.4 with foss/2018a toolchain by leveraging base container image foss-2018a.sif
$ eb -C --container-build-image Python-3.6.4-foss-2018a.eb --container-config bootstrap=localimage,from=foss-2018a.sif --experimental
...
== Singularity image created at /tmp/Python-3.6.4-foss-2018a.sif
...

$ ls -lh Python-3.6.4-foss-2018a.sif
-rwxr-xr-x 1 root root 759M Apr 24 14:01 Python-3.6.4-foss-2018a.sif

$ singularity exec Python-3.6.4-foss-2018a.sif which python
/app/software/Python/3.6.4-foss-2018a/bin/python

$ singularity exec Python-3.6.4-foss-2018a.sif python -V
vsc40023 belongs to gsingularity
Python 3.6.4
```

## Seeding in source files for container build process {: #containers_seeding }

In some cases, you may need to "seed in" manually downloaded source
files into the container build environment, because the sources can not
be downloaded automatically.

As shown in [Example of a generated container recipe][containers_example_recipe], the container recipe
generated by SimpleBuild includes `/tmp/simplebuild/sources/` as a fallback
directory in the list of locations considered by SimpleBuild when looking
for sources/patches (see also [Source path][sourcepath]).

That way, you can copy source files that should be available when
building the container image into `/tmp/simplebuild/sources/`.

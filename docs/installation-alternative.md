# Alternative installation methods {: #alt_inst_methods }

This page describes the alternative installation methods:

- [Standard installation of latest
    release](#standard-installation-of-latest-release)
- [Installation from downloaded
    sources](#installation-from-downloaded-sources)
- [Installation of latest release from
    GitHub](#installation-of-latest-release-from-github)
- [Installation of latest development
    version](#installation-of-latest-development-version)

Do take into account the list of (required) dependencies (see
[Dependencies][dependencies]).

------------------------------------------------------------------------

## Standard installation of latest release

Usually, you just want to install the latest (stable) version of each of
the SimpleBuild packages (framework, simpleblocks, simpleconfigs).

Python provides a couple of ways to do that. Every version of the
SimpleBuild packages is released via PyPi.

### Installing SimpleBuild without admin rights {: #alt_inst_simple_install_pip }

If you do not have SimpleBuild installed yet, or if you just want to
install the most recent version of each of the SimpleBuild packages, you
can use one of the following simple commands:

- using `simple_install` (old tool, but still works):

    ``` shell
    simple_install --prefix $HOME/SimpleBuild simplebuild
    ```

    !!! note
        If you already have *simplebuild* installed, you may need to instruct `simple_install` to install a newer version, using `--upgrade` or `-U`.

- using `pip` (more recent and better installation tool for Python
    software):

    ``` shell
    pip install --install-option "--prefix=$HOME/SimpleBuild" simplebuild
    ```

    The `--prefix $HOME/SimpleBuild` part in these commands allows you to
    install SimpleBuild without admin rights into `$HOME/SimpleBuild`.

    !!! note
        For pip v8.0 and newer,
        `pip install --prefix=$HOME/SimpleBuild simplebuild` works too.

### Adjusting `$PATH` and `$PYTHONPATH` environment variables

After installing SimpleBuild with either `simple_install` or `pip` like
this, you will need to update the `$PATH` and `$PYTHONPATH` environment
variable to make sure the system can find the main SimpleBuild command
`eb`. On (most) Linux distributions, the command for doing this is:

``` shell
export PATH=$HOME/SimpleBuild/bin:$PATH
export PYTHONPATH=$HOME/SimpleBuild/lib/python2.7/site-packages:$PYTHONPATH
```

!!! tip
    To determine the path that should be added to the `$PYTHONPATH`
    environment variable for a given installation prefix, you can use the
    following command:

    ``` shell
    python -c "import distutils.sysconfig; print distutils.sysconfig.get_python_lib(prefix='$HOME/SimpleBuild/');"
    ```

### Install with admin rights

If you do have admin rights on the system where you want to install
SimpleBuild, you can simply omit the `--prefix $HOME/SimpleBuild/` to have
SimpleBuild installed system-wide. In that case, you do not need to touch
the `$PATH` or `$PYTHONPATH` environment variables since the `eb`
command will be installed in one of the default paths.

### Alternatives to `--prefix`

As an alternative to `--prefix` when you do not have admin rights, you
can specify that SimpleBuild should be installed in your `$HOME` directory
using the `--user` option.

The full list of commands to install SimpleBuild in your `$HOME` directory
using `pip` would be:

``` shell
pip install --user simplebuild
export PATH=$HOME/.local/bin:$PATH
```

!!! warning
    In our experience, using `--user` creates more problems than it
    solves. We have run into unexpected behavior with Python software
    installed in your home directory using `--user`, for example it
    **always** being preferred over versions installed somewhere else.
    Hence, we strongly discourage using `--user` to install SimpleBuild (or
    other Python software).

### Installing the SimpleBuild packages separately

Each of the SimpleBuild packages can also be installed separately:

``` shell
pip install --install-option "--prefix=$HOME/SimpleBuild" simplebuild-framework
pip install --install-option "--prefix=$HOME/SimpleBuild" simplebuild-simpleblocks
pip install --install-option "--prefix=$HOME/SimpleBuild" simplebuild-simpleconfigs
```

This is the exact same sequence of steps as they will be performed when
running
`pip install --install-option "--prefix=$HOME/SimpleBuild" simplebuild`.

## Installation from downloaded sources

To install one of the SimpleBuild packages from a downloaded source
tarball, use the following steps:

``` shell
tar xfvz simplebuild-framework-1.0.tar.gz
cd simplebuild-framework-1.0
pip install --install-option "--prefix=$HOME/SimpleBuild" .
```

Do note that when an SimpleBuild package is being installed without having
the SimpleBuild packages that it depends upon available, both
`simple_install` and `pip` will try and pull in the latest available
version of those packages from PyPi.

Thus, to have full control over the SimpleBuild installation, you need to
respect the following installation order: simplebuild-framework,
simplebuild-simpleblocks, simplebuild-simpleconfigs. The simpleblocks package
depends on the framework package; the simpleconfigs package depends on
both the framework and simpleblocks packages.

If you do not have `pip` or `simple_install` available, you can also fall
back to using the `setup.py` script directly:

``` shell
python setup.py --prefix $HOME/SimpleBuild install
```

## Installation of latest release from GitHub

To install the latest (stable) release of an SimpleBuild package directly
from GitHub, use the following command:

``` shell
pip install --install-option "--prefix=$HOME/SimpleBuild" https://github.com/simplebuilders/simplebuild-framework/archive/main.tar.gz
```

Again, the order in which the SimpleBuild packages are installed is
important to have full control over the installation process, see
previous section.

## Installation of latest development version

To install the latest development version of an SimpleBuild package from
GitHub, you can simply adjust the command from the previous section to
install from the `develop` branch (or any of the available feature
branches in any SimpleBuild repository for that matter):

``` shell
pip install --install-option "--prefix=$HOME/SimpleBuild" https://github.com/simplebuilders/simplebuild-framework/archive/develop.tar.gz
```

!!! note
    You should use this only if you are interested in developing for
    SimpleBuild. Although it is well tested, the development version of
    the SimpleBuild repositories may be unstable at a given point in time.

## Installation of latest development version using provided script {: #install_latest_develop_using_script }

After you have forked each of the SimpleBuild repositories on GitHub (+
vsc-base), you can set up a development version of SimpleBuild using the
`install-SimpleBuild-develop.sh` script.

This script will clone the different SimpleBuild repositories from GitHub:

- [simplebuild](https://github.com/simplebuilders/simplebuild): SimpleBuild
    metapackage & documentation sources for
    <http://simplebuild.readthedocs.org>
- [vsc-base](https://github.com/hpcugent/vsc-base): dependency for
    SimpleBuild framework (logging, command line interface, \...)
- [simplebuild-framework](https://github.com/simplebuilders/simplebuild-framework):
    SimpleBuild framework
- [simplebuild-simpleblocks](https://github.com/simplebuilders/simplebuild-simpleblocks):
    collection of simpleblocks
- [simplebuild-simpleconfigs](https://github.com/simplebuilders/simplebuild-simpleconfigs):
    collection of simpleconfig files

It can be used as follows:

``` shell
# pick an installation prefix (adjust as you like)
INSTALL_PREFIX=$(mktemp -d $HOME/SimpleBuild-XXXXXX)
# download script
curl -O https://raw.githubusercontent.com/simplebuilders/simplebuild-framework/main/simplebuild/scripts/install-SimpleBuild-develop.sh
# run downloaded script, specifying *your* GitHub username and the installation prefix
bash install-SimpleBuild-develop.sh GITHUB_USERNAME $INSTALL_PREFIX
# update $MODULEPATH via 'module use', and load the module
module use $INSTALL_PREFIX/modules
module load SimpleBuild-develop
eb --version  ## This should ensure you have a reasonable instance of SimpleBuild
```

!!! note
    The above creates a module file which you can load/inspect at will.

    The interesting aspect about it is that it is pointing to an
    SimpleBuild installation directly on local git repositories, which
    allows you to customise it easily. Remember to commit/push or
    otherwise save your changes, if you intend to use them later.

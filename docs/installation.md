# Installing EasyBuild {: #installation }

EasyBuild is Python software, so there are a couple of ways to install it.

We recommend installing EasyBuild using `pip`. This method is described at [Using pip to Install EasyBuild][pip].

It is also possible to install EasyBuild as a module. To do this, 
use the 3-step procedure outlined at [Installing EasyBuild with EasyBuild][eb_as_module].

Do take into account the required and optional dependencies (see [Requirements][requirements] and [Dependencies][dependencies]).

Notes on other ways of installing EasyBuild are available under section [Alternative installation methods][alt_inst_methods].


## Requirements {: #requirements }

The only strict requirements are:

* a **GNU/Linux** distribution as operating system
    * some common shell tools are expected to be available, see [Required shell tools][required_shell_tools]
* [Python](https://python.org):
    * Python 2.7, or Python 3.x (>= 3.5);
    * since [Python 2 is end-of-life](https://www.python.org/doc/sunset-python-2/) we strongly recommend
      using Python 3 if it is available;
    * only EasyBuild v4.0 (or newer) is compatible with Python 3, earlier EasyBuild releases require Python 2;
    * EasyBuild 5.0 will require Python >= 3.6;
    * no third-party Python packages are strictly required (the Python standard library is sufficient);
    * for some *specific* EasyBuild features additional Python packages are required however, see [Optional Python packages][optional_python_packages];
* a **modules tool**: Tcl(/C) environment modules or Lmod
    * the actual modules tool *must* be available via `$PATH`, see [Required modules tool][required_modules_tool]
* a C/C++ compiler (e.g., `gcc` and `g++`)
    * only required to build and install GCC with, or as a dependency for the Intel compilers, for example

For more information on dependencies, see [Dependencies][dependencies].


## Using pip to Install EasyBuild {: #pip }

Since EasyBuild is released as a [Python package on PyPI](https://pypi.org/project/easybuild)
you can install it using `pip`, the most commonly used tool for installing Python packages.

Install EasyBuild with:

``` shell
pip install easybuild
```

You may need to tweak this command a bit, depending on your setup, see [Additional pip install options][more_pip].

!!! note
    There are various other ways of installing Python packages, which we won't cover here.
    If you are familiar with other tools like `virtualenv` or `pipenv`, feel free to use those
    instead to install EasyBuild.

### Sanity check

Compare the version of `eb`, the main EasyBuild command, with the version of the EasyBuild module that was installed.
For example::

``` console
$ module load EasyBuild
$ module list

Currently Loaded Modules:
  1) EasyBuild/4.7.2

$ eb --version
This is EasyBuild 4.7.2 (framework: 4.7.2, easyblocks: 4.7.2) on host example.local
```

!!! tip
    The Tcl-based or Lmod implementations of environment modules do their default sorting differently.
    The former will normally sort in the lexicographic order, while Lmod follows
    an approach that is closer to Python's construct `LooseVersion` way of ordering. Such aspects
    may make a big difference, if you have installed both versions 1.9.0 and 1.15.2,
    with respect to what is the version being loaded by default.

You can also run `eb --show-system-info` to see system information relevant to EasyBuild,
or run`eb --show-config` to see the default EasyBuild configuration (see also [Configuring EasyBuild][configuring_easybuild]).


### Updating an existing EasyBuild installation {: #updating }

To upgrade to a newer EasyBuild version than the one currently installed:

* `pip install --upgrade easybuild` will upgrade EasyBuild to the latest release.


### Additional pip install options {: #more_pip }

For the `pip` install, you may wish to slightly change this command depending on the context and your personal preferences:

* to install EasyBuild *system-wide*, you can use `sudo` (if you have admin privileges):

    ``` shell
    sudo pip install easybuild
    ```

* To install EasyBuild *in your personal home directory*, you can use the `--user` option:

    ``` shell
    pip install --user easybuild
    ```

    This will result in an EasyBuild installation in `$HOME/.local/`.

* To install EasyBuild in a *specific directory* you can use the `--prefix` option:

    ``` shell
    pip install --prefix _PREFIX_ easybuild
    ```

    In this command, you should replace '`_PREFIX_`' with the location where you want to have EasyBuild installed
    (for example, `$HOME/tools` or `/tmp/$USER`).

Keep in mind that you may need to update your environment too when using `--user` or `--prefix`,
see [Updating your environment][more_pip_env].



### `pip` vs `pip3` {: #more_pip_pip3 }

On systems where both Python 2 and Python 3 are installed you may also have different `pip` commands
available. Or maybe `pip` is not available at all, and only "versioned" `pip` commands like `pip3` are
available.

If you (only) have `pip3` available, you can replace `pip` with `pip3` in any of the `pip install` commands
above:

``` shell
pip3 install easybuild
```

If you want to ensure that you are using the `pip` installation that corresponds to the Python 3 installation
that you intend to use, you can use `python3 -m pip` rather than `pip3`.

``` shell
python3.6 -m pip install easybuild
```

Note that you may also need to instruct the `eb` command to use the correct Python version at runtime,
via `$EB_PYTHON` (see [Setting `$EB_PYTHON`][more_pip_env_EB_PYTHON]).


### Updating your environment {: #more_pip_env }

If you used the `--user` or `--prefix` option in the `pip install` command,
or if you installed EasyBuild with a `pip` version that does not correspond
to your default Python installation, you will need to update your environment to make EasyBuild ready for use.
This is not required if you did a system-wide installation in a standard location with the default Python version.

!!! note
    Keep in mind that you will have to make these environment changes again if you start a new shell session.
    To avoid this, you can update one of the shell startup scripts in your home directory (`.bashrc` for example).


### Updating `$PATH` {: #more_pip_env_PATH }

Update the `$PATH` environment variable to make sure the `eb` command is available::

``` shell
export PATH=_PREFIX_/bin:$PATH
```

**Replace** `_PREFIX_` **in this command** with the directory path where EasyBuild was installed into
(use `$HOME/.local` if you used `pip install --user`).

This is not required if you installing EasyBuild in a standard system location.

You can check with the `which eb` command to determine whether or not you need to update the `$PATH` environment variable.


### Updating `$PYTHONPATH` {: #more_pip_env_PYTHONPATH }

If you installed EasyBuild to a non-standard location using `pip install --prefix`,
you also need to update the Python search path environment variable `$PYTHONPATH` to instruct Python where
it can find the EasyBuild Python packages.

This is not required if you used the `--user` option, since Python will automatically consider
`$HOME/.local` when searching for installed Python packages, or if you installed EasyBuild in a standard
system-wide location.

Update `$PYTHONPATH` by running a command like::

``` shell
export PYTHONPATH=_PREFIX_/lib/pythonX.Y/site-packages:$PYTHONPATH
```

Here, you need to replace the `X` and `Y` with the major and minor version of your Python installation,
which you can determine by running `python -V`.
For example, if you are using Python 3.6, make sure you are using `/python3.6/` in the command to update `$PYTHONPATH`.

And of course, you again need to **replace '`_PREFIX_`'** with the installation prefix where EasyBuild was installed
into.

For example:

``` shell
# update $PYTHONPATH if EasyBuild was installed in $HOME/tools with Python 3.6
export PYTHONPATH=$HOME/tools/lib/python3.6/site-packages:$PYTHONPATH
```


### Setting `$EB_PYTHON` {: #more_pip_env_EB_PYTHON }

If you want to control which Python version is used to run EasyBuild,
you can specify the name or the full path to the `python` command that should be used by the `eb` command
via the `$EB_PYTHON` environment variable.

This may be required when you are installing EasyBuild with a version of `pip` that does not correspond
with the default Python version.

For example, to ensure that `eb` uses `python3.6`:

``` shell
export EB_PYTHON=python3.6
```


### Setting `$EB_VERBOSE` {: #more_pip_env_EB_VERBOSE }

To determine which `python` commands are being considered by the `eb` command,
you can define the `$EB_VERBOSE` environment variable. For example:

``` console
$ EB_VERBOSE=1 eb --version
>> Considering 'python3.6'...
>> 'python3' version: 3.6.8, which matches Python 3 version requirement (>= 3.5)
>> Selected Python command: python3 (/usr/bin/python3.6)
>> python3.6 -m easybuild.main --version
This is EasyBuild 4.7.2 (framework: 4.7.2, easyblocks: 4.7.2) on host example
```


## Installing EasyBuild with EasyBuild {: #eb_as_module }

If you prefer having EasyBuild available through an environment module file,
you can consider installing EasyBuild with EasyBuild. This can be done in 3 steps:

* [Step 1][eb_as_module_step1]: Installing EasyBuild with `pip` into a temporary location (only needed if EasyBuild is not installed yet)
* [Step 2][eb_as_module_step2]: Using EasyBuild to install EasyBuild as a module
* [Step 3][eb_as_module_step3]: Loading the EasyBuild module


### Step 1: Installing EasyBuild into a temporary location {: #eb_as_module_step1 }

If you don't have EasyBuild installed yet, you need to install it in a temporary location first.
The recommended way of doing this is [using pip to install EasyBuild][pip].

For example, to install EasyBuild into a subdirectory `/tmp/$USER` using the default Python 3 version:

``` shell
# pick installation prefix, and install EasyBuild into it
export EB_TMPDIR=/tmp/$USER/eb_tmp
python3 -m pip install --ignore-installed --prefix $EB_TMPDIR easybuild

# update environment to use this temporary EasyBuild installation
export PATH=$EB_TMPDIR/bin:$PATH
export PYTHONPATH=$(/bin/ls -rtd -1 $EB_TMPDIR/lib*/python*/site-packages | tail -1):$PYTHONPATH
export EB_PYTHON=python3
```


### Step 2: Using EasyBuild to install EasyBuild {: #eb_as_module_step2 }

Once you have a working (recent) temporary EasyBuild installation, you can use it to
install EasyBuild as a module. Usually this is done in the location where you would
like to install other software too.

You can use the `eb --install-latest-eb-release` command for this,
combined with the `--prefix` option to control which directories are used by EasyBuild for the installation.

For example, to install the latest version of EasyBuild as a module into `$HOME/easybuild`:

``` shell
eb --install-latest-eb-release --prefix $HOME/easybuild
```

!!! note
    You may see a harmless deprecation warning popping up when performing this installation, just ignore it.


### Step 3: Loading the EasyBuild module {: #eb_as_module_step3 }

Once [Step 2: Using EasyBuild to install EasyBuild][eb_as_module_step2] is completed, you should be able to
load the module that was generated alongside the EasyBuild installation. You will need to do this every time
you start a new shell session.

First, make the module available by running the following command (which will update the module search path
environment variable `$MODULEPATH`):

``` shell
module use _PREFIX_/modules/all
```

**Replace** `_PREFIX_` with the path to the directory that you used when running [Step 2: Using EasyBuild to install EasyBuild][eb_as_module_step2]
(for example, `$HOME/easybuild`).

Then, load the EasyBuild module to update your environment and make EasyBuild available for use:

``` shell
module load EasyBuild
```

!!! note
    Note that in this case, we don't need to make any changes to our environment for EasyBuild to work correctly.
    The environment module file that was generated by EasyBuild specifies all changes that need to be made.


## Required Dependencies {: #dependencies }

This section gives further information on the [required dependencies][requirements].


### Required shell tools {: #required_shell_tools }

<!-- XXX - UPDATE BY VERSION, below -->

A couple of shell tools may be required, depending on the particular use case (in relative order of importance):

* shell builtin commands:
    * `type`, for inspecting the `module` function (if defined)
    * `ulimit`, for querying user limits
* tools for unpacking (source) archives:
    * commonly required: `tar`, `gunzip`, `bunzip2`
    * occasionally required: `unzip`, `unxz`
* `patch`, for applying patch files to unpacked sources (relatively common)
* `rpm` or `dpkg`, for querying OS dependencies (only needed occasionally)
* `locate`, only as a (poor mans) fallback to `rpm`/`dpkg` (rarely needed)
* `sysctl`, for querying system characteristics (only required on non-Linux systems)


### Required modules tool {: #required_modules_tool }

EasyBuild not only generates module files to be used along with the software it installs,
it also depends on the generated modules, mainly for resolving dependencies.
Hence, a modules tool must be available to consume module files with.

<!-- XXX - UPDATE BY VERSION, below -->

Supported module tools:

* [Tcl/C environment-modules](https://modules.sourceforge.net/) (version >= 3.2.10)
* [Tcl-only variant of environment modules](https://sourceforge.net/projects/modules/files/Modules-Tcl)
* [Lmod](https://lmod.sourceforge.net) (version >= 6.5.1), *highly recommended*

!!! note
    The path to the actual modules tool binary/script used *must* be included in `$PATH`,
    to make it readily available to EasyBuild.

    * for Tcl/C environment modules: `modulecmd`
    * for Tcl-only environment modules: `modulecmd.tcl`
    * for Lmod: `lmod`

    The path where the modules tool binary/script is located can be determined via the definition of
    the `module` function; for example, using `type module` or `type -f module`.

!!! note
    For Lmod specifically, EasyBuild will try to fall back to finding the `lmod` binary via the `$LMOD_CMD`
    environment variable, in case `lmod` is not available in `$PATH`.

    In EasyBuild versions *prior* to 2.1.1, the path specified by `$LMOD_CMD` was (erroneously) preferred over the
    (first) `lmod` binary available via `$PATH`.


Additional notes:

* Tcl(/C) environment-modules requires [Tcl](https://www.tcl.tk/) to be
  installed (with header files and development libraries)
* Lmod requires [Lua](https://www.lua.org/) and a couple of non-standard Lua libraries
  (`lua-posix`, `lua-filesystem`) to be available
    * Tcl (`tclsh`) must also be available for Lmod to support module files in `Tcl` syntax
* a guide to installing Tcl/C environment modules without having root
  permissions is available at [Installing environment modules without root permissions][installing_env_mod_c].
* a guide to installing Lmod without having root permissions is available at
  [Installing Lmod without root permissions][installing_lmod].


### Required Python packages {: #required_python_packages }

Since EasyBuild v4.0, *no* Python packages outside of the Python standard library are required.

## Optional dependencies

Some dependencies are optional and are only required to support certain features.


### Optional Python packages {: #optional_python_packages }

* [GC3Pie](https://pypi.org/project/gc3pie), only needed when using `GC3Pie` as a backend for `--job`,
  see also [Submitting jobs using --job][submitting_jobs];
* [GitPython](https://github.com/gitpython-developers/GitPython), only needed if
  EasyBuild is hosted in a git repository or if you’re using a git
  repository for easyconfig files (.eb);
* [graphviz for Python](https://pypi.python.org/pypi/graphviz),
  only needed for building nice-looking dependency graphs using `--dep-graph *.pdf / *.png`;
* [keyring](https://pypi.org/project/keyring), only needed for securely storing a GitHub token
  (see [Integration with GitHub][integration_with_github]);
* [pycodestyle](https://pypi.org/project/pycodestyle),
  only required for `--check-style` and `--check-contrib`;
* [python-graph-dot](https://pypi.python.org/pypi/python-graph-dot/),
  only needed for building nice-looking dependency graphs using `--dep-graph *.dot`
* [Rich](https://pypi.org/project/rich/),
  only needed to let `eb` produce rich output, like [Progress bars][progress_bars];

## Sources

EasyBuild is split up into three different packages, which are available
from the Python Package Index (PyPi):

* [easybuild-framework](http://pypi.python.org/pypi/easybuild-framework) - the EasyBuild framework, which includes the
  easybuild.framework and easybuild.tools Python packages that provide
  general support for building and installing software
* [easybuild-easyblocks](http://pypi.python.org/pypi/easybuild-easyblocks) - a collection of easyblocks that implement
  support for building and installing (collections of) software
  packages
* [easybuild-easyconfigs](http://pypi.python.org/pypi/easybuild-easyconfigs) - a collection of example easyconfig files
  that specify which software to build, and using which build options;
  these easyconfigs will be well tested with the latest compatible
  versions of the easybuild-framework and easybuild-easyblocks packages
* [easybuild-docs](https://github.com/easybuilders/easybuild-docs) - a repository containing the sources
  of the EasyBuild documentation, which is hosted at <https://docs.easybuild.io>.

Next to these packages, a meta-package named [easybuild](https://pypi.python.org/pypi/easybuild) is also
available on PyPi, in order to easily install the full EasyBuild
distribution.

The source code for these packages is also available on GitHub:

* [easybuild-framework git repository](https://github.com/easybuilders/easybuild-framework)
* [easybuild-easyblocks git repository](https://github.com/easybuilders/easybuild-easyblocks)
* [easybuild-easyconfigs git repository](https://github.com/easybuilders/easybuild-easyconfigs)
* the [main EasyBuild repository](https://github.com/easybuilders/easybuild)


### In case of installation issues...

Should the installation of EasyBuild fail for you, [please open an issue][getting_help]
to report the problems you're running into.

#### How to collect info in case sanity checks fail or there is another issue

In order to get a better understanding in which kind of environment
you are using the bootstrap script, please copy-paste the commands below
and provide the output in your problem report.
**Do not worry if some of these commands fail or spit out error messages.**

``` shell 
python -V
type module
type -f module
module --version
module av EasyBuild
which -a eb
eb --version
```

# Configuration Legacy {: #configuring_simplebuild_legacy }

Legacy configuration is currently **deprecated!**

If you are a new user of SimpleBuild you can safely ignore everything
below this line, refer instead to [Configuring SimpleBuild][configuring_simplebuild].

---

## Porting from legacy configuration style

In SimpleBuild v1.x, a couple of configuration options, other than the
standard ones aligned with variables, are available that follow the
**legacy configuration style**, including:

- the `-C` and `--config` command line arguments ( **use**
    `--configfiles` **instead** )
- the `$SIMPLEBUILDCONFIG` environment variable ( **use**
    `$SIMPLEBUILD_CONFIGFILES` **instead** )
- the default path `$HOME/.simplebuild/config.py` ( **new-style default
    path is** `$XDG_CONFIG_HOME/simplebuild/config.cfg`)
- the legacy fallback path
    `<installpath>/simplebuild/simplebuild_config.py` ( **only
    default/fallback path is** `$XDG_CONFIG_HOME/simplebuild/config.cfg`)

Likewise, the following legacy environment variables allowed to override
selected configuration settings:

- `$SIMPLEBUILDBUILDPATH`: build path to be used by SimpleBuild ( **use**
    `$SIMPLEBUILD_BUILDPATH` **instead** )
- `$SIMPLEBUILDINSTALLPATH`: install path to be used by SimpleBuild (
    **use** `$SIMPLEBUILD_INSTALLPATH` **instead** )
- `$SIMPLEBUILDSOURCEPATH`: source path to be used by SimpleBuild (
    **use** `$SIMPLEBUILD_SOURCEPATH` **instead** )
- `$SIMPLEBUILDPREFIX`: build/install/source path prefix to be used (
    **use** `$SIMPLEBUILD_PREFIX` **instead** )

We *strongly* advise to switch to the new way of configuring SimpleBuild
as soon as possible, since the legacy configuration style will no longer
be supported in SimpleBuild v2.x.

## How SimpleBuild used to be configured in the early days

Configuring *SimpleBuild* is done by providing a configuration
file.

SimpleBuild expects the configuration file to contain valid Python code,
because it executes its contents (using `exec`). The rationale is that
this approach provides a lot of flexibility for configuring SimpleBuild.

SimpleBuild will use the file that is provided by the path/filename in the
following order of preference:

- path/filename specified on the SimpleBuild command line (using
    `--config`),
- path/filename obtained from the environment variable
    `SIMPLEBUILDCONFIG` (if it is defined)
- `$HOME/.simplebuild/config.py` (as of SimpleBuild v1.1)
- the (default) configuration file at
    `<path where SimpleBuild was installed>/simplebuild/simplebuild_config.py`

### Configuration variables

The configuration file must define the following five variables:
`build_path`, `install_path`, `source_path`, `repository`, and
`log_format`. If one of them is not defined, SimpleBuild will complain and
exit.

#### Build path (required)

The `build_path` variable specifies the directory in which SimpleBuild
builds its software packages.

Each software package is (by default) built in a subdirectory of the
`build_path` under `<name>/<version>/<toolchain><versionsuffix>`.

Note that the build directories are emptied by SimpleBuild when the
installation is completed (by default).

#### Install path (required)

The `install_path` variable specifies the directory in which SimpleBuild
installs software packages and the corresponding module files.

The packages themselves are installed under `install_path/software` in
their own subdirectory aptly named
`<name>/<version>-<toolchain><versionsuffix>` (by default), where name
is the package name. The corresponding module files are installed under
`install_path/modules`.

**Setting `$MODULEPATH`**

After the configuration, you need to make sure that `$MODULEPATH`
environment variable is extended with the `modules/all` subdirectory of
the `install_path`, i.e.:

``` shell
export MODULEPATH=<install_path>/modules/all:$MODULEPATH
```

It is probably a good idea to add this to your (favourite) shell .rc
file, e.g., `.bashrc`, and/or the `.profile` login scripts, so you do
not need to adjust the `$MODULEPATH` variable every time you start a new
session.

#### Source path (required)

The `source_path` variable specifies the directory in which SimpleBuild
looks for software source and install files.

Similarly to the configuration file lookup, SimpleBuild looks for the
installation files as given by the `sources` variable in the .eb
simpleconfig file, in the following order of preference:

- `<source_path>/<name>`: a subdirectory determined by the name of the
    software package
- `<source_path>/<letter>/<name>`: in the style of the
    `simpleblocks`/`simpleconfigs` directories: in a subdirectory determined
    by the first letter (in lower case) of the software package and by
    its full `name`
- `<source_path>`: directly in the source path

Note that these locations are also used when SimpleBuild looks for patch
files in addition to the various `simplebuild/simpleconfigs` directories
that are listed in the `$PYTHONPATH`.

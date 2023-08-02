# Implementing simpleblocks {: #implementing_simpleblocks }

This documentation covers aspects of implementing *simpleblocks* and how to use them.
For a concise definition of simpleblocks, see [Simpleblocks][simpleblocks].

## The basics {: #implementing_simpleblocks_basics }

An *simpleblock* is a Python module that implements a software build and installation procedure.

This concept is essentially implemented as a Python script that plugs into the [SimpleBuild framework][framework].

SimpleBuild will leverage simpleblocks as needed, depending on which software packages it needs to install.
Which simpleblock is required is determined by the `simpleblock` simpleconfig parameter, if it is present,
or the software name (see [Generic vs software-specific simpleblocks][implementing_simpleblocks_generic_vs_software_specific]).


### Generic vs software-specific simpleblocks {: #implementing_simpleblocks_generic_vs_software_specific }

Simpleblocks can either be *generic* or *software-specific*.

Generic simpleblocks implement a 'standard' software build and installation procedure that is used by multiple different
software packages.
A commonly used example is the
[ConfigureMake](https://github.com/simplebuilders/simplebuild-simpleblocks/blob/main/simplebuild/simpleblocks/generic/configuremake.py)
generic simpleblock, which implements the standard `configure` - `make` - `make install` installation procedure used
by most GNU software packages.

Software-specific simpleblocks implement the build and installation procedure for a particular software package
(see also [Module name/location][implementing_simpleblocks_naming_scheme_module]).
Typically this involves highly customised substeps, for example specifying dedicated configuration options, creating
or adjusting specific files, executing non-standard shell commands, etc. Usually a custom implementation of the
sanity check is also included.

Since SimpleBuild v2.0, using a generic simpleblock requires specifying the `simpleblock` parameter in the simpleconfig file.
If it is not specified, SimpleBuild will try and find the software-specific simpleblock derived from the software name.

The distinction between generic and software-specific simpleblocks can be made based on the naming scheme that is used
for an simpleblock (see also [Naming scheme for simpleblocks][implementing_simpleblocks_naming_scheme]).

See also [][generic_simpleblocks].


## Simpleblocks vs simpleconfigs {: #implementing_simpleblocks_vs_simpleconfigs }

Before you start implementing an simpleblock, you should determine whether or not you really need an simpleblock.

[Simpleconfig files][simpleconfig_files] provide quite a bit of flexibility that alleviate the need for implementing many (software-specific)
simpleblocks. Examples include simpleconfig parameters like `(pre){config,build,installopts}` (available for any simpleblock),
`install_cmd` (only for `Binary` generic simpleblock or derivates), etc. See [Writing simpleconfig files: the basics][writing_simpleconfig_files] for an
overview of what is supported in simpleconfig files, and [][generic_simpleblocks] for custom simpleconfig parameters for
the existing generic simpleblocks (see also '`eb -e <simpleblock> -a`').

On the other hand, somewhat complex or heavily customised software build and installation procedures may be handled better
via a custom simpleblock.

Simpleblocks are "do once and forget", and can provide a *central* solution for peculiarities of installations.
Since they are basically Python scripts, they are very flexible and can take care of the
'heavy lifting' that goes beyond the key-value defining scope of simpleconfig files.

Hence, there is a fine line between using 'fat' simpleconfigs with a generic simpleblock and using a custom software-specific simpleblock.

Reasons to consider implementing a custom simpleblock include:

* 'critical' values for simpleconfig parameters, which are required to make the installation succeed
* compiler- or toolchain-specific aspects of the build and installation procedure (e.g., configure/build/install options)
* interactive commands that need to be run
* custom (configure) options for dependencies
* having to create or adjust specific (configuration) files
* 'hackish' usage of existing (generic) simpleblocks and available simpleconfig parameters

One important aspect to consider of course is that implementing simpleblocks requires some familiarity with Python,
while simpleconfig files can mostly be seen as a set of pure key-value definitions and hence are easier to create or
update.


## Naming scheme for simpleblocks {: #implementing_simpleblocks_naming_scheme }

Simpleblocks need to follow a strict naming scheme, to ensure that SimpleBuild can pick them up as needed.
This involves two aspects: i) the name of the Python class, and ii) the name and location of the Python module file.


### Class name for software-specific simpleblocks {: #implementing_simpleblocks_naming_scheme_class_name_specific }

The name of the Python class is determined by the *software name* for software-specific simpleblocks.
It consists of a prefix '`EB_`', followed by the (original) software name.

Because of limitations in Python on characters allowed in names of Python classes,
only alphanumeric characters and `_` are allowed. Any other characters are replaced following an encoding scheme:

* spaces are replaced by underscores (`_`)
* dashes `-` are replaced by `_minus_`
* underscores are replaced by `_underscore_`
* etc.

The `encode_class_name` function provided in `simplebuild.tools.filetools` returns the expected class name
for a given software name; for example:

``` python
>>> from simplebuild.tools.filetools import encode_class_name
>>> encode_class_name('netCDF-Fortran')
'EB_netCDF_minus_Fortran'
```


### Class name for generic simpleblocks {: #implementing_simpleblocks_naming_scheme_class_name_generic }

For *generic* simpleblocks, the class name does *not* include an `EB_` prefix (since there is no need for an escaping
mechanism) and hence the name is fully free to choose, taking into account the restriction to alphanumeric characters
and underscores.

For code style reasons, the class name should start with a capital letter.

Examples include `Bundle`, `ConfigureMake`, `CMakePythonPackage`.


### Module name/location {: #implementing_simpleblocks_naming_scheme_module }

The *name* of the Python module file is directly related to the name of Python class (i.e., the actual simpleblock) that it provides.

It should:

* *not* include the `EB_` prefix of the class name for software-specific simpleblocks
* consists only of lower-case alphanumeric characters (`[a-z0-9]`) and underscores (`_`)
    * dashes (`-`) are replaced by underscores (`_`)
    * any other non-alphanumeric characters (incl. spaces) are simply dropped

Examples include:

* `gcc.py` (for *GCC*)
* `netcdf_fortran.py` (for *netCDF-Fortran*)
* `gamess_us.py` (for *GAMESS (US)*)

The `get_module_path` function provided in `simplebuild.framework.simpleconfig.simpleconfig` returns the (full)
module location for a particular software name or simpleblock class name; for example:

``` python
>>> from simplebuild.framework.simpleconfig.simpleconfig import get_module_path
>>> get_module_path('netCDF-Fortran')
'simplebuild.simpleblocks.netcdf_fortran'
>>> get_module_path('EB_netCDF_minus_Fortran')
'simplebuild.simpleblocks.netcdf_fortran'
```

The location of the Python module is determined by whether the simpleblock is generic or software-specific.
Generic simpleblocks are located in the `simplebuid.simpleblocks.generic` namespace, while software-specific simpleblocks
live in the `simplebuild.simpleblocks` namespace directly. To keep things organised, the actual Python module file
for software-specific simpleblocks are kept in 'letter' subdirectories,
rather than in one large '`simpleblocks`' directory
(see <https://github.com/simplebuilders/simplebuild-simpleblocks/blob/main/simplebuild/simpleblocks/>).

Note that you shouldn't concern yourself too much with getting the location of an simpleblock right, as long as you
use `--include-simpleblocks` to make SimpleBuild use additional or customised simpleblocks
(see [Including additional simpleblocks (`--include-simpleblocks`)][include_simpleblocks] for more information).


## Structure of an simpleblock {: #implementing_simpleblocks_structure }

The example below shows the overall structure of an simpleblock:

``` python
from simplebuild.framework.simpleblock import SimpleBlock
from simplebuild.tools.run import run_cmd

class EB_Example(SimpleBlock):
    """Custom simpleblock for Example"""

    def configure_step(self):
        """Custom implementation of configure step for Example"""

        # run configure.sh to configure the build
        run_cmd("./configure.sh --install-prefix=%s" % self.installdir)
```


Each simpleblock includes an implementation of a `class` that (directly or indirectly) derives from the abstract
`SimpleBlock` class.

Typically some useful functions provided by the SimpleBuild framework are imported at the top of the Python module.

In the class definition, one or more '`*_step`' methods are redefined, to implement the corresponding step
in the build and installation procedure.

Each simpleblock *must* implement the `configure`, `build` and `install` steps, since these are not implemented
in the abstract `SimpleBlock` class. This could be done explicitly by redefining the corresponding `*_step` methods,
or implicitly by deriving from existing (generic) simpleblocks.


## Deriving from existing (generic) simpleblocks {: #implementing_simpleblocks_deriving }

When implementing an simpleblock, it is common to derive from an existing (usually generic) simpleblock,
and to leverage the functionality provided by it. This approach is typically used when only a specific part
of the build and installation procedure needs to be customised.

In the (fictitious) example below, we derive from the generic `ConfigureMake` simpleblock to redefine the `configure`
step. In this case, we are *extending* the `configure` step as implemented by `ConfigureMake` rather than
redefining it entirely, since we call out to the original `configure_step` method at the end.

``` python
from simplebuild.simpleblocks.generic.configuremake import ConfigureMake
from simplebuild.tools.filetools import copy_file

class EB_Example(ConfigureMake):
    """Custom simpleblock for Example"""

    def configure_step(self):
        """Custom implementation of configure step for Example"""

        # use example make.cfg for x86-64
        copy_file('make.cfg.x86', 'make.cfg')

        # call out to original configure_step implementation of ConfigureMake simpleblock
        super(EB_Example, self).configure_step()
```


## Specific aspects of simpleblocks {: #implementing_simpleblocks_specifics }

### Default simpleconfig parameters {: #implementing_simpleblocks_default_parameters }

All of the parameters which are "set" in an simpleconfig file (see [Available simpleconfig parameters][vsd_avail_simpleconfig_params])
become key-value pairs in the `self.cfg` dictionary.  For instance, if the simpleconfig file specifies

``` python
name = 'example'
version = '2.5.3'
versionsuffix = '-Python-3.7.4'
```

then these three parameters are accessible within an simpleblock via

``` python
longform = ''.join(self.cfg['name'],'/',self.cfg['version'],self.cfg['versionsuffix'])
```

You can use this notation successfully in your simpleblock.  A few of the most commonly used parameters can be referenced
directly,

* **self.name** = `self.cfg['name']`
* **self.version** = `self.cfg['version']`
* **self.toolchain** = `self.cfg['toolchain']`
* **self.all_dependencies**: combines `builddependencies`, `dependencies`, and `toolchain`, in one dictionary

So in your simpleblock code, you may replace the above expression with

``` python
longform = ''.join(self.name,'/',self.version,self.cfg['versionsuffix'])
```

The other simpleconfig parameters, and any additional [custom parameters][implementing_simpleblocks_custom_parameters]
which you define for your own simpleblock, will not be automatically mapped.
You will need to use `self.cfg` to access them in your code.


### Custom simpleconfig parameters {: #implementing_simpleblocks_custom_parameters }

In an simpleblock, additional custom simpleconfig parameters can be defined to steer the behaviour of the simpleblock.
This is done via the `extra_options` static method. Custom parameters can be defined to be mandatory or optional.

The example below shows how this can be implemented:

``` python
from simplebuild.simpleblocks.generic.configuremake import ConfigureMake
from simplebuild.framework.simpleconfig import CUSTOM, MANDATORY

class EB_Example(ConfigureMake):
    """Custom simpleblock for Example"""

    @staticmethod
    def extra_options():
        """Custom simpleconfig parameters for Example"""
        extra_vars = {
            'required_example_param': [None, "Help text for required example custom parameter", MANDATORY],
            'optional_example_param': [None, "Help text for (optional) example custom parameter", CUSTOM],
        }
        return ConfigureMake.extra_options(extra_vars)
```

The first element in the list of a defined custom parameter corresponds to the default value for that parameter
(both `None` in the example above). The second element provides some informative help text, and the last element
indicates whether the parameter is mandatory (`MANDATORY`) or just a custom parameter (`CUSTOM`).


### Simpleblock constructor {: #implementing_simpleblocks_constructor }

In the `class` constructor of the simpleblock, i.e. the `__init__` method, one or more class variables
can be initialised. These can be used for sharing information between different `*_step` methods in the simpleblock.

For example:

``` python
from simplebuild.framework.simpleblock import SimpleBlock

class EB_Example(SimpleBlock):
    """Custom simpleblock for Example"""

    def __init__(self, *args, **kwargs):
        """Constructor for Example simpleblock, initialises class variables."""

        # call out to original constructor first, so 'self' (i.e. the class instance) is initialised
        super(EB_Example, self).__init__(*args, **kwargs)

        # initialise class variables
        self.var1 = None
        self.var2 = None
```


### Reading/writing/copying/patching files {: #implementing_simpleblocks_files }

File manipulation is a common use case for implementing simpleblocks, hence the SimpleBuild framework provides a
number of useful functions related to this, including:

* `read_file(<path>)`: read file at a specified location and returns its contents
* `write_file(<path>, <text>)` at a specified location with provided contents;
  to append to an existing file, use `append=True` as an extra argument
* `copy_file(<src>, <dest>)` to copy an existing file
* `apply_regex_substitutions(<path>, <list of regex substitutions>)` to patch an existing file

All of these functions are provided by the `simplebuild.tools.filetools` module.


### Executing (interactive) shell commands {: #implementing_simpleblocks_commands }

For executing shell commands two functions are provided by the `simplebuild.tools.run` module:

* `run_cmd(<cmd>)` to run a non-interactive shell command
* `run_cmd_qa(<cmd>, <dict with questions & answers>)` to run an interactive shell command

Both of these accept a number of optional arguments:

* `simple=True` to just return `True` or `False` to indicate a successful execution,
  rather than the default return value, i.e., a tuple that provides the command output and the exit code (in that order)
* `path=<path>` to run the command in a specific subdirectory

The `run_cmd_qa` function takes two additional specific arguments:

* `no_qa=<list>` to specify a list of patterns to recognize non-questions
* `std_qa=<dict>` to specify patterns for common questions and the matching answer


### Manipulating the environment {: #implementing_simpleblocks_environment }

To (re)define environment variables, the `setvar` function provided by the `simplebuild.tools.environment` module
should be used.

This makes sure that the changes being made to the specified environment variable are kept track of,
and that they are handled correctly under `--extended-dry-run`.


### Log statements {: #implementing_simpleblocks_logging }

It is good practice to include meaningful log messages in the `*_step` methods being customised in the simpleblock,
to enrich the build log with useful information for later debugging or diagnostics.

For logging, the provided `self.log` logger class should be used, i.e. the `self.log.info` or `self.log.debug`
methods should be called.


### Custom (default) sanity check {: #implementing_simpleblocks_sanity_check }

For software-specific simpleblocks, a custom sanity check is usually included to verify that the installation was
successful or not.

This is done by redefining the `sanity_check_step` method in the simpleblock. For example:

``` python

from simplebuild.framework.simpleblock import SimpleBlock

class EB_Example(SimpleBlock):
    """Custom simpleblock for Example"""

    def sanity_check_step(self):
        """Custom sanity check for Example."""

        custom_paths = {
            'files': ['bin/example'],
            'dirs': [],
        }
        custom_commands = ['example --version']

        # call out to parent to do the actual sanity checking, pass through custom paths and commands
        super(EB_Example, self).sanity_check_step(custom_paths=custom_paths, custom_commands=custom_commands)
```


You can both specify file path and subdirectories to check for, which are specified relative to the installation directory,
as well as simple commands that should execute successfully after completing the installation and loading the generated module file.

Note that it is up to you how extensive you make the sanity check, but it is recommended to make the check as complete
as possible to catch any potential build or installation problems that may occur.


### Version-specific parts {: #implementing_simpleblocks_version_specific }

In some case, version-specific actions or checks need to be included in an simpleblock.
For this, it is recommended to use `LooseVersion` rather than directly comparing version numbers using string values.

For example:


``` python
from distutils.version import LooseVersion

from simplebuild.framework.simpleblock import SimpleBlock

class EB_Example(SimpleBlock):
    """Custom simpleblock for Example"""

    def sanity_check_step(self):
        """Custom sanity check for Example."""

        custom_paths = {
            'files': [],
            'dirs': [],
        }

        # in older version, the binary used to be named 'EXAMPLE' rather than 'example'
        if LooseVersion(self.version) < LooseVersion('1.0'):
            custom_paths['files'].append('bin/EXAMPLE')
        else:
            custom_paths['files'].append('bin/example')

        super(EB_Example, self).sanity_check_step(custom_paths=custom_paths)
```


### Compatibility with `--extended-dry-run`/`-x` and `--module-only` {: #implementing_simpleblocks_module_only_compatibility }

Some special care must be taken to ensure that an simpleblock is fully compatible with `--extended-dry-run` / `-x`
(see [Extended dry run][extended_dry_run]) and `--module-only` (see [Only (re)generating (additional) module files using `--module-only`][module_only]).

For `--extended-dry-run`/`-x`, this is already well covered at [Detecting dry run mode and enhancing the dry run output][extended_dry_run_guidelines_simpleblocks_detect_dry_run].

For `--module-only`, you should make sure that both the `make_module_step`, including the `make_module_*` submethods,
and the `sanity_check_step` methods do not make any assumptions about the presence of certain environment variables
or that class variables have been defined already.

This needs to be handled with care since under `--module-only` the large majority of the `*_step` functions is
simply skipped entirely. So, if the `configure_step` method is responsible for defining class variables that are
picked up in `sanity_check_step`, the latter may run into unexpected initial values like `None`.
A possible workaround is to define a separate custom method to define the class variables, and to call out to this
method from `configure_step` and `sanity_check_step` (for the latter, conditionally, i.e., only if the class
variables still have the initial values).


## Using new/custom simpleblocks {: #implementing_simpleblocks_using }

The best way to make SimpleBuild aware of new or customized simpleblocks is via `--include-simpleblocks`,
see [Including additional simpleblocks (`--include-simpleblocks`)][include_simpleblocks] for more information.

To verify that your simpleblocks are indeed picked up correctly, you can use `--list-simpleblocks=detailed`,
see also [List of available simpleblocks, `--list-simpleblocks`][list_simpleblocks].


## Testing simpleblocks {: #implementing_simpleblocks_testing }

Before testing your simpleblock implementation by actually building and installing the software package(s) it
was implemented for, it is recommended to:

* study the output produced by `--extended-dry-run`/`-x`
* evaluate the generated module file that is obtained by using `--module-only --force`

For the output of `--extended-dry-run`/`-x`, there should be no ignored errors (cfr. [Errors are ignored (by default) during dry run][extended_dry_run_notes_ignored_errors]),
that is the end of the output produced should include this message:

``` log
(no ignored errors during dry run)
```


With `--module-only --force`, the simpleblock complete successfully without crashing, and should generate a module
file that includes everything that is expected (except for statements that require that the actual installation was
performend).


## Use case: an simpleblock for Tensorflow {: #implementing_simpleblocks_use_case_tensorlow }

*(work in progress)*


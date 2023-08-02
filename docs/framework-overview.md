# SimpleBuild Framework Overview {: #framework_overview }

## Package Structure

The `simplebuild-framework` package provides the following `simplebuild.*` Python
packages:

* **simplebuild.framework** is the core of SimpleBuild, which contains the
  machinery to build and install software by processing
  [SimpleConfigs][simpleconfig_files] and their [SimpleBlocks][simpleblocks].

* **simplebuild.tools** is a toolbox of utilities used across the SimpleBuild
  codebase (simplebuild-framework and simplebuild-simpleblocks). Its functionality
  ranges from handling SimpleBuild options and configuration, to file system
  operations, including the
  [integration with GitHub][integration_with_github],
  support for [hooks][hooks], etc.

* **simplebuild.toolchains** contains all [toolchain][toolchains] definitions.

Overview of the package structure of SimpleBuild framework (v4.7.1) — `simplebuild.framework` shown in blue and `simplebuild.tools` in orange:
![SimpleBuild Framework package structure](img/framework-package-diagram-4.7.1.svg)

## Workflow Overview {: #workflow_overview }

The following diagram shows the main steps carried out by SimpleBuild for a
regular software installation with the `eb` command:

```mermaid
stateDiagram-v2
    simplebuild.main --> tools
    robot --> build_install
    build_install --> simpleblock
    
    state "simplebuild.tools" as tools{
        [*] --> options
        options --> parse_ec
        process_ec --> robot
        
        state "simplebuild.tools.options
        • parsing of options
        • set_up_configuration( )" as options
        
        state "simplebuild.tools.robot
        • resolve_dependencies( )" as robot
    }

    state "build_and_install_software( )" as build_install
    
    state "simplebuild.framework.simpleblock" as simpleblock{
        [*] --> build_install_one
        build_install_one --> get_simpleblock
        get_simpleblock --> simpleblock_class

        state "simplebuild.framework.simpleblock
        • build_and_install_one( )" as build_install_one
        
        state "class SimpleBlock
        • run_all_steps( )" as simpleblock_class
    }

    state "simplebuild.framework.simpleconfig" as simpleconfig{
        parse_ec --> process_ec

        state "simplebuild.framework.simpleconfig.tools
        • parse_simpleconfigs( )" as parse_ec

        state "simplebuild.framework.simpleconfig.simpleconfig
        • process_simpleconfig( )" as process_ec

        state "simplebuild.framework.simpleconfig.simpleconfig
        • get_simpleblock_class( )" as get_simpleblock
    }
    
```

The process starts by calling the `set_up_configuration` function, which takes
care of configuration options passed to SimpleBuild. Either through the command
line, configuration files or in the environment.

The scope of the SimpleBuild execution is ultimately defined by the target
simpleconfig files given in the `eb` command. They will define the number of
actions to carry out, such as software installations, fetching of sources or
opening of PRs. Therefore, target simpleconfig files are parsed early in the
process, just after the runtime options have been resolved. The tooling to
parse simpleconfig files is located in a specific `tools` module in
`simplebuild.framework.simpleconfig.tools`, while the `SimpleConfig` class is found
in `simplebuild.framework.simpleconfig.simpleconfig`.

Once the simpleconfig files are properly parsed, a common action is to resolve
the dependencies for those installations with the [`--robot`][use_robot]
option. This is handled in `simplebuild.tools.robot` which provides methods to
search simpleconfig files, resolve dependencies, and check conflicts between
software packages.

The `resolve_dependencies` function returns an ordered list of all (parsed)
simpleconfigs that have to be installed to fulfill the dependency requirements of
the requested installation (or throws an error if those dependencies cannot be
fulfilled). SimpleBuild will iterate over that list carrying out each
installation in sequence.

The installation procedure of each software package is defined by the
[simpleblock][simpleblocks] attached to it. This means that SimpleBuild creates an
`SimpleBlock` instance for each individual installation and determines the
simpleblock to use from the simpleconfig file. Once the `SimpleBlock` instance is
created, SimpleBuild will call its `run_all_steps()` method to execute the
installation steps defined for that software.

### Step-wise Installation Procedure {: #step_wise_install }

```mermaid
flowchart LR
    subgraph source_phase [A. Setting up]
        direction TB
        parse[A1. Parse SimpleConfig]
        fetch[A2. Fetch sources]
        check[A3. Check readiness]
        unpack[A4. Unpack sources]
        patch[A5. Apply patches]
        parse --> fetch
        fetch --> check
        check --> unpack
        unpack --> patch
    end
    subgraph build_phase [B. Installing]
        direction TB
        prepare[B1. Prepare build]
        config[B2. Configure build]
        build[B3. Compile/build]
        test[B4. Test]
        install[B5. Install]
        prepare --> config
        config --> build
        build --> test
        test --> install
    end
    subgraph ext_phase [Extensions]
        ext_install[Extension Install]
    end
    subgraph clean_phase [C. Wrapping up]
        direction TB
        postinstall[C1. Post-Install]
        sanity[C2. Sanity check]
        clean[C3. Clean-up]
        module[C4. Make Module]
        perms[C5. Permissions]
        package[C6. Package]
        testcases[C7. Test Cases]
        postinstall --> sanity
        sanity --> clean
        clean --> module
        module --> perms
        perms --> package
        package --> testcases
    end
    source_phase --> build_phase
    build_phase --> ext_phase
    ext_phase --> clean_phase
```

## SimpleBlock class

The base `SimpleBlock` class in `simplebuild.framework.simpleblock` is a skeleton class
that cannot carry out any installation on its own, but that lays the ground for
child classes to define custom installation procedures. This does not mean that
the `SimpleBlock` class is an empty shell though, it is actually one of the biggest
classes in SimpleBuild with 4000+ lines of code (v4.7.x). It provides methods for
generic actions that are useful in most installations, independently of the
installation method.

Most of the steps in the initial [*Arrangement phase*][step_wise_install] are
already covered to some extent in the `SimpleBlock` class, such as:

* A2. Fetch sources: `SimpleBlock.fetch_sources`, `SimpleBlock.fetch_patches`,
  `SimpleBlock.obtain_file`

* A3. Check readiness: `SimpleBlock.make_buildir`, `SimpleBlock.reset_env`

* A4. Unpack sources: `SimpleBlock.checksum_step`, `SimpleBlock.extract_step`

Several steps in the last [*Cleaning phase*][step_wise_install] are already
covered by the base `SimpleBlock` as well:

* C1. Post-Install: `SimpleBlock.run_post_install_commands`,
  `SimpleBlock.apply_post_install_patches`, `SimpleBlock.fix_shebang`

* C2. Sanity check: `SimpleBlock.sanity_check_step`,
  `SimpleBlock.sanity_check_load_module`,
  `SimpleBlock.sanity_check_linked_shared_libs`

* C3. Clean-up: `SimpleBlock.cleanup_step`

* C4. Env. Module: `SimpleBlock.make_module_step`

* C5. Permissions: `SimpleBlock.permissions_step`

Therefore, custom simpleblocks (child classes of `SimpleBlock`) only need to define
some of the steps in the [*Build and Install phase*][step_wise_install], the
core of the workflow. Specifically, the configuration (B2), build (B3) and
install (B4) steps are the only mandatory steps in custom simpleblocks. Check the
section [*Implementing SimpleBlocks*][implementing_simpleblocks] to start writing
your own custom simpleblocks.

## Extension and ExtensionSimpleBlock classes

The `SimpleBlock` class has the machinery to trigger the installation of any
extensions found in the simpleconfig file. The method `SimpleBlock.run_all_steps`
always goes through `SimpleBlock.extensions_step` which executes the installation
of each extension instance in `SimpleBlock.ext_instances` (if any).

The installation process in the extension step starts in
`SimpleBlock.install_extensions`, which will determine the installation approach
for the extensions (sequential or parallel based on given options/support) and
call the `Extension.run` method of each extension instance. This `run` method
is the one carrying out the actual installation of the extension and typically
executes the install step of the parent `SimpleBlock` with some extra actions
before and/or after it. Nonetheless, custom simpleblocks for extensions can fully
redefine their `run` method.

!!! warning
    In SimpleBuild v5.0 the name of the `Extension.run` method will be changed
    to a more meaningful and less generic name.

Framework also provides the `ExtensionSimpleBlock` class which inherits from both
`SimpleBlock` and `Extension`. This class is useful for software that can be
either installed standalone with their own simpleconfig file or as an extension:

* as extension: `ExtensionSimpleBlock` uses the `Extension` class

* stand-alone: `ExtensionSimpleBlock` uses the `SimpleBlock` class

For instance, `PythonPackage`, `RPackage` or `PerlModule` are generic simpleblocks
commonly used to install standalone packages or extensions of packages that use
other simpleblocks. You will find many examples of both cases in our
[simpleblock-simpleconfigs](https://github.com/simplebuilders/simplebuild-simpleconfigs/)
repository. 

## SimpleConfig class

The `SimpleConfig` class handles parsing and validating of simpleconfig files. As
such, `SimpleConfig` is independent from `SimpleBlock` and it is actually needed to
determine the simpleblock used in the installation of the target software
package.

Once the target simpleconfig file is read and all its parameters are validated,
they will be accessible through different attributes and methods of the
SimpleConfig object. The main examples are:

* `SimpleConfig.name` returns the name of the package

* `SimpleConfig.version` returns the version of the package

* `SimpleConfig.toolchain` returns the toolchain used by the package

* `SimpleConfig.dependencies()` returns the list of dependencies

!!! note
    The SimpleConfig instance is also accessible from the corresponding SimpleBlock
    instance through its `SimpleBlock.cfg` attribute.

## SimpleStack class

!!! warning
    SimpleStacks are an experimental feature in active development.

The machinery for [SimpleStacks][simplestack] is located in the `simplebuild.framework.simplestack` module. It contains:

* `SimpleStackParser`: class to parse the simplestack files in YAML format

* `SoftwareSpecs`: attribute class with the specs of each software package in the simplestack

* `SimpleStack`: collection of `SoftwareSpecs` in the simplestack

## Toolchain mechanism

A [toolchain][toolchains] in SimpleBuild is much more than just a bundle of
libraries and compilers to build and run software in a consistent environment.
Toolchains are defined by their own classes built on top of the `Toolchain`
class.

The base `Toolchain` class is defined in `simplebuild.tools.toolchain.toolchain`.
It does not only provide the attributes defining the toolchain (*i.e.* name and
version) but also provides methods to setup the build environment with that
toolchain :

* set the environment of the toolchain: `Toolchain.prepare`

    * validate dependencies for the toolchain: `Toolchain._check_dependencies`

    * load modules of the toolchain: `Toolchain._load_modules`

    * set environment variables (*e.g.* `$CC`, `$CFLAGS`):
      `Toolchain._setenv_variables`

    * handle build options: `Toolchain.prepare_rpath_wrappers`,
      `Toolchain.prepare_compiler_cache`, `Toolchain.handle_sysroot`

Hence, the base `Toolchain` class provides the skeleton to further develop
custom toolchain definitions through child classes. SimpleBuild already provides
[many toolchains definitions][toolchains_table] that cover
[common][common_toolchains] and not-so-common combinations of compilers,
numeric libraries and MPI implementations. All toolchain definitions are found
in the `simplebuild.toolchains` package of the SimpleBuild framework.

Toolchains are modular. Each *toolchain component* (*i.e* compiler, numerical
library, MPI implementation) is defined by its own child class or by
multiple ones. These components are combined in sub-toolchains (*e.g.* the
`gompi` toolchain) which can then be re-combined with other components in
bigger toolchains (*e.g.* the `foss` toolchain). Therefore, the resulting options
of the toolchain, its attributes and methods will be the combined result of all
inherited class components.

```mermaid
flowchart
    toolchain --> compiler & mpi & linalg & fft
    subgraph "Compiler"
        compiler --> gcc --> gcccore --> gcctoolchain 
    end
    subgraph "MPI Implementation"
        mpi --> ompi 
    end
    gcctoolchain & ompi --> gompi --> foss
    subgraph "Fast-Fourier Libraries"
        fft --> fftw 
    end
    fftw --> foss
    subgraph "Linear Algebra Libraries"
        linalg --> oblas & fblas
        linalg --> blacs --> scalapack
    end
    oblas & fblas & scalapack --> foss
    toolchain("class Toolchain
    eb.tools.toolchain.toolchain")
    compiler("class Compiler
    eb.tools.toolchain.compiler")
    gcc("class Gcc
    eb.toolchains.compiler.gcc")
    gcccore("class GccCore
    eb.toolchains.gcccore")
    gcctoolchain("class GccToolchain
    eb.toolchains.gcc")
    mpi("class Mpi
    eb.tools.toolchain.mpi")
    ompi("class OpenMPI
    eb.toolchains.mpi.openmpi")
    gompi("class Gompi
    eb.toolchains.gompi")
    fft("class Fft
    eb.tools.toolchain.fft")
    fftw("class Fftw
    eb.toolchains.fft.fftw")
    linalg("class LinAlg
    eb.tools.toolchain.linalg")
    oblas("class OpenBLAS
    eb.toolchains.linalg.openblas")
    fblas("class FlexiBLAS
    eb.toolchains.linalg.flexiblas")
    blacs("class Blacs
    eb.toolchains.linalg.blacs")
    scalapack("class ScaLAPACK
    eb.toolchains.linalg.scalapack")
    foss("class Foss
    eb.toolchains.foss")
```

## SimpleBuild configuration options

Configuration options in SimpleBuild can come from multiple sources:

* command line arguments to the `eb` command
* environment variables
* settings in configuration files
* settings in simpleconfig files

!!! tip
    Check the [Configuring SimpleBuild][configuring_simplebuild] for details on how
    to use the different configuration mechanisms.

All configuration options in SimpleBuild are defined in `simplebuild.tools.options`.
The `SimpleBuildOptions` class gathers all options, including the name of the
argument and its help string.

The `simplebuild.tools.options` module also handles the parsing of options
through its `set_up_configuration()` method, which is called in the
[very early stages][workflow_overview] of the `eb` execution. The main step is
`parse_options()` to read and validate the command line itself.

Once all options are parsed, those options listed in `simplebuild.tools.config`
will be gathered in a singleton `BuildOptions` class. This class is the
centralized location of configuration options for the current SimpleBuild
session. The method `build_option()` in `simplebuild.tools.config` provides a
simple interface to it:

```python
if build_option('ignore_test_failure'):
    print_warning("Test failure ignored")
else:
    raise SimpleBuildError("Test failure")
```

Therefore, adding a new option to `eb` and making that options available
through `build_option()` is a two step process. First the option has to be
added to `SimpleBuildOptions` in `simplebuild.tools.options` and then also listed
in `simplebuild.tools.config`. As an example, you can check
[simplebuild-framework#4226](https://github.com/simplebuilders/simplebuild-framework/pull/4226)
which is a PR adding the `download_timeout` option to SimpleBuild.

## Features in simplebuild.tools

### Environment modules

#### Interface

[`simplebuild.tools.modules`](/api/simplebuild/tools/modules/) provides the
interface to the different [environment module tools][modules_tool] supported
in SimpleBuild. The `ModulesTool` class is an abstraction layer to interact with
the environment modules in the host system.

Additionally, `simplebuild.tools.modules` also provides methods to retrieve
information about loaded software in the SimpleBuild environment, such as
`get_software_root()` or `get_software_version()`, which are extensively used
in simpleblocks.

#### Naming scheme

[`simplebuild.tools.module_naming_scheme`](/api/simplebuild/tools/module_naming_scheme/)
contains the definitions of the [module naming schemes][module_naming_scheme]
(MNS) supported in SimpleBuild. You will find in it one module per MNS. The
structure of the naming scheme is defined in corresponding classes based on
`ModuleNamingScheme`.

#### Module generator

[`simplebuild.tools.module_generator`](/api/simplebuild/tools/module_generator/)
is the engine used by SimpleBuild to write module files.
It provides the `ModuleGeneratorLua` and `ModuleGeneratorTcl` classes for each
of the supported module file formats. The module generator is mainly used in
the [make module step][step_wise_install] of the installation process.

### Host system

#### System information

[`simplebuild.tools.systemtools`](/api/simplebuild/tools/systemtools/) provides a
toolset to check multiple aspects of the underlying operative system, such as
CPU specs, amount of memory, OS characteristics and system libraries.

#### Environment

[`simplebuild.tools.environment`](/api/simplebuild/tools/environment/) provides an
interface to access and modify the environment in the host system.

#### File system

[`simplebuild.tools.filetools`](/api/simplebuild/tools/filetools/) provides
multiple methods to interact with the underlying file system in the host. This
abstraction layer sits on top of lower interfaces provided by the standard
Python library.

### Job schedulers

[`simplebuild.tools.job`](/api/simplebuild/tools/job/) contains the interfaces to
the different job schedulers supported in SimpleBuild.

### Containers

[`simplebuild.tools.containers`](/api/simplebuild/tools/containers/) contains the
interfaces to the different container systems supported in SimpleBuild.

### GitHub integration

[`simplebuild.tools.github`](/api/simplebuild/tools/github/) provides the interface
to remote repositories in GitHub. It allows to fetch simpleconfig files from PRs,
open new PRs, upload test reports and several other maintainer actions on PRs.

### Hooks

[`simplebuild.tools.hooks`](/api/simplebuild/tools/hooks/) contains the definition
of all accessible [hooks][hooks] in SimpleBuild. The actual call to the hooks
defined by the user are spread across the [steps of the installation
process][step_wise_install]. Hence, this module is only interesting if you
want to add or modify the available hooks.

## Contributing to Framework

### Reporting issues and bugs

Reporting issues and bugs to `simplebuild-framework` is no different than to any
other bug tracker. You should provide as many information as needed to allow
the developers to reproduce your issue/bug, including:

1. a description of what you are trying to do
1. a description of the steps to reproduce the problem
1. SimpleBuild configuration and host system information
1. custom simpleblock or simpleconfig files
1. full error messages and tracebacks

In the case of SimpleBuild, the main complication to report issues and bugs might
be to determine if the issue/bug at hand does actually originate in
simplebuild-framework or if instead it belongs in simplebuild-simpleblocks or
simplebuild-simpleconfigs. It is not uncommon that the traceback of bugs in
simpleblocks or simpleconfigs reach the codebase in `simplebuild.framework` or
`simplebuild.tools`.

Nevertheless, do not worry too much if you cannot determine which repository to
target with your issue/bug. In case of doubt, `simplebuild-framework` is the best
bet in general and maintainers can move issues between SimpleBuild repositories
if needed.

### Pull requests

Contributing bug fixes or new features to `simplebuild-framework` is **always
welcomed**. However, keep in mind that due to the broader scope of the source
code in framework, making contributions might be a bit more complicated than
for simpleblocks and simpleconfigs:

* SimpleBuild does not currently provide integration in the `eb` command to make
  contributions to the `simplebuild-framework` repository. Therefore, as
  contributor, you have to manually fork `simplebuild-framework` and open the pull
  request from your fork. The GitHub documentation contains a detailed
  description on how to
  [create PRs from forks](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork).

* We recommend to link all new PRs in `simplebuild-framework` to a corresponding
  issue in the issue tracker. Splitting the issue from the PR helps focus the
  activity in the PR to the changes in the source code and keep it separate
  from the discussion about the underlying problem.

* The source code of `simplebuild-framework` must be covered by the [unit
  tests][unit_tests] in `test.framework` and all tests must pass.
  You can [run the unit tests][unit_tests_running] in SimpleBuild on your
  computer to check their [results](unit_tests_results) before opening the PR
  to our repository. In general, this requirement on unit tests has the
  following implications depending on the type of changes introduced in your
  PR:

    * **Bug fix**: the presence of a bug means that either that part of the
      codebase is currently uncovered by the tests or that it is already
      covered but tests are also buggy.

    * **New feature**: new unit tests have to be added covering the new feature.

    Therefore, in (almost) all cases, new PRs to framework have to also include
    related changes in unit tests. The suite of unit tests in framework is
    already very extensive and you will find all tests organized per module in
    the `test/framework` directory.

    If you are not familiar with writing tests in Python, you can find all the
    details in the [`unittest` documentation](https://docs.python.org/3/library/unittest.html).
    We also recommend the guide [Getting Started With Testing in
    Python](https://realpython.com/python-testing/) as a more comprehensive
    alternative.


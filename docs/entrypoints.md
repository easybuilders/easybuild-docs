# Entrypoints {: #entrypoints }

[Entrypoints](https://packaging.python.org/en/latest/specifications/entry-points/) are a mechanism that can be used by python packages to expose functionalities. The most common use case is to expose a command line interface (CLI) to the user, but they can also be used to expose functions or classes that can be used by other python packages.

Easybuild makes use of entrypoints for extending the following:

- **hooks** (`easybuild.hooks`): Allow injecting multiple hooks for each [allowed step][available-hooks].
  Furthermore, the order of execution can be enforced by setting a priority for each hook (higher priority will execute first).
  When the same priority is set, the order of execution is determined by the hook name.
  The entrypoints hooks can be ran in conjunction with hooks detected using `--hooks` where the latter will always take precedence, regardless of the priority of the entrypoint hooks.
- **easyblocks** (`easybuild.easyblocks`): Allow extending the set of available easyblocks, which are used to build and install software.
- **toolchain** (`easybuild.toolchains`): Allow extending the set of available toolchains, which are used to build and install software.

The entrypoints needs to be decorated with the appropriate class in order for them to be recognized and used.

- **Hooks**: `EntrypointHook`
- **EasyBlocks**: `EntrypointEasyblock`
- **Toolchains**: `EntrypointToolchain`

## Validation {: #entrypoints_validation }

Entrypoints are validated the moment they are registered:

- **Hooks**: The entrypoint will check the the required combination of `step`, `pre_step` and `post_step` leads to a valid hook that will actually be ran.
- **EasyBlocks**: The entrypoint will check that the easyblock is a subclass of `easybuild.framework.easyblock.EasyBlock`.
  Furthermore, to avoid conflicts, an error will be raised if 2 separate modules attempts to register the same easyblock name. 
  For if an entrypoint easyblock has the same name as an existing easyblock, the entrypoint will take precedence over the existing easyblock.
- **Toolchains**: The entrypoint will check that the toolchain is a subclass of `easybuild.tools.toolchain.Toolchain`.
  Furthermore, to avoid conflicts, an error will be raised if 2 separate modules attempts to register the same toolchain name (tc.NAME). 
  The `prepend` argument used for the decorator class, will determine whether the entrypoint toolchain is prepended to the list of available toolchains or not.
  This allows to override an existing toolchain, or to only add a new one to the list of available toolchains.


## Examples {: #entrypoints_examples }

Defining entrypoints can be done both through the `setup.py` file of a python package, or through the `pyproject.toml` file.

In the case of the `pyproject.toml`, the entrypoints can be defined using the following syntax:

```toml
...

[project.entry-points."GROUP_NAME"]
"ENTRYPOINT_NAME1" = "import_path1:object1"
"ENTRYPOINT_NAME2" = "import_path2:object2"

...
```

Where `GROUP_NAME` is the name of the entrypoint group (e.g. `easybuild.hooks`, `easybuild.easyblocks`, `easybuild.toolchains`), `ENTRYPOINT_NAME` is the name of the entrypoint, and `import_path:object` is the import path and object name that are being registered.
EG: `myblock = "my_module.sub_module:MyBlock"` requires that `from my_module.sub_module import MyBlock` is possible.

For the following examples we are going to assume a package with the following folder structure:

```text
my_package/
├── my_module
│   ├── __init__.py
│   ├── easyblock.py
│   ├── hook.py
|   └── toolchain.py
└── pyproject.toml

```

### Hooks {: #entrypoints_examples_hooks }

`pyproject.toml` example:

```toml
...

[project.entry-points."easybuild.hooks"]
"my_hook" = "my_module.hook:my_hook_start_func"
"my_hook2" = "my_module.hook:my_hook_config_func"

...
```

And the `my_module/hook.py` file would look like this:

```python
from easybuild.tools.entrypoints import EntrypointHook
from easybuild.tools.hooks import CONFIGURE_STEP, START

@EntrypointHook(step=START, priority=10)
def my_hook_start_func(eb):
    # Do something at the start of the EasyBuild process

@EntrypointHook(step=CONFIGURE_STEP, pre_step=True, priority=10)
def my_hook_config_func(eb):
    # Do something at the configure step of the EasyBuild process
```

### EasyBlocks {: #entrypoints_examples_easyblocks }

`pyproject.toml` example:

```toml
...

[project.entry-points."easybuild.easyblocks"]
"my_easyblock" = "my_module.easyblock:MyEasyBlock"

...
```

And the `my_module/easyblock.py` file would look like this:

```python
from easybuild.framework.easyblock import EasyBlock
from easybuild.tools.entrypoints import EntrypointEasyblock

@EntrypointEasyblock()
class MyEasyBlock(EasyBlock):
    """My custom easyblock."""

    # Define the methods and properties of your easyblock here
```

The custom easyblock needs only to be a subclass of `easybuild.framework.easyblock.EasyBlock`, which means it does not need to inherit directly from `EasyBlock` but can also be used on top of other existing easyblocks (e.g. `PythonPackage`, `CMake`, etc.).

### Toolchain {: #entrypoints_examples_toolchain }

`pyproject.toml` example:

```toml
...

[project.entry-points."easybuild.toolchains"]
"my_toolchain" = "my_module.toolchain:MyToolchain"
...
```

And the `my_module/toolchain.py` file would look like this:

```python
from easybuild.tools.toolchain.toolchain import  import Toolchain
from easybuild.tools.entrypoints import EntrypointToolchain

@EntrypointToolchain(prepend=True)
class MyToolchain(Toolchain):
    """My custom toolchain."""

    # Define the methods and properties of your toolchain here
```

The custom toolchain needs only to be a subclass of `easybuild.tools.toolchain.Toolchain`, which means it does not need to inherit directly from `Toolchain` but can also be used on top of other existing toolchain objects (e.g. `GCC`, `OpenMPI`, etc.).


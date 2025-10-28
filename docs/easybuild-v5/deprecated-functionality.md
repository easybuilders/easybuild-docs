# Deprecated functionality in EasyBuild v5.0

*(for a full overview of changes in EasyBuild v5.0, see [here](index.md))*

Some functionality is being deprecated in EasyBuild v5.0, and will no longer be supported in EasyBuild v6.0:

- [`parallel` easyconfig parameter][parallel-easyconfig-parameter]
- [`run_cmd` and `run_cmd_qa` functions][run_cmd]
- [`'source'` step][source-step]
(renamed to `'extract'`)
   - Rename '`source`' step to '`extract`' (affects `skipsteps` easyconfig parameter + `--stop` option) <https://github.com/easybuilders/easybuild-framework/pull/4629>
- [`post_install_step` method in `EasyBlock` class][post_install_step]
- [`make_module_req_guess` method in `EasyBlock` class][make_module_req_guess]
- [`run`, `prerun`, `postrun`, `run_async` methods in `EasyBlock` class][run-methods-extensions]
- [`easybuild.tools.py2vs3` module][py2vs3]
- [Older checksum types][checksum-types]
- [`EnvironmentModulesC` or `EnvironmentModulesTcl` modules tools][modules-tools]
- [GC3Pie as job backend][gc3pie-job-backend]
- [Using `optarch` value without leading dash][optarch-dash]
- [`COMPILER*_FLAGS` attributes in `Compiler` class][compiler-constants]
- [Easyconfig parameter `modextrapaths_append`][deprec_modextrapaths_append]
- [Easyconfig parameter `allow_append_abs_path`][deprec_allow_append_abs]
- [Easyconfig parameter `allow_prepend_abs_path`][deprec_allow_prepend_abs]

If you trigger any deprecated functionality when using EasyBuild v5.0, a warning message will be printed.

---

## `parallel` easyconfig parameter {: #parallel-easyconfig-parameter }

Use of the `parallel` easyconfig parameter was deprecated because it's semantics are ambiguous, the `max_parallel` easyconfig parameter should be used instead.

---

## `run_cmd` and `run_cmd_qa` functions {: #run_cmd }

The `run_cmd` and `run_cmd_qa` functions have been deprecated,
and are scheduled to be removed in EasyBuild v6.0.

You should migrate to the new [`run_shell_cmd`](run_shell_cmd.md) function instead.

---

## `'source'` step {: #source-step }

`'source'` step was renamed to `'extract'`, affects `skipsteps` easyconfig parameter + `--stop` configuration option

---

## `post_install_step` method in `EasyBlock` class {: #post_install_step }

*(renamed to `post_processing_step`, more info soon)*

---

## `make_module_req_guess` method in `EasyBlock` class {: #make_module_req_guess }

*(replaced with `module_load_environment` class attribute, more info soon)*

---

## `run`, `prerun`, `postrun`, `run_async` methods in `EasyBlock` class {: #run-methods-extensions }

- `run` method has been replaced with `install_extension`
- `prerun` method has been replaced with `pre_install_extension`
- `postrun` method has been replaced with `post_install_extension`
- `run_async` has been replaced with `install_extension_async`

---

## `easybuild.tools.py2vs3` module {: #py2vs3 }

The following table lists the changes required to replace imports from the the `py2vs3` module.

| `from easybuild.tools.py2vs3 import ...` | Replacement |
|--|--|
| `ascii_letters` | `from string import ascii_letters` |
| `ascii_lowercase` | `from string import ascii_lowercase` |
| `build_opener` | `from urllib.request import build_opener` |
| `ConfigParser` | `from configparser import ConfigParser` |
| `configparser` | `import configparser` |
| `create_base_metaclass` | `from easybuild.base.wrapper import create_base_metaclass` |
| `extract_method_name` | No import required. Replace `extract_method_name(method)` with `'_'.join(method.__code__.co_names)` |
| `HTMLParser` | `from html.parser import HTMLParser` |
| `HTTPError` | `from urllib.request import HTTPError` |
| `HTTPSHandler` | `from urllib.request import HTTPSHandler` |
| `json_loads` | `from json import loads` and rename `json_loads` to `loads` |
| `Mapping` | `from collections.abc import Mapping` |
| `mk_wrapper_baseclass` | `from easybuild.base.wrapper import mk_wrapper_baseclass` |
| `OrderedDict` | `from collections import OrderedDict` |
| `raise_with_traceback` | No import required. Replace `raise_with_traceback(exception, message, tb)` with `raise exception(message).with_traceback(tb)` |
| `reload` | `from importlib import reload` |
| `Request` | `from urllib.request import Request` |
| `string_type` | No import required. Use `str` directly. |
| `StringIO` | `from io import StringIO` |
| `std_urllib` | `import urllib.request as std_urllib` |
| `subprocess_popen_text` | `from easybuild.tools.run import subprocess_popen_text` |
| `subprocess_terminate` | `from easybuild.tools.run import subprocess_terminate` |
| `urlencode` | `from urllib.parse import urlencode` |
| `URLError` | `from urllib.request import URLError` |
| `urlopen` | `from urllib.request import urlopen` |

---

## Older checksum types {: #checksum-types }

The following checksum types are deprecated and should no longer be used: `md5`, `adler32`, `crc32`, `sha1`, and `size`.

---

## `EnvironmentModulesC` or `EnvironmentModulesTcl` modules tools {: #modules-tools }

The use of the older [Environment Modules](https://modules.readthedocs.io/) versions is deprecated.
This corresponds to setting the module tool in EasyBuild to either `EnvironmentModulesC` or
`EnvironmentModulesTcl`.

Those using Environment Modules should use at least version 4.3 or newer.

---

## GC3Pie as job backend {: #gc3pie-job-backend }

The use of the GC3Pie job backend is deprecated. Those generating jobs from EasyBuild should use one
of the other available backends instead, such as Slurm or PBS Python.

---

## Using `optarch` value without leading dash {: #optarch-dash }

*(more info soon)*

---

## `COMPILER*_FLAGS` attributes in `Compiler` class {: #compiler-constants }

*(replaced by `Compiler.COMPILER*_OPTIONS`, more info soon)*

---

## Easyconfig parameter `modextrapaths_append` {: #deprec_modextrapaths_append }

The functionality of `modextrapaths_append` is now implemented in
`modextrapaths` through its `prepend` option:

```python
modextrapaths = {
    'ENV_VAR_NAME': {
        'paths': 'path/to/extra/subdir',
        'prepend': False,
    },
}
```

---

## Easyconfig parameter `allow_append_abs_path` {: #deprec_allow_append_abs }

The functionality of `allow_append_abs_path` is now implemented in
`modextrapaths`, which now accepts absolute paths by default and the position
of paths can be controlled through its `prepend` option:

```python
modextrapaths = {
    'ENV_VAR_NAME': {
        'paths': '/absolute/path/to/extra/subdir',
        'prepend': False,
    },
}
```

---

## Easyconfig parameter `allow_prepend_abs_path` {: #deprec_allow_prepend_abs }

The functionality of `allow_prepend_abs_path` is now implemented in
`modextrapaths`, which now accepts absolute paths by default:

```python
modextrapaths = {
    'ENV_VAR_NAME': '/absolute/path/to/extra/subdir',
}
```

# Deprecated functionality in EasyBuild v5.0

*(for a full overview of changes in EasyBuild v5.0, see [here](index.md))*

Some functionality is being deprecated in EasyBuild v5.0, and will no longer be supported in EasyBuild v6.0:

- [`run_cmd` and `run_cmd_qa` functions][run_cmd]
- [`easybuild.tools.py2vs3` module][py2vs3]

If you trigger any deprecated functionality when using EasyBuild v5.0, a warning message will be printed.

---

## `run_cmd` and `run_cmd_qa` functions {: #run_cmd }

The `run_cmd` and `run_cmd_qa` functions have been deprecated,
and are scheduled to be removed in EasyBuild v6.0.

You should migrate to the new [`run_shell_cmd`](run_shell_cmd.md) function instead.


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


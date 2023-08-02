# Overview of changes in SimpleBuild version 5.0 {: #overview }

!!! warning
    SimpleBuild 5.0 is currently still under development, via the `5.0.x` branches in the SimpleBuild GitHub repositories.

    We intend to update this page regularly as the [planned changes][eb5_plans] are being implemented and when there
    are [proposed changes][eb5_proposals] where we are requesting community feedback.

This page provides a concise overview of the most prominent changes in SimpleBuild version 5.0,
which can be categorized as:

* [Significant enhancements][significant_enhancements]
* [Backward-incompatible changes][backwards_incompatible]
* [Deprecated functionality][deprecated_v5]

For in-depth details on a particular change, see the pull requests that are linked from each of the subsections below.

---

## Planned and proposed changes for SimpleBuild v5.0 {: #eb5_changes }

At the [SimpleBuild User Meeting](https://simplebuild.io/eum23), Simon Branford set out the
[roadmap for SimpleBuild v5.0](https://simplebuild.io/eum23/#simplebuild5).

### Proposed changes for SimpleBuild v5.0 {: #eb5_proposals }

There are several proposed changes where the SimpleBuild maintainers are seeking community feedback. If you wish to provide
feedback then please comment in the GitHub issue for the proposal.

* [Minimum supported Lmod Version](https://github.com/simplebuilders/simplebuild/issues/871)
* [Toolchain Support Policy](https://github.com/simplebuilders/simplebuild/issues/872)

### Planned changes for SimpleBuild v5.0 {: #eb5_plans }

* [enable `--trace` by default](https://github.com/simplebuilders/simplebuild-framework/pull/4250)

!!! note
    This list is the major planned changes. It is not intended to be a complete list of all changes that are
    planned for SimpleBuild v5.0.

### Tracking development of SimpleBuild v5.0

* [GitHub Project board for SimpleBuild v5.0](https://github.com/orgs/simplebuilders/projects/18)

---

## Significant enhancements in SimpleBuild v5.0 {: #significant_enhancements }

Various significant enhancements are included in SimpleBuild v5.0, including:

* *(no significant enhancements implemented so far in the `5.0.x` branches)*

---

## Backwards-incompatible changes in SimpleBuild v4.0 {: #backwards_incompatible }

A number of *backwards-incompatible* changes are being made in SimpleBuild v5.0:

* [Support for Python 2.7 is removed -- Python 3.6+ is required][py36]
* [Deprecated SimpleBuild bootstrap script is removed][bootstrap_script]
* [Experimental support for the .yeb simpleconfig format is removed][yeb]

---

### Support for Python 2.7 is removed -- Python 3.6+ is required {: #py36 }

SimpleBuild 5.0 requires Python >= 3.6 to run.

Running SimpleBuild with Python 2.7 or a Python 3 version older than Python 3.6 is no longer supported.

Trying to run SimpleBuild with a Python version that is too old will result in an error:

```log
ERROR: No compatible 'python' command found via $PATH (SimpleBuild requires Python 3.6+)
```

Python 2.7 has been [end-of-life since 1 Jan 2020](https://www.python.org/doc/sunset-python-2),
and dropping compatibility with Python 2.7 and Python 3.5 enabled some significant code cleanup
(see [simplebuild-framework PR #4229](https://github.com/simplebuilders/simplebuild-framework/pull/4229)).

The [results of the 6th SimpleBuild User Survey (2022)](https://simplebuild.io/user_survey) show that the impact of
this breaking change on the SimpleBuild community should be very limited, since:

* Only ~13% of survey participants were still running SimpleBuild on top of Python 2.7;
* No survey participants reported using Python 3.5;
* Over 85% of survey participants reported using Python 3.6, or a more recent version of Python 3;
* Only 3 out of 118 survey participants (~2.5%) reported that dropping support for running SimpleBuild
  on top of Python 2 would be *problematic* for them;

Along with actively removing code that was only required to retain compatibility with Python 2.7 or 3.5,
the `simplebuild.tools.py2vs3` module that was introduced to facilitate supporting both Python 2.7 and Python 3
has been deprecated ([see also below][py2vs3]).

---

### Deprecated SimpleBuild bootstrap script is removed {: #bootstrap_script }

The SimpleBuild bootstrap script has been removed (see [simplebuild-framework PR #4233](https://github.com/simplebuilders/simplebuild-framework/pull/4233)).
Please see the [installation page][installation] for the suggested methods for installing SimpleBuild.

---

### Experimental support for the .yeb simpleconfig format is removed {: #yeb }

Support for the experimental `.yeb` simpleconfig format has been removed (see [simplebuild-framework PR #4237](https://github.com/simplebuilders/simplebuild-framework/pull/4237)).
This format allowed simpleconfigs to be specified in YAML. However, there has been no recent development of this
format and little suggestion that anyone was using it.

---

## Deprecated functionality in SimpleBuild v5.0 {: #deprecated_v5 }

Some functionality is being deprecated in SimpleBuild v5.0, and will no longer be supported in SimpleBuild v6.0:

* [`simplebuild.tools.py2vs3` module][py2vs3]

If you trigger any deprecated functionality, a warning message will be printed.

---

### `simplebuild.tools.py2vs3` module {: #py2vs3 }

[simplebuild-framework PR #4229](https://github.com/simplebuilders/simplebuild-framework/pull/4229)

The following table lists the changes required to replace imports from the the `py2vs3` module.

| `from simplebuild.tools.py2vs3 import ...` | Replacement |
|--|--|
| `ascii_letters` | `from string import ascii_letters` |
| `ascii_lowercase` | `from string import ascii_lowercase` |
| `build_opener` | `from urllib.request import build_opener` |
| `ConfigParser` | `from configparser import ConfigParser` |
| `configparser` | `import configparser` |
| `create_base_metaclass` | `from simplebuild.base.wrapper import create_base_metaclass` |
| `extract_method_name` | No import required. Replace `extract_method_name(method)` with `'_'.join(method.__code__.co_names)` |
| `HTMLParser` | `from html.parser import HTMLParser` |
| `HTTPError` | `from urllib.request import HTTPError` |
| `HTTPSHandler` | `from urllib.request import HTTPSHandler` |
| `json_loads` | `from json import loads` and rename `json_loads` to `loads` |
| `Mapping` | `from collections.abc import Mapping` |
| `mk_wrapper_baseclass` | `from simplebuild.base.wrapper import mk_wrapper_baseclass` |
| `OrderedDict` | `from collections import OrderedDict` |
| `raise_with_traceback` | No import required. Replace `raise_with_traceback(exception, message, tb)` with `raise exception(message).with_traceback(tb)` |
| `reload` | `from importlib import reload` |
| `Request` | `from urllib.request import Request` |
| `string_type` | No import required. Use `str` directly. |
| `StringIO` | `from io import StringIO` |
| `std_urllib` | `import urllib.request as std_urllib` |
| `subprocess_popen_text` | `from simplebuild.tools.run import subprocess_popen_text` |
| `subprocess_terminate` | `from simplebuild.tools.run import subprocess_terminate` |
| `urlencode` | `from urllib.parse import urlencode` |
| `URLError` | `from urllib.request import URLError` |
| `urlopen` | `from urllib.request import urlopen` |


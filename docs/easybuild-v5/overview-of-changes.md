# Overview of changes in EasyBuild version 5.0 {: #overview }

This page provides a concise overview of the most prominent changes in EasyBuild version 5.0,
which can be categorized as:

* [Significant enhancements][significant_enhancements]
* [Backward-incompatible changes][backwards_incompatible]
* [Deprecated functionality][deprecated]

For in-depth details on a particular change, see the pull requests that are linked from each of the subsections below.

!!! warning

    EasyBuild 5.0 is currently still under development, via the `5.0.x` branches in the EasyBuild GitHub repositories.

    We intend to update this page regularly as the planned changes are being implemented.


---

## Significant enhancements in EasyBuild v5.0 {: #significant_enhancements }

Various significant enhancements are included in EasyBuild v5.0, including:

* *(no significant enhancements implemented so far in the `5.0.x` branches)*

---

## Backwards-incompatible changes in EasyBuild v4.0 {: #backwards_incompatible }

A number of *backwards-incompatible* changes are being made in EasyBuild v5.0:

* [Support for Python 2.7 is removed -- Python 3.6+ is required][py36]
* [Deprecated EasyBuild bootstrap script is removed][bootstrap_script]
* [Experimental support for the .yeb easyconfig format is removed][yeb]

---

### Support for Python 2.7 is removed -- Python 3.6+ is required {: #py36 }

EasyBuild 5.0 requires Python >= 3.6 to run.

Running EasyBuild with Python 2.7 or a Python 3 version older than Python 3.6 is no longer supported.

Trying to run EasyBuild with a Python version that is too old will result in an error:
```
ERROR: No compatible 'python' command found via $PATH (EasyBuild requires Python 3.6+)
```

Python 2.7 has been [end-of-life since 1 Jan 2020](https://www.python.org/doc/sunset-python-2),
and dropping compatibility with Python 2.7 and Python 3.5 enabled some significant code cleanup
(see [easybuild-framework PR #4229](https://github.com/easybuilders/easybuild-framework/pull/4229)).

The [results of the 6th EasyBuild User Survey (2022)](https://easybuild.io/user_survey) show that the impact of
this breaking change on the EasyBuild community should be very limited, since:

* Only ~13% of survey participants were still running EasyBuild on top of Python 2.7;
* No survey participants reported using Python 3.5;
* Over 85% of survey participants reported using Python 3.6, or a more recent version of Python 3;
* Only 3 out of 118 survey participants (~2.5%) reported that dropping support for running EasyBuild
  on top of Python 2 would be *problematic* for them;

Along with actively removing code that was only required to retain compatibility with Python 2.7 or 3.5,
the `easybuild.tools.py2vs3` module that was introduced to facilitate supporting both Python 2.7 and Python 3
has been deprecated ([see also below][py2vs3]).

---

### Deprecated EasyBuild bootstrap script is removed {: #bootstrap_script }

[easybuild-framework PR #4233](https://github.com/easybuilders/easybuild-framework/pull/4233)

---

### Experimental support for the .yeb easyconfig format is removed {: #yeb }

[easybuild-framework PR #4237](https://github.com/easybuilders/easybuild-framework/pull/4237)

---

## Deprecated functionality in EasyBuild v5.0 {: #deprecated }

Some functionality is being deprecated in EasyBuild v5.0, and will no longer be supported in EasyBuild v6.0:

* [`easybuild.tools.py2vs3` module][py2vs3]

If you trigger any deprecated functionality, a warning message will be printed.

---

### `easybuild.tools.py2vs3` module {: #py2vs3 }

[easybuild-framework PR #4229](https://github.com/easybuilders/easybuild-framework/pull/4229)

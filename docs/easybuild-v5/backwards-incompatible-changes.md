# Backwards-incompatible changes in EasyBuild v5.0

*(for a full overview of changes in EasyBuild v5.0, see [here](overview-of-changes.md))*

A number of *backwards-incompatible* changes are being made in EasyBuild v5.0:

* [Support for Python 2.7 is removed, Python 3.6+ is required][py36]
* [Deprecated EasyBuild bootstrap script is removed][bootstrap_script]
* [Experimental support for the `.yeb` easyconfig format is removed][yeb]

---

## Support for Python 2.7 is removed, Python 3.6+ is required {: #py36 }

EasyBuild 5.0 requires Python >= 3.6 to run.

Running EasyBuild with Python 2.7 or a Python 3 version older than Python 3.6 is no longer supported.

Trying to run EasyBuild with a Python version that is too old will result in an error:

```log
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
has been deprecated (see also [here](deprecated-functionality.md#py2vs3)).

---

## Deprecated EasyBuild bootstrap script is removed {: #bootstrap_script }

The EasyBuild bootstrap script has been removed (see [easybuild-framework PR #4233](https://github.com/easybuilders/easybuild-framework/pull/4233)).

Please see the [installation page](../installation.md) for the suggested methods for installing EasyBuild.

---

## Experimental support for the .yeb easyconfig format is removed {: #yeb }

Support for the experimental `.yeb` easyconfig format has been removed (see [easybuild-framework PR #4237](https://github.com/easybuilders/easybuild-framework/pull/4237)).

This format allowed easyconfigs to be specified in YAML. However, there has been no recent development of this
format and little suggestion that anyone was using it at all.

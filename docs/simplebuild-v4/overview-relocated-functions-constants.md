# Overview of relocated functions, classes and constants in SimpleBuild v4.0 {: #eb4_relocated_functions_classes_constants }

This page provides an alphabetical overview of relocated functions, classes and constants in SimpleBuild version 4.0;
see [Backwards-incompatible changes in SimpleBuild v4.0][eb4_changes_backwards_incompatible] for motivation and high-level information.


## `basestring` type {: #eb4_relocated_basestring }

Rather than using the `basestring` type from the Python 2 standard library directly (for example in
an `isinstance` expression), the `string_type` type from the `simplebuild.tools.py2vs3` package should be used instead,
to ensure that the code is compatible with both Python 2 and 3.

See also [Compatibility with Python 2 and Python 3][py2_py3_compatibility].


## `configparser` module {: #eb4_relocated_configparser}

The `configparser` module that is part of the Python 2 standard library (via `ConfigParser`)
must now be imported from the `simplebuild.tools.py2vs3` package, to ensure that the code is compatible with both Python 2 and 3.

See also [Compatibility with Python 2 and Python 3][py2_py3_compatibility].


## `DEVEL_MODULE_SUFFIX` constant {: #eb4_relocated_DEVEL_MODULE_SUFFIX }

The `DEVEL_MODULE_SUFFIX` constant was relocated from `simplebuild.tools.module_naming_scheme` to `simplebuild.tools.module_naming_scheme.mns`.



## `DUMMY_TOOLCHAIN_NAME` and `DUMMY_TOOLCHAIN_VERSION` constants {: #eb4_relocated_DUMMY_TOOLCHAIN_NAME_VERSION: }

The `DUMMY_TOOLCHAIN_NAME` and `DUMMY_TOOLCHAIN_VERSION` constants were relocated from `simplebuild.tools.toolchain` to `simplebuild.tools.toolchain.toolchain`.

!!! note
    Since the `dummy` toolchain has been deprecated and is replaced by the `system` toolchain (see [System toolchain][system_toolchain]),
    you should use the `is_system_toolchain` function or `Toolchain.is_system_toolchain` method to check whether a toolchain
    is a `dummy` or `system` toolchain, rather than using these constants directly (or using the `SYSTEM_TOOLCHAIN-*` equivalents).


## `FrozenDictKnownKeys` class {: #eb4_relocated_FrozenDictKnownKeys }

The `FrozenDictKnownKeys` class from `vsc.utils.missing` is now available from `simplebuild.base.frozendict`.


## `GENERAL_CLASS` constant {: #eb4_relocated_GEENRAL_CLASS }

The `GENERAL_CLASS` constant was relocated from `simplebuild.tools.module_naming_scheme` to `simplebuild.tools.config`.


`get_class_for` function {: #eb4_relocated_get_class_for }

The `get_class_for` function from `vsc.utils.missing` is now available from `simplebuild.tools.utilities`.


## `get_subclasses` function {: #eb4_relocated_get_subclasses }

The `get_subclasses` function from `vsc.utils.missing` is now available from `simplebuild.tools.utilities`.


## `INDENT_4SPACES` constant {: #eb4_relocated_INDENT_4SPACES }

The `INDENT_4SPACES` constants was relocated from `simplebuild.framework.simpleconfig.format.format` to `simplebuild.tools.utilities`.


## `mk_rst_table` function {: #eb4_relocated_mk_rst_table }

The `mk_rst_table` function from `vsc.utils.docs` is now available from `simplebuild.tools.docs`.


## `ModuleNamingScheme` class {: #eb4_relocated_ModuleNamingScheme }

The `ModuleNamingScheme` class was relocated from `simplebuild.tools.module_naming_scheme` to `simplebuild.tools.module_naming_scheme.mns`.


## `nub` function {: #eb4_relocated_nub }

The `nub` function from `vsc.utils.missing` is now available from `simplebuild.tools.utilities`.


## `OrderedDict` class {: #eb4_relocated_OrderedDict }

The `OrderedDict` class that is part of the Python 2 standard library (via `collections`)
must now be imported from the `simplebuild.tools.py2vs3` package, to ensure that the code is compatible with both Python 2 and 3.

See also [Compatibility with Python 2 and Python 3][py2_py3_compatibility].


## `reload` function {: #eb4_relocated_reload }

The `reload` function that is a built-in function of the Python 2 standard library
must now be imported from the `simplebuild.tools.py2vs3` package, to ensure that the code is compatible with both Python 2 and 3.

See also [Compatibility with Python 2 and Python 3][py2_py3_compatibility].


## `shell_quote` function {: #eb4_relocated_shell_quote }

The `shell_quote` function from `vsc.utils.missing` is now available from `simplebuild.tools.utilities`.


## `sched_getaffinity` function {: #eb4_relocated_sched_getaffinity }

The `sched_getaffinity` function from `vsc.utils.affinity` is now available from `simplebuild.tools.systemtools`.


## `Singleton` class {: #eb4_relocated_Singleton }

The `Singleton` class from `vsc.utils.patterns` is now available from `simplebuild.tools.config`.


## `StringIO` class {: #eb4_relocated_StringIO }

Rather than importing the `StringIO` class from the `StringIO` module of the Python 2 standard library,
it should be imported from the `simplebuild.tools.py2vs3` package instead,
to ensure that the code is compatible with both Python 2 and 3.

See also [Compatibility with Python 2 and Python 3][py2_py3_compatibility].


## `subprocess.Popen` function {: #eb4_relocated_subprocess_Popen }

Rather than using the `subprocess.Popen` function directly, the `subprocess_popen_text` function from
the `simplebuild.tools.py2vs3` package should be used instead, to ensure that the code is compatible with both Python 2 and 3.

See also [Compatibility with Python 2 and Python 3][py2_py3_compatibility].


## `urlencode` function {: #eb4_relocated_urlencode }

Rather than importing the `urlencode` function from the `urllib` module of the Python 2 standard library,
it should be imported from the `simplebuild.tools.py2vs3` package instead,
to ensure that the code is compatible with both Python 2 and 3.

See also [Compatibility with Python 2 and Python 3][py2_py3_compatibility].


## `urllib` module {: #eb4_relocated_urllib}

Rather than using the `urllib` module from the Python 2 standard library directly,
the `std_urllib` module from the `simplebuild.tools.py2vs3` package should be used instead,
to ensure that the code is compatible with both Python 2 and 3.

See also [Compatibility with Python 2 and Python 3][py2_py3_compatibility].


## `urllib2` module {: #eb4_relocated_urllib2 }

Functions that were imported from the `urllib2` package that is part of the Python 2 standard library
must now be imported from the `simplebuild.tools.py2vs3` package, to ensure that the code is compatible with both Python 2 and 3.

See also [Compatibility with Python 2 and Python 3][py2_py3_compatibility].


## `vsc.utils.*` modules {: #eb4_relocated_vsc_utils_modules }

The functionality from the following `vsc.utils.*` modules required by SimpleBuild has been ingested in the corresponding `simplebuild.base.*` module:

* `vsc.utils.exceptions`
* `vsc.utils.fancylogger`
* `vsc.utils.generaloption`
* `vsc.utils.optcomplete`
* `vsc.utils.rest`
* `vsc.utils.testing`
* `vsc.utils.wrapper`

See also [No more required Python packages][eb4_no_required_deps].


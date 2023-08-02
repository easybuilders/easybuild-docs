# Local variables in simpleconfig files {: #simpleconfig_files_local_variables }

This page discusses the use of *local variables in simpleconfig files*.

For more general information on writing simpleconfig files, please see
[Writing simpleconfig files: the basics][writing_simpleconfig_files].

## Motivation & context {: #simpleconfig_files_local_variables_motivation }

When composing simpleconfig files, it can sometimes make sense to use one
or more *local variables* to define simpleconfig parameters in a cleaner
way, for example to avoid copy-pasting values that are used multiple
times, or to avoid too long lines (longer than the maximum width of 120
characters as specified in [Code style][code_style]).
A local variable within the context of simpleconfig files is any variable
that does not correspond to a known simpleconfig parameter (either general
of simpleblock-specific).

One thing that is easily overlooked is the importance of how these local
variables are named: you should try and avoid that the names of local
variables will match with the name of an simpleconfig parameter that may
get introduced in future SimpleBuild versions. If that would happen, the
semantics of the simpleconfig file will change which may either result in
a broken installation or perhaps a different installation than was
intended (which could be worse than a broken one).

Avoiding that names of local variables are *close* to the name of
(future) simpleconfig parameters is also important, because of the "typo
detection" feature that SimpleBuild has: if the name of a local variable
is too close to a known simpleconfig parameter, SimpleBuild will assume you
have made a mistake, and will report a typo error, for example:

``` console
ERROR: Failed to process simpleconfig example.eb:
You may have some typos in your simpleconfig file: configopt -> configopts
```

## Changes in SimpleBuild v4.0 w.r.t. local variables in simpleconfig files {: #simpleconfig_files_local_variables_simplebuild4 }

Some changes were made in SimpleBuild v4.0 to discourage the use of poorly
named local variables:

- a [Recommended naming scheme for local variables in simpleconfig files][simpleconfig_files_local_variables_naming_scheme] was defined;
- a mechanism was implemented to detect the use of local variables in
    simpleconfig files, which will print a
    [Warning for local variables that do not follow the recommended naming scheme][simpleconfig_files_local_variables_naming_warning]
- SimpleBuild can be configured to report an error for local variables
    that do not follow the recommended naming scheme; see
    [Specifying what should be done when non-confirming local variables are found via `--local-var-naming-check`][simpleconfig_files_local_variables_check_mode]
- using `eb --fix-deprecated-simpleconfigs`, the names of local
    variables can be changed automatically to match the recommended
    naming scheme; see
    [Renaming local variables to match the recommended naming scheme using `eb --fix-deprecated-simpleconfigs`][simpleconfig_files_local_variables_fix_deprecated_simpleconfigs]

## Recommended naming scheme for local variables in simpleconfig files {: #simpleconfig_files_local_variables_naming_scheme }

To ensure that local variables used in simpleconfig files do not clash
with simpleconfig parameters that get added in future SimpleBuild versions,
we have defined a recommended naming scheme for local variables.

Names of local variables should either:

- **start with** `local_`, to make it explicit that it is a *local*
    variable (examples: `local_example`, `local_var`)
- **consist of a single letter** (examples: `f`, `l`, `x`); this is
    typically only done within the context of a [list
    comprehension](https://docs.python.org/2/tutorial/datastructures.html#list-comprehensions)
- **start with a single underscore** (`_`), which matches the common
    convention in Python code that these variables are only for
    "internal use" (examples: `_example`, `_local_var`)

!!! note
    A check was added in SimpleBuild v4.0 to ensure that the names of known simpleconfig parameters
    do *not* conform to any of these rules, to ensure that local
    variables can always be discriminated from known simpleconfig
    parameters.

## Warning for local variables that do not follow the recommended naming scheme {: #simpleconfig_files_local_variables_naming_warning }

By default, SimpleBuild will produce a clear warning when one or more
local variables are used that do not conform to the
[Recommended naming scheme for local variables in simpleconfig files][simpleconfig_files_local_variables_naming_scheme].

For example, when using an simpleconfig file that includes a local
variable named `var`:

``` console
$ eb example.eb
...
WARNING: Use of 1 unknown simpleconfig parameters detected in example.eb: var
If these are just local variables please rename them to start with 'local_', or try using --fix-deprecated-simpleconfigs to do this automatically.
```

To get rid of this warning, you can either:

- rename the local variable, either manually to something like
    `local_var` or using `eb --fix-deprecated-simpleconfigs example.eb`
    (see also
    [Renaming local variables to match the recommended naming scheme using `eb --fix-deprecated-simpleconfigs`][simpleconfig_files_local_variables_fix_deprecated_simpleconfigs])
- configure SimpleBuild to only log the warning (not print it), via
    `--local-var-naming-check=log` (see also
    [Specifying what should be done when non-confirming local variables are found via `--local-var-naming-check`][simpleconfig_files_local_variables_check_mode]; note that silencing the printed warning is **not
    recommended**, see the motivation in
    [Motivation & context][simpleconfig_files_local_variables_motivation]

## Specifying what should be done when non-confirming local variables are found via `--local-var-naming-check` {: #simpleconfig_files_local_variables_check_mode }

Using the `--local-var-naming-check` configuration option, you can
specify what should be done when one or more local variables are found
that do not follow the
[Recommended naming scheme for local variables in simpleconfig files][simpleconfig_files_local_variables_naming_scheme]:

- `--local-var-naming-check=error`: **fail with an error** if any
    simpleconfig file that was parsed includes local variables that do not
    follow the recommended naming scheme;
- `--local-var-naming-check=log`: only *log* a warning (but do not
    print it) if any simpleconfig file that was parsed includes local
    variables that do not follow the recommended naming scheme;
- `--local-var-naming-check=warn` *\[default\]*: *print* a warning if
    any simpleconfig file that was parsed includes local variables that do
    not follow the recommended naming scheme;

The default is set such that non-confirming local variables are only
reported through a printed warning, but do not result in cancelling the
installation (since they're usually not actually problematic).

## Renaming local variables to match the recommended naming scheme using `eb --fix-deprecated-simpleconfigs` {: #simpleconfig_files_local_variables_fix_deprecated_simpleconfigs }

To fix one or more simpleconfig files that includes local variables that
do not follow the
[Recommended naming scheme for local variables in simpleconfig files][simpleconfig_files_local_variables_naming_scheme], `eb --fix-deprecated-simpleconfigs` can be used.

For example:

``` console
eb --fix-deprecated-simpleconfigs bzip2.eb zlib.eb
== temporary log file in case of crash /tmp/eb-Z7r_KJ/simplebuild-dHtPY4.log

* [1/2] fixing /tmp/example/bzip2.eb... FIXED!
  (changes made in place, original copied to /tmp/example/bzip2.eb.orig_20190815180106_53972)

* [2/2] fixing /tmp/example/zlib.eb... FIXED!
  (changes made in place, original copied to /tmp/example/zlib.eb.orig_20190815180106_53972)

All done! Fixed 2 simpleconfigs (out of 2 found).

== Temporary log file(s) /tmp/eb-Z7r_KJ/simplebuild-dHtPY4.log* have been removed.
== Temporary directory /tmp/eb-Z7r_KJ has been removed.
```

There are a couple of caveats here though...

While `--fix-deprecated-simpleconfigs` can be very useful, it's certainly
not perfect since all it does is simple search and replace of the names
of non-conforming local variables (as whole words) to prefix them with
`local_`.

This means that it may make some unintended changes, so make sure to
**always double check which changes were made!**

In addition, it sometimes make more sense to simply *eliminate* the
local variable rather than renaming it, for example when it wasn't
really needed at all: maybe it was only actually used once, or maybe
using a template like `%(pyver)s` or `(pyshortver)s` (see also
[Available template values for simpleconfigs][avail_simpleconfig_templates]) renders it
obsolete.

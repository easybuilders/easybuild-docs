# Hooks

Since v3.5.0, SimpleBuild supports *hooks* that can be used
to customise the behaviour of SimpleBuild according to site policies if needed,
without having to change the SimpleBuild framework or the existing simpleblocks.

## What are hooks?

*Hooks* are user-defined functions that are called by the SimpleBuild framework at specific times during
the installation procedure. They can be leveraged to alter or augment the installation procedure.

This is usually done to conform with site-specific policies that are difficult to enforce otherwise,
but it can also be (ab)used to fix specific problems or inject self-implemented enhancements
(before you flesh them out in a proper contribution, for example).

Both the `SimpleBlock` instance and the parsed simpleconfig file that are being used
are fully accessible (and modifiable) from within hook implementations. Hence, this mechanism
provides a lot of flexibility to change the SimpleBuild functionality should you require it,
without having to modify the codebase of SimpleBuild itself.

## Configuring SimpleBuild to use your hook implementations

To instruct SimpleBuild to use your hook implementations,
you only need to specify the location of the Python module (`*.py`) that implements them.

This is done via the `--hooks` configuration option
(or equivalently via the `$SIMPLEBUILD_HOOKS` environment variable, or via `hooks = ...`
in an SimpleBuild configuration file, see also [Configuring SimpleBuild][configuring_simplebuild]).

For example:

```shell
eb --hooks=$HOME/my_eb_hooks.py ...
```

or:

```shell
export SIMPLEBUILD_HOOKS=$HOME/my_eb_hooks.py
eb ...
```


## Available hooks

Currently (since SimpleBuild v3.7.0), three types of hooks are supported:

* `start_hook` and `end_hook`, which are triggered *once* before starting software installations,
  and *once* right after completing all installations, respectively
* `parse_hook`, which is triggered when an simpleconfig file is being parsed
* `module_write_hook`, which is triggered right before a module file is written.
  This includes the temporary module file used when installing extensions and during the sanity check,
  as well as the devel module.
* "*step*" hooks that are triggered before and after every step of each installation procedure that is performed,
  also aptly named '`pre`'- and '`post`'-hooks

The list of currently available hooks in order of execution,
which can also be consulted using `eb --avail-hooks`, is:

* `start_hook` *(only called once in an SimpleBuild session)*
* `parse_hook` *(available since SimpleBuild v3.7.0)*
* `pre_fetch_hook`, `post_fetch_hook`
* `pre_ready_hook`, `post_ready_hook`
* `pre_source_hook`, `post_source_hook`
* `pre_patch_hook`, `post_patch_hook`
* `pre_prepare_hook`, `post_prepare_hook`
* `pre_configure_hook`, `post_configure_hook`
* `pre_build_hook`, `post_build_hook`
* `pre_test_hook`, `post_test_hook`
* `pre_install_hook`, `post_install_hook`
* `pre_extensions_hook`, `post_extensions_hook`
* `pre_postproc_hook`, `post_postproc_hook`
* `pre_sanitycheck_hook`, `post_sanitycheck_hook`
* `pre_cleanup_hook`, `post_cleanup_hook`
* `pre_module_hook`, `post_module_hook`
* `pre_permissions_hook`, `post_permissions_hook`
* `pre_package_hook`, `post_package_hook`
* `pre_testcases_hook`, `post_testcases_hook`
* `end_hook` *(only called once in an SimpleBuild session)*
* `module_write_hook` *(called multiple times per installation, available since SimpleBuild v4.4.1)*

All functions implemented in the provided Python module for which the name ends with `_hook` are considered.

If any `*_hook` functions are encountered that do not match any of the available hooks, an error is reported.
SimpleBuild will try to provide suggestions for available hooks that closely match the encountered unknown hook.

For example:

```console
$ eb --hooks wrong_hooks.py example.eb
== temporary log file in case of crash /tmp/eb-nMawy1/simplebuild-Gu2ZP6.log
ERROR: Found one or more unknown hooks:
* stat_hook (did you mean 'start_hook'?)
* this_is_not_a_hook
* install_hook (did you mean 'pre_install_hook', or 'post_install_hook'?)

Run 'eb --avail-hooks' to get an overview of known hooks
```

## Implementing hooks

To implement hooks, simply define one or more functions in a Python module (`*.py`),
each named after an available hook.

Do take into account the following:

* for `start_hook` and `end_hook`, no arguments are provided
* for `parse_hook`, one argument is provided: the `SimpleConfig` instance
  that corresponds to the simpleconfig file being parsed (usually referred to as `ec`)
* for `module_write_hook`, 3 arguments are provided:
   * the `SimpleBlock` instance used to perform the installation (usually referred to as `self`)
   * the filepath of the module that will be written
   * the module text as a string
  The return value of this hook, when set, will replace the original text that is then written to the module file.
* for the step hooks, one argument is provided:
  the `SimpleBlock` instance used to perform the installation (usually referred to as `self`)
* the parsed simpleconfig file can be accessed in the step hooks via the `SimpleBlock` instance,
  i.e., via `self.cfg`

It is recommended to anticipate possible changes in the provided (named) arguments,
using the `*args` and `**kwargs` mechanism commonly used in Python. This
avoids that your hook implementations may break when updating to future SimpleBuild versions. For example:

```py
# example pre-configure hook that anticipates changes in provided arguments
def pre_configure_hook(self, *args, **kwargs):
    ...
```

In hooks you have access to the full functionality provided by the SimpleBuild framework,
so do `import` from `simplebuild.tools.*` (or other `simplebuild.*` namespaces) to leverage
those functions.

### Parse hook specifics

`parse_hook` is triggered right *after* reading the simpleconfig file,
before further parsing of some simpleconfig parameters (like `*dependencies`) into
custom data structures is done.

This is important since it allows to dynamically modify simpleconfig files
while they are still "raw", i.e. when the simpleconfig parameter values are
still basic Python data structures like lists, dictionaries, etc.
that are simple to manipulate (see also [Manipulating simpleconfig parameters](#manipulating-simpleconfig-parameters)).

In `parse_hook` simpleconfig parameters can be accessed and/or modified in a straightforward way,
see [Example hook to inject a custom patch file](#inject-a-custom-patch-file).


## Caveats

Due to internal details of the SimpleBuild framework, you may run into some surprises when
implementing hooks.
Here are some things to take into account:


### Resolving of template values

In all *step* hooks, template values in simpleconfig parameters will be resolved whenever they are accessed.

That is, if the `%(version)` template is used in for example the `sources` simpleconfig parameter,
it will be replaced with the actual value of the `version` simpleconfig parameter whenever the
`sources` value is used.
This can be avoided by temporarily disabling templating by wrapping the code in `with self.cfg.disable_templating:`.

There is one notable exception to this:
Templates in simpleconfig parameters are *not* resolved in `parse_hook`,
because templating has been disabled explicitly before `parse_hook` is called;
this helps significantly to simplify manipulating of simpleconfig parameter values
(see also [Manipulating simpleconfig parameters](#manipulating-simpleconfig-parameters)).


### Manipulating simpleconfig parameters

You may run into surprises when trying to manipulate simpleconfig parameters, for various reasons.

First of all, the original simpleconfig parameters may already be processed in another data structure
which does not resemble the original format in which the parameter was defined in the simpleconfig file.

Moreover, this processing could be done either "in place" by replacing the original simpleconfig parameter value,
or in a separate variable, which effectively means that any changes to the original simpleconfig parameter value
are simply ignored.

In addition, because of how the templating mechanism for simpleconfig parameter works,
changes to simpleconfig parameters with non-string values (i.e. lists, dictionaries, etc.) will go up
in smoke if not done correctly.

More specifically, the following approach will *not* work in any of the (step) hooks, except for `parse_hook`:

```py
def pre_fetch_hook(self):
     "Example of pre-fetch hook to manipulate list of patches."
     # this does NOT have the intended affect in any pre- or post-step hook
     self.cfg['patches'].append('example.patch')
```

The problem here is that the value obtained via `self.cfg['patches']` is not a reference
to the actual simpleconfig parameter value but a reference to a temporary copy thereof;
hence any updates on the copy are effectively lost immediately.

To achieve the intended effect, you can either:

* temporarily disable the templating mechanism:

    ```py
    def pre_fetch_hook(self):
        "Example of pre-fetch hook to manipulate list of patches."
        # temporarily disable templating, so changes to 'patches' simpleconfig parameter are picked up
        with self.cfg.disable_templating:
            # add patch
            self.cfg['patches'].append('example.patch')
        # templating state restored
    ```

* or replace the original value entirely:

    ```py
    def pre_fetch_hook(self):
        "Example of pre-fetch hook to manipulate list of patches."
        self.cfg['patches'] = self.cfg['patches'] + ['example.patch']
    ```

A better approach for manipulating simpleconfig parameters is to use the `parse_hook` that
was introduced in SimpleBuild v3.7.0 (see [Parse hook specifics](#parse-hook-specifics)),
where these kind of surprises will not occur (because templating is automatically disabled
before `parse_hook` is called and restored immediately afterwards).
See also [Example hook to inject a custom patch file](#inject-a-custom-patch-file).

### Archived simpleconfig file vs hooks

SimpleBuild archives the simpleconfig file that was used for a particular installation:
A copy is stored both in the `simplebuild` subdirectory of the software installation
directory and in the simpleconfigs repository (see [Simpleconfigs repository][simpleconfigs_repo]).

If any changes were made to the simpleconfig file via hooks, these changes will *not* be
reflected in these copies.
The assumption here is that the hooks will also be in place for future (re-)installations.

SimpleBuild does however store an additional copy of the simpleconfig file which includes
any modifications that were done dynamically, for example by hooks.
If subtoolchains were used to resolve dependencies, they will also be hardwired in this copy.

This "*reproducible simpleconfig*" is stored in the `simplebuild/reprod` subdirectory
of the software installation directory.


## Examples of hook implementations

### Replace `--with-verbs` with `--without-verbs` in OpenMPI configure options

```py
def pre_configure_hook(self, *args, **kwargs):
    """Example pre-configure hook to replace --with-verbs with --without -verbs for OpenMPI."""
    if self.name == 'OpenMPI' and '--with-verbs' in self.cfg['configopts']:
        self.log.info("[pre-configure hook] Replacing --with-verbs with --without-verbs")
        self.cfg['configopts'] = self.cfg['configopts'].replace('--with-verbs', '--without-verbs')
```

### Inject a custom patch file

```py
def parse_hook(ec, *args, **kwargs):
    """Example parse hook to inject a patch file for a fictive software package named 'Example'."""
    if ec.name == 'Example':
        patch_file = 'example.patch'
        ec.log.info("[parse hook] Injecting additional patch file '%s'", patch_file)
        ec['patches'].append(patch_file)
```

### Replace `PYTHONPATH` by `EBPYTHONPREFIXES` in (Lua) modules

```py
def module_write_hook(self, filepath, module_txt, *args, **kwargs):
    # note: if `self.mod_filepath == filepath` => final module file
    if 'Python' in (dep['name'] for dep in self.cfg.dependencies()):
        search = r'prepend_path\("PYTHONPATH", pathJoin\(root, "lib/python\d.\d/site-packages"\)\)'
        replace = 'prepend_path("EBPYTHONPREFIXES", root)'
        return re.sub(search, replace, module_txt)
```

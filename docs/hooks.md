# Hooks

Since v3.5.0, EasyBuild supports *hooks* that can be used
to customise the behaviour of EasyBuild according to site policies if needed,
without having to change the EasyBuild framework or the existing easyblocks.

## What are hooks?

*Hooks* are user-defined functions that are called by the EasyBuild framework at specific times during
the installation procedure. They can be leveraged to alter or augment the installation procedure.

This is usually done to conform with site-specific policies that are difficult to enforce otherwise,
but it can also be (ab)used to fix specific problems or inject self-implemented enhancements
(before you flesh them out in a proper contribution, for example).

Both the `EasyBlock` instance and the parsed easyconfig file that are being used
are fully accessible (and modifiable) from within hook implementations. Hence, this mechanism
provides a lot of flexibility to change the EasyBuild functionality should you require it,
without having to modify the codebase of EasyBuild itself.

## Configuring EasyBuild to use your hook implementations

To instruct EasyBuild to use your hook implementations,
you only need to specify the location of the Python module (`*.py`) that implements them.

This is done via the `--hooks` configuration option
(or equivalently via the `$EASYBUILD_HOOKS` environment variable, or via `hooks = ...`
in an EasyBuild configuration file, see also [Configuring EasyBuild][configuring_easybuild]).

For example:

```shell
eb --hooks=$HOME/my_eb_hooks.py ...
```

or:

```shell
export EASYBUILD_HOOKS=$HOME/my_eb_hooks.py
eb ...
```


## Available hooks

Since EasyBuild v5.1.1, seven different types of hooks are supported:

* `start_hook`, `pre_build_and_install_loop_hook`, `post_build_and_install_loop_hook`, and `end_hook` which are triggered *once* right after
  EasyBuild starts, *once* before looping over the easyconfigs to be built, *once* after completing the loop over the eayconfigs to be installed,
  and *once* shortly before EasyBuild completes, respectively.
* `parse_hook`, which is triggered when an easyconfig file is being parsed
* `pre_easyblock_hook` and `post_easyblock_hook`, which are triggered before starting an installation
   and after completing an installation;
* `module_write_hook`, which is triggered right before a module file is written.
  This includes the temporary module file used when installing extensions and during the sanity check,
  as well as the devel module.
* "*step*" hooks that are triggered before and after every step of each installation procedure that is performed,
  also aptly named '`pre`'- and '`post`' hooks.
* `cancel_hook` and `fail_hook` which are triggered when a `KeyboardInterrupt` or `EasyBuildError` is raised,
  respectively.
* `pre_run_shell_cmd_hook` and `post_run_shell_cmd_hook` which are triggered right before and after running
  a shell command, respectively.

The list of currently available hooks in order of execution,
which can also be consulted using `eb --avail-hooks`, is:

* `start_hook` *(only called once in an EasyBuild session)*
* `parse_hook` *(available since EasyBuild v3.7.0)*
* `pre_build_and_install_loop_hook` *(available since EasyBuild v4.8.1)*
* `pre_easyblock_hook` *(available since EasyBuild v5.1.1)*
* `pre_fetch_hook`, `post_fetch_hook`
* `pre_ready_hook`, `post_ready_hook`
* `pre_source_hook`, `post_source_hook`
* `pre_patch_hook`, `post_patch_hook`
* `pre_prepare_hook`, `post_prepare_hook`
* `pre_configure_hook`, `post_configure_hook`
* `pre_build_hook`, `post_build_hook`
* `pre_test_hook`, `post_test_hook`
* `pre_install_hook`, `post_install_hook`
* `pre_extensions_hook`
* `pre_single_extension_hook`, `post_single_extension_hook` *(available since EasyBuild v4.7.1)*
* `post_extensions_hook`
* `pre_postiter_hook`, `post_postiter_hook` *(available since EasyBuild v4.8.1)*
* `pre_postproc_hook`, `post_postproc_hook`
* `pre_sanitycheck_hook`, `post_sanitycheck_hook`
* `pre_cleanup_hook`, `post_cleanup_hook`
* `pre_module_hook`
* `module_write_hook` *(called multiple times per installation, available since EasyBuild v4.4.1)*
* `post_module_hook`
* `pre_permissions_hook`, `post_permissions_hook`
* `pre_package_hook`, `post_package_hook`
* `pre_testcases_hook`, `post_testcases_hook`
* `post_easyblock_hook` *(available since EasyBuild v5.1.1)*
* `post_build_and_install_loop_hook` *(available since EasyBuild v4.8.1)*
* `end_hook` *(only called once in an EasyBuild session)*
* `cancel_hook` *(available since EasyBuild v4.8.1)*
* `fail_hook` *(available since EasyBuild v4.8.1)*

`pre_run_shell_cmd_hook` and `post_run_shell_cmd_hook` *(available since EasyBuild v4.8.1)* are not included in
the list above because they can not be put in a particular order relative to other hooks, since these hooks
are triggered several times throughout an EasyBuild session.

All functions implemented in the provided Python module for which the name ends with `_hook` are considered.

If any `*_hook` functions are encountered that do not match any of the available hooks, an error is reported.
EasyBuild will try to provide suggestions for available hooks that closely match the encountered unknown hook.

For example:

```console
$ eb --hooks wrong_hooks.py example.eb
== temporary log file in case of crash /tmp/eb-nMawy1/easybuild-Gu2ZP6.log
ERROR: Found one or more unknown hooks:
* stat_hook (did you mean 'start_hook'?)
* this_is_not_a_hook
* install_hook (did you mean 'pre_install_hook', or 'post_install_hook'?)

Run 'eb --avail-hooks' to get an overview of known hooks
```

## Implementing hooks

To implement hooks, simply define one or more functions in a Python module (`*.py`),
each named after an available hook.

In hooks you have access to the full functionality provided by the EasyBuild framework,
so do `import` from `easybuild.tools.*` (or other `easybuild.*` namespaces) to leverage
those functions.

Do take into account the following:

* [Hook arguments][hooks-arguments]
* [Return value of hooks][hooks-return-value]
* [Parse hook specifics][parse-hook-specifics]


### Hook arguments {: #hooks-arguments }

* For both `start_hook` and `end_hook` no arguments are provided.
* For `cancel_hook` and `fail_hook` the `KeyboardInterrupt` or `EasyBuildError` exception that was raised
  is provided as an argument.
* For `parse_hook` the `EasyConfig` instance that corresponds to the easyconfig file being parsed
  (usually referred to as `ec`) is passed as an argument.
* For `pre_build_and_install_loop_hook` a list of easyconfigs is provided as an argument.
* For `post_build_and_install_loop_hook` a list of easyconfigs with build results is provided as an argument.
* For `pre_easyblock_hook` and `post_easyblock_hook` an `EasyBlock` instance is provided as an argument.
* For `pre_run_shell_cmd_hook`, multiple arguments are passed:
    * An unnamed argument (often called `cmd`) that corresponds to the shell command that will be run,
      which could be provided either as a string value (like `"echo hello"`) or a list value (like `['echo', 'hello']`).
    * A named argument `work_dir` that specifies the path of the working directory in which the command will be run.
    * For interactive commands (which are run via the `run_cmd_qa` function), an additional named argument
      `interactive` is set to `True`.
* For `post_run_shell_cmd_hook`, multiple arguments are passed:
    * An unnamed argument (often called `cmd`) that corresponds to the shell command that was run,
      which could be provided either as a string value (like `"echo hello"`) or a list value (like `['echo', 'hello']`).
    * A named argument `work_dir` that specifies the working directory in which the shell command was run.
    * A named argument `exit_code` that specifies the exit code of the shell command that was run.
    * A named argument `output` that specifies the output of the shell command that was run.
    * For interactive commands (which are run via the `run_cmd_qa` function), an additional named argument
      `interactive` is set to `True`.
* For `module_write_hook`, 3 arguments are provided:
    * The `EasyBlock` instance used to perform the installation (usually referred to as `self`).
    * The filepath of the module that will be written.
    * The module text as a string.
* For the step hooks, the `EasyBlock` instance used to perform the installation (usually referred to as `self`).
  The parsed easyconfig file can be accessed in the step hooks via the `EasyBlock` instance, i.e., via `self.cfg`.

It is recommended to anticipate possible changes in the provided (named) arguments,
using the `*args` and `**kwargs` mechanism commonly used in Python. This
avoids that your hook implementations may break when updating to future EasyBuild versions. For example:

```py
# example pre-configure hook that anticipates changes in provided arguments
def pre_configure_hook(self, *args, **kwargs):
    ...
```


### Return value of hooks {: #hooks-return-value }

The return value of a hook is usually ignored by EasyBuild, except in particular cases:

* If the `module_write_hook` returns a (string) value, it **replaces the original text that was going to be
  written to the module file**. This way the `module_write_hook` can extend, change, or entirely replace the
  module text that was provided as an argument.

* If the `pre_run_shell_cmd_hook` returns a value, it **replaces the shell command that was going to be run**.
  Hence, this hook can change or entirely replace particular shell commands right before they are executed.
  Note that the value type of the return value of `pre_run_shell_cmd_hook` *must* match with the type of the
  first (unnamed) argument that provides the shell command that would have been run originally.


### Parse hook specifics {: #parse-hook-specifics }

`parse_hook` is triggered right *after* reading the easyconfig file,
before further parsing of some easyconfig parameters (like `*dependencies`) into
custom data structures is done.

This is important since it allows to dynamically modify easyconfig files
while they are still "raw", i.e. when the easyconfig parameter values are
still basic Python data structures like lists, dictionaries, etc.
that are easy to manipulate (see also [Manipulating easyconfig parameters](#manipulating-easyconfig-parameters)).

In `parse_hook` easyconfig parameters can be accessed and/or modified in a straightforward way,
see [Example hook to inject a custom patch file](#inject-a-custom-patch-file).


## Caveats

Due to internal details of the EasyBuild framework, you may run into some surprises when
implementing hooks.
Here are some things to take into account:


### Resolving of template values

In all *step* hooks, template values in easyconfig parameters will be resolved whenever they are accessed.

That is, if the `%(version)` template is used in for example the `sources` easyconfig parameter,
it will be replaced with the actual value of the `version` easyconfig parameter whenever the
`sources` value is used.
This can be avoided by temporarily disabling templating by wrapping the code in `with self.cfg.disable_templating:`.

There is one notable exception to this:
Templates in easyconfig parameters are *not* resolved in `parse_hook`,
because templating has been disabled explicitly before `parse_hook` is called;
this helps significantly to simplify manipulating of easyconfig parameter values
(see also [Manipulating easyconfig parameters](#manipulating-easyconfig-parameters)).


### Manipulating easyconfig parameters

You may run into surprises when trying to manipulate easyconfig parameters, for various reasons.

First of all, the original easyconfig parameters may already be processed in another data structure
which does not resemble the original format in which the parameter was defined in the easyconfig file.

Moreover, this processing could be done either "in place" by replacing the original easyconfig parameter value,
or in a separate variable, which effectively means that any changes to the original easyconfig parameter value
are simply ignored.

In addition, because of how the templating mechanism for easyconfig parameter works,
changes to easyconfig parameters with non-string values (i.e. lists, dictionaries, etc.) will go up
in smoke if not done correctly.

More specifically, the following approach will *not* work in any of the (step) hooks, except for `parse_hook`:

```py
def pre_fetch_hook(self):
     "Example of pre-fetch hook to manipulate list of patches."
     # this does NOT have the intended affect in any pre- or post-step hook
     self.cfg['patches'].append('example.patch')
```

The problem here is that the value obtained via `self.cfg['patches']` is not a reference
to the actual easyconfig parameter value but a reference to a temporary copy thereof;
hence any updates on the copy are effectively lost immediately.

To achieve the intended effect, you can either:

* temporarily disable the templating mechanism:

    ```py
    def pre_fetch_hook(self):
        "Example of pre-fetch hook to manipulate list of patches."
        # temporarily disable templating, so changes to 'patches' easyconfig parameter are picked up
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

A better approach for manipulating easyconfig parameters is to use the `parse_hook` that
was introduced in EasyBuild v3.7.0 (see [Parse hook specifics][parse-hook-specifics]),
where these kind of surprises will not occur (because templating is automatically disabled
before `parse_hook` is called and restored immediately afterwards).
See also [Example hook to inject a custom patch file](#inject-a-custom-patch-file).

### Archived easyconfig file vs hooks

EasyBuild archives the easyconfig file that was used for a particular installation:
A copy is stored both in the `easybuild` subdirectory of the software installation
directory and in the easyconfigs repository (see [Easyconfigs repository][easyconfigs_repo]).

If any changes were made to the easyconfig file via hooks, these changes will *not* be
reflected in these copies.
The assumption here is that the hooks will also be in place for future (re-)installations.

EasyBuild does however store an additional copy of the easyconfig file which includes
any modifications that were done dynamically, for example by hooks.
If subtoolchains were used to resolve dependencies, they will also be hardwired in this copy.

This "*reproducible easyconfig*" is stored in the `easybuild/reprod` subdirectory
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

### Log running of shell commands + prepend `make install` with `sudo`

```py
shell_cmds_log = '/tmp/eb_shell_cmds.log'

def pre_run_shell_cmd_hook(cmd, work_dir=None, interactive=None):
    """
    Log shell commands before they are run,
    and replace 'make install' with 'sudo make install'.
    """
    with open(shell_cmds_log, 'a') as fp:
        cmd_type = 'interactive' if interactive else 'non-interactive'
        fp.write("%s command '%s' will be run in %s ...\n" % (cmd_type, cmd, work_dir))

    if cmd == "make install":
        return "sudo make install"


def post_run_shell_cmd_hook(cmd, work_dir=None, interactive=None, exit_code=None, output=None):
    """
    Log shell commands that were run.
    """
    with open(shell_cmds_log, 'a') as fp:
        cmd_type = 'interactive' if interactive else 'non-interactive'
        fp.write("%s command '%s' in %s exited with %s - output: %s\n" % (cmd_type, cmd, work_dir, exit_code, output))
```

### Adding a hook conditional on EasyBuild version

If an unknown hook is used then EasyBuild will error (see [Available hooks](#available-hooks)). The following example only
adds the `pre_build_and_install_loop_hook` if the EasyBuild version is `>= "4.8.1"`.

```py
from easybuild.tools.version import VERSION

if VERSION >= "4.8.1":
    def pre_build_and_install_loop_hook(ecs, *args, **kwargs):
        pass
```

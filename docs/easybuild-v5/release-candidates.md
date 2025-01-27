# Beta releases and release candidates for EasyBuild v5.0

Due to the large amount of changes in the upcoming EasyBuild v5.0 release,
we will tag a couple of beta releases and release candidates before releasing EasyBuild v5.0.0.

**Please consider testing these and providing feedback!**

## Beta release `5.0.0beta1` (24 Dec 2024)

!!! warning
    This is an early pre-release that includes the majority of changes that will be included
    in EasyBuild v5.0.0.

    It can be used for testing and providing feedback (reporting bugs or unexpected behaviour, etc.).

    Additional changes can still be made before the release of EasyBuild v5.0.0, [see below][beta1_planned_changes].

### Highlighted changes

EasyBuild v5.0.0 will include some significant changes compared to EasyBuild v4.x.

Some of those changes are internal improvements and will be invisible to most users, but many others may need special attention
as they incorporate new features, changes of behavior or deprecations that can impact your workflow.

This includes (but is not limited to):

- **Python >= 3.6** is required to run EasyBuild (Python >= 3.9 is recommended);
- using **Lmod >= v8.0** or **Environment Modules >= v4.3.0** is required as modules tool (check with `module --version`);
- a new function named `run_shell_cmd` is used to run shell commands like `cmake`, `make`, `pip`, etc. (more info [here](run_shell_cmd.md));
- the **default setting of some configuration options has changed**:
    - **RPATH linking** is used by default (can be disabled with `--disable-rpath`);
    - **trace output** is enabled by default (can be disabled with `--disable-trace`);
    - Lua module files generated by EasyBuild will by default:
        - use `depends_on` rather than `load` (can be disabled with `--disable-module-depends-on`);
        - include an `extensions` statement to expose the list of included extensions (can be disabled with `--disable-module-extensions`);
    - reproducible creation of source tarballs from Git repositories via `git_config` in `sources` easyconfig parameter (when using Python >= 3.9);
    - the `use_pip` and `sanity_pip_check` custom easyconfig parameters used by the `PythonPackage` and `PythonBundle` easyblocks are enabled by default;
- **some functionality has been deprecated**, including the use of the `run_cmd` and `run_cmd_qa` functions (`run_shell_cmd` should be used instead);
- easyconfigs using an old [unsupported toolchain](../policies/toolchains.md) have been moved to the [easyconfigs archive](https://github.com/easybuilders/easybuild-easyconfigs-archive);

### Installation

To install the initial beta release of EasyBuild v5.0.0 (`5.0.0beta1`), you can either:

- use the [provided easyconfig file](https://github.com/easybuilders/easybuild-easyconfigs/pull/22049), for example using:

    ```shell
    eb --from-pr 22049
    ```

- install into a Python virtual environment:

    ```shell
    venv_name='venv-eb-5.0.0beta1'
    python3 -m venv ${venv_name}
    unset PYTHONPATH
    source ${venv_name}/bin/activate
    
    tag='5.0.0beta1'
    pip install https://github.com/easybuilders/easybuild-framework/archive/easybuild-framework-v${tag}.tar.gz
    pip install https://github.com/easybuilders/easybuild-easyblocks/archive/easybuild-easyblocks-v${tag}.tar.gz
    pip install https://github.com/easybuilders/easybuild-easyconfigs/archive/easybuild-easyconfigs-v${tag}.tar.gz
    # optional dependencies for EasyBuild
    pip install archspec rich
    ```

### Planned additional changes {: #beta1_planned_changes }

A couple of additional changes that will be included in EasyBuild v5.0.0 are still a work-in-progress,
including (but not limited to):

- deprecating of `module_req_guess` method (see [framework PR #4653](https://github.com/easybuilders/easybuild-framework/pull/4653));
- deprecating of `parallel` easyconfig parameter (see [framework PR #4580](https://github.com/easybuilders/easybuild-framework/pull/4580));

For a complete overview of planned changed, see the [GitHub dashboard for EasyBuild v5.0](https://github.com/orgs/easybuilders/projects/18/views/2).

### Providing feedback & reporting problems

Please test this release, provide feedback, and report problems, either via:

- the `#eb5` channel in the EasyBuild Slack;
- the EasyBuild maling list;
- one of the upcoming [EasyBuild conf calls](https://github.com/easybuilders/easybuild/wiki/Conference-calls);
- the [dedicated issue in the `easybuild` repository](https://github.com/easybuilders/easybuild/issues/911);

You should include:

- the output produced by `eb --version`, `eb --show-config`, and `eb --show-system-info`;
- an overview of what you tried;
- whether it worked or not;
- which problems you ran into (if any);

Also positive feedback is welcome!

### FAQ

- *Do I need to reinstall all software that was installed with EasyBuild v4.x when I want to start using EasyBuild v5.x?*
  No, you do not. You can install additional software using EasyBuild v5.x on top of installations performed with EasyBuild v4.x.

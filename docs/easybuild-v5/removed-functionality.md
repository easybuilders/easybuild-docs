# Removed functionality in EasyBuild v5.0

*(for a full overview of changes in EasyBuild v5.0, see [here](index.md))*

Functionality that was deprecated a while ago has been removed:

- [EasyBuild bootstrap script is removed][bootstrap_script]
- [Experimental support for `.yeb` easyconfig format is removed][yeb]


---

## Deprecated EasyBuild bootstrap script is removed {: #bootstrap_script }

The EasyBuild bootstrap script has been removed (see [easybuild-framework PR #4233](https://github.com/easybuilders/easybuild-framework/pull/4233)).

Please see the [installation page](../installation.md) for the suggested methods for installing EasyBuild.

---

## Experimental support for `.yeb` easyconfig format is removed {: #yeb }

Support for the experimental `.yeb` easyconfig format has been removed (see [easybuild-framework PR #4237](https://github.com/easybuilders/easybuild-framework/pull/4237)).

This format allowed easyconfigs to be specified in YAML. However, there has been no recent development of this
format and little suggestion that anyone was using it at all.

---

- 4279  removed deprecated `mod_exists_regex_template` options in `ModulesTool.exist` <https://github.com/easybuilders/easybuild-framework/pull/4279>
- 4278  remove deprecated options from `easyconfig.py`: `disable_templating` + `default_fallback` option in `get_easyblock_class` <https://github.com/easybuilders/easybuild-framework/pull/4278>
- 4277  remove deprecated `skip_lower` option from `template_constant_dict` <https://github.com/easybuilders/easybuild-framework/pull/4277>
- 4276  remove deprecated `log_error` option from `which` function <https://github.com/easybuilders/easybuild-framework/pull/4276>
- 4275  remove deprecated functionality from `filetools` <https://github.com/easybuilders/easybuild-framework/pull/4275>
- 4274  remove deprecated `Toolchain.add_dependencies` <https://github.com/easybuilders/easybuild-framework/pull/4274>
- 4273  remove deprecated `descr` option for `simple_option` <https://github.com/easybuilders/easybuild-framework/pull/4273>
- 4272  remove support for 32-bit targets <https://github.com/easybuilders/easybuild-framework/pull/4272>
- 4245  remove deprecated fetch_extension_sources <https://github.com/easybuilders/easybuild-framework/pull/4245>
- 4244  remove deprecated use_git_am option to apply_patch <https://github.com/easybuilders/easybuild-framework/pull/4244>
- 4243  remove deprecated is_generic_easyblock from easyconfig.py <https://github.com/easybuilders/easybuild-framework/pull/4243>
- 4242  remove deprecated --accept-eula option <https://github.com/easybuilders/easybuild-framework/pull/4242>
- 4240  remove deprecated dummy toolchain <https://github.com/easybuilders/easybuild-framework/pull/4240>
- 4239  remove deprecated --wait-on-lock option <https://github.com/easybuilders/easybuild-framework/pull/4239>


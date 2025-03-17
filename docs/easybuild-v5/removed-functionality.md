# Removed functionality in EasyBuild v5.0

*(for a full overview of changes in EasyBuild v5.0, see [here](index.md))*

Functionality that was deprecated a while ago has been removed:

- [EasyBuild bootstrap script][bootstrap_script]
- [Experimental support for `.yeb` easyconfig format][yeb]
- [`accept-eula` configuration setting][accept-eula]
- [`--wait-on-lock` configuration setting][wait-on-lock]
- [`is_generic_easyblock` function from `easybuild.framework.easyconfig.easyconfig`][easyconfig-is_generic_easyblock]
- [`copytree`, `rmtree2` functions from `easybuild.filetools`][filetools-copytree-rmtree2]
- [`fetch_extension_sources` method in `EasyBlock` class][EasyBlock-fetch_extension_sources]
- [`mod_exists_regex_template` options in `ModulesTool.exist` method][ModulesTool-exist-mod_exists_regex_template]
- [`Toolchain.add_dependencies` method][Toolchain-add_dependencies]
- [`disable_templating` + `default_fallback` options in `get_easyblock_class` function][get_easyblock_class]
- [`skip_lower` option from `template_constant_dict` function][template_constant_dict]
- [`use_git_am` option for `apply_patch` function][apply_patch-use_git_am]
- [`skip_symlinks` option for `adjust_permissions` function][adjust_permissions-skip_symlinks]
- [`log_error` option in `which` function][which-log_error]
- [`descr` option for `simple_option` function][simple_option-descr]
- [`dummy` toolchain][dummy-toolchain]
- [Support for 32-bit targets][32-bit-targets]


---

## EasyBuild bootstrap script {: #bootstrap_script }

The EasyBuild bootstrap script has been removed.

Please see the [installation page](../installation.md) for the suggested methods for installing EasyBuild.

---

## Experimental support for `.yeb` easyconfig format {: #yeb }

Support for the experimental `.yeb` easyconfig format has been removed.

This format allowed easyconfigs to be specified in YAML. However, there has been no recent development of this
format and little suggestion that anyone was using it at all.

---

## `accept-eula` configuration setting] {: #accept-eula }

*(more info soon)*

---

## `--wait-on-lock` configuration setting {: #wait-on-lock }

*(more info soon)*

---

## `is_generic_easyblock` function from `easybuild.framework.easyconfig.easyconfig` {: #easyconfig-is_generic_easyblock }

*(more info soon)*

---

## `copytree`, `rmtree2` functions from `easybuild.filetools` {: #filetools-copytree-rmtree2 }

*(more info soon)*

---

## `fetch_extension_sources` method in `EasyBlock` class {: #EasyBlock-fetch_extension_sources }

*(more info soon)*

---

## `mod_exists_regex_template` options in `ModulesTool.exist` method {: #ModulesTool-exist-mod_exists_regex_template }

*(more info soon)*

---

## `Toolchain.add_dependencies` method {: #Toolchain-add_dependencies }

*(more info soon)*

---

## `disable_templating` + `default_fallback` options in `get_easyblock_class` function {: #get_easyblock_class }

*(more info soon)*

---

## `skip_lower` option from `template_constant_dict` function {: #template_constant_dict }

*(more info soon)*

---

## `use_git_am` option for `apply_patch` function {: #apply_patch-use_git_am }

*(more info soon)*

---

## `skip_symlinks` option for `adjust_permissions` function {: #adjust_permissions-skip_symlinks }

*(more info soon)*

---

## `log_error` option in `which` function {: #which-log_error }

*(more info soon)*

---

## `descr` option for `simple_option` function {: #simple_option-descr }

*(more info soon)*

---

## `dummy` toolchain {: #dummy-toolchain }

*(more info soon)*

---

## Support for 32-bit targets {: #32-bit-targets }

*(more info soon)*

---


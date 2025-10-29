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

## `--accept-eula` configuration setting] {: #accept-eula }

The `--accept-eula` option was changed to `--accept_eula_for` in EasyBuild 4.3.4 where it was also enhanced to
support reular expressions. Use of `--accept-eula` has now been removed.

---

## `--wait-on-lock` configuration setting {: #wait-on-lock }

The `--wait-on-lock` option was replaced and split into `--wait-on-lock-limit` and `--wait-on-lock-interval` in
EasyBuild 4.2.1. Use of `--wait-on-lock` has now been removed.

---

## `is_generic_easyblock` function from `easybuild.framework.easyconfig.easyconfig` {: #easyconfig-is_generic_easyblock }

`is_generic_easyblock` was moved to `easybuild.tools.filetools` in EasyBuild 4.2.0. Use of `is_generic_easyblock`
from `easybuild.framework.easyconfig.easyconfig` has been removed.

---

## `copytree`, `rmtree2` functions from `easybuild.filetools` {: #filetools-copytree-rmtree2 }

The use of `rmtree2` was replaced by `remove_dir` and the use of `copytree` by `copy_dir` in EasyBuild 4.2.0.
Use of `rmtree2` and `copytree`, from `easybuild.filetools`, has now been removed.

---

## `fetch_extension_sources` method in `EasyBlock` class {: #EasyBlock-fetch_extension_sources }

`fetch_extension_sources` was replaced by `collect_exts_file_info`. in EasyBuild 4.5.0. Use of
`fetch_extension_sources` has now been removed.

---

## `mod_exists_regex_template` option in `ModulesTool.exist` method {: #ModulesTool-exist-mod_exists_regex_template }

The `mod_exists_regex_template` option in `ModulesTool.exist` was unused and has now been removed.

---

## `Toolchain.add_dependencies` method {: #Toolchain-add_dependencies }

`Toolchain.add_dependencies` has been removed. The dependencies should be passed to the `prepare`
method instead, using the `deps` argument.

---

## `disable_templating` + `default_fallback` options in `get_easyblock_class` function {: #get_easyblock_class }

`disable_templating` was changed to be a function on the EasyConfig class in EasyBuild 4.4.0.
`disable_templating` and the `default_fallback` option for `get_easyblock_class` have now been removed.

---

## `skip_lower` option from `template_constant_dict` function {: #template_constant_dict }

The `skip_lower` option in `template_constant_dict` had no effect in EasyBuild 4 and has now been
removed.

---

## `use_git_am` option for `apply_patch` function {: #apply_patch-use_git_am }

The `use_git_am` option for `apply_patch` was renamed to `use_git` in EasyBuild 4.3.0 . This option
has now been removed.

---

## `skip_symlinks` option for `adjust_permissions` function {: #adjust_permissions-skip_symlinks }

The `skip_symlinks` option in the `adjust_permissions` function has been removed. Symlinks are not
followed in this function.

---

## `log_error` option in `which` function {: #which-log_error }

The `log_error` option in the `which` function was changed to `on_error` in EasyBuild 4.4.0 to allow
enhanced options on what to do when an error is encountered in this function. This option has now
been removed.

---

## `descr` option for `simple_option` function {: #simple_option-descr }

The `descr` option in the `simple_option` function was removed. This has been unused in EasyBuild for
a long time.

---

## `dummy` toolchain {: #dummy-toolchain }

The `dummy` toolchain was replaced by the `SYSTEM` toolchain in EasyBuild 4. The `dummy` toolchain has
now been removed. As part of this the `--add-system-to-minimal-toolchains` option replaces
`--add-dummy-to-minimal-toolchains`.

---

## Support for 32-bit targets {: #32-bit-targets }

EasyBuild has support for 32-bit targets for `imkl` versions before 11. These have now been removed.

---


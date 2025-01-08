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

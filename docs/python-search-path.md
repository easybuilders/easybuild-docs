# Python search path

In order to locate python packages in modules, before v5.0.0, EasyBuild conventionally used the `PYTHONPATH` environment variable. However, this has several issues:

1. `PYTHONPATH` has highest priority; it prevents users from making a custom virtual environment on top of modules and shadowing packages.
2. Packages are picked up even for incompatible python versions, e.g. an OS installed old python 3.6 will break if packages from 3.12 exists in `PYTHONPATH`.
3. Modules can't have optional dependencies on different Python versions, as PYTHONPATH points directly to the `site-packages` subdirectory.
4. Packages with `pth` files can't work with PYTHONPATH and requires being added to the site dir.

Unfortunately, Python offers no environment variables to do the correct thing here.
To solve this (initially for Python `multi_deps`) EasyBuild has for a long time supported the use of the custom `EBPYTHONPREFIXES` via a `sitecustomize.py` script for the Python modules we build. 
It is included in standard Python installations made with EasyBuild. You can opt out of using `sitecustomize.py` if you have strong technical reasons to avoid it.

This does the correct thing by only considering the correct Python version, and puts Python packages provided by the environment module at the lowest priority, allowing a user venv to override them.

## Using `--prefer-python-search-path` 

Since v5.0.0 the new global configuration option `--prefer-python-search-path` can be used for EasyBuild to prefer the use of either `PYTHONPATH` or `EBPYTHONPREFIXES`.
For backwards compatibility with existing modules, EasyBuild was unfortunately required to keep `PYTHONPATH` as the default.
Note that the option is just the preferred option, if the package path doesn't follow the standard `lib/pythonY.X/site-packages` format then `PYTHONPATH` must be used. If multi-deps is used, then `EBPYTHONPREFIXES` is required.

If you wish to switch to `EBPYTHONPREFIXES`, you should also traverse the existing Python bundles you have installed and make sure to rebuild the modules.
Failure to do so might leave you with a few easyconfigs that require shadowing of older package versions not working correctly due to the import priority changing.

If you are switching to building a new tree, you can safely switch this option to `EBPYTHONPREFIXES` and enjoy the benefits.

## Fixing existing modules

You can convert existing modules by rebuilding them with `eb --module-only --rebuild ...`.
You can find the modules that use `PYTHONPATH` by e.g. grepping through your modules:

```bash
grep --include '*.lua' -Rl 'PYTHONPATH.*site-packages' /path/to/modules/all
```

If you use the default module naming scheme

```bash
cd $MODULEPATH
grep -Rl PYTHONPATH */*.lua | grep -v EasyBuild | sed -e 's+/+-+' | sed -e 's+lua$+eb+' | xargs eb --rebuild --module-only
```

If done correctly, your old module files will have gone from

```lua
prepend_path("PYTHONPATH", pathJoin(root, "lib", "python3.12", "site-packages"))
# or
prepend_path("PYTHONPATH", pathJoin(root, "lib/python3.12/site-packages"))
```

to

```lua
prepend_path("EBPYTHONPREFIXES", root)
```

Remember to back up all your module files first before rebuilding.

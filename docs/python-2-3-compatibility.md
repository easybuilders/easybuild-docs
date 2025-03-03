# Compatibility with Python 3 {: #py2_py3_compatibility }

Starting with EasyBuild v5.0, the EasyBuild framework and easyblocks require Python >= 3.6.

More specifically, the following Python versions are currently supported:

- Python 3.6.x
- Python 3.7.x
- Python 3.8.x (requires EasyBuild v4.1.0)
- Python 3.9.x (requires EasyBuild v4.3.1)
- Python 3.10.x (requires EasyBuild v4.5.2)
- Python 3.11.x (requires EasyBuild v4.5.2)
- Python 3.12.x (requires EasyBuild v5.0.0)
- Python 3.13.x (requires EasyBuild v5.0.0)

## Determining which Python version EasyBuild is using via `$EB_VERBOSE` {: #py2_py3_compatibility_EB_VERBOSE }

To determine which Python version is being used to run EasyBuild, you
can define the `$EB_VERBOSE` environment variable.

For example:

``` console
$ export EB_VERBOSE=1
$ eb --version
>> Considering 'python'...
>> No 'python' found in $PATH, skipping...
>> Considering 'python3'...
>> 'python3' version: 3.6.9, which matches Python 3 version requirement (>= 3.5)
>> Selected Python command: python3 (/usr/local/bin/python3)
>> python3 -m easybuild.main --version
This is EasyBuild 4.0.0 (framework: 4.0.0, easyblocks: 4.0.0) on host example.
```

## Controlling which `python` command EasyBuild will use via `$EB_PYTHON` {: #py2_py3_compatibility_EB_PYTHON }

The `eb` command will consider different `python` commands, and check
the Python version corresponding with the command before selecting one.
The commands considered are (in order):

- `python`
- `python3`

Before considering these commands, `eb` will first consider the command
name specified via the `$EB_PYTHON` environment variable (if defined),
so you can always control which Python version is being used if desired.

For example:

``` console
$ export EB_PYTHON=python3.7
$ export EB_VERBOSE=1
$ eb --version
>> Considering 'python3.7'...
>> 'python3.7' version: 3.7.2, which matches Python 3 version requirement (>= 3.5)
>> Selected Python command: python3.7 (/usr/local/bin/python3.7)
>> python3.7 -m easybuild.main --version
This is EasyBuild 4.0.0 (framework: 4.0.0, easyblocks: 4.0.0) on host example.
```

## The `easybuild.tools.py2vs3` package

Support for Python 2.7, and Python 3.5, was removed in EasyBuild v5.0.

The `easybuild.tools.py2vs3` package was introduced in EasyBuild v4.0 so
that when importing a function from this package, you would automatically
get a version of the function that is compatible with the Python version
being used to run EasyBuild.

Use of `easybuild.tools.py2vs3` is deprecated in EasyBuild v5 and will be
removed in the future.

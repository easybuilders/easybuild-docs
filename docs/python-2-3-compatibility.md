# Compatibility with Python 2 and Python 3 {: #py2_py3_compatibility }

Starting with SimpleBuild v4.0, the SimpleBuild framework and simpleblocks are
compatible with both Python versions 2 and 3. More specifically, the
following Python versions are currently supported:

- Python 2.6.x (support was removed in SimpleBuild v4.4.0)
- Python 2.7.x
- Python 3.5.x
- Python 3.6.x
- Python 3.7.x
- Python 3.8.x (requires SimpleBuild v4.1.0)
- Python 3.9.x (requires SimpleBuild v4.3.1)
- Python 3.10.x (requires SimpleBuild v4.5.2)
- Python 3.11.x (requires SimpleBuild v4.5.2)

## Determining which Python version SimpleBuild is using via `$EB_VERBOSE` {: #py2_py3_compatibility_EB_VERBOSE }

To determine which Python version is being used to run SimpleBuild, you
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
>> python3 -m simplebuild.main --version
This is SimpleBuild 4.0.0 (framework: 4.0.0, simpleblocks: 4.0.0) on host example.
```

## Controlling which `python` command SimpleBuild will use via `$EB_PYTHON` {: #py2_py3_compatibility_EB_PYTHON }

The `eb` command will consider different `python` commands, and check
the Python version corresponding with the command before selecting one.
The commands considered are (in order):

- `python`
- `python3`
- `python2`

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
>> python3.7 -m simplebuild.main --version
This is SimpleBuild 4.0.0 (framework: 4.0.0, simpleblocks: 4.0.0) on host example.
```

## The `simplebuild.tools.py2vs3` package

To facilitate this, the `simplebuild.tools.py2vs3` package was introduced
in SimpleBuild v4.0. When importing a function from this package, you will
automatically get a version of the function that is compatible with the
Python version being used to run SimpleBuild.

Through this approach we can hide subtle differences between Python 2
and 3, while avoiding code duplication and Python version checks
throughout the codebase, as well as avoid requiring packages like `six`
or `future` (which facilitate maintaining compatibility with Python 2
and 3, but are also a bit of a burden).

The `simplebuild.tools.py2vs3` package provides two major classes of items
(listed below in alphabetical order):

- functions from the Python standard library which should be imported
    from different locations in Python 2 and 3
- wrappers for functionality in the Python standard library which
    behaves differently in Python 2 and 3

## `ascii_letters` {: #py2vs3_ascii_letters }

- Python 2: corresponds to `string.letters`
- Python 3: corresponds to `string.ascii_letters`

## `ascii_lowercase` {: #py2vs3_ascii_lowercase }

- Python 2: corresponds to `string.lowercase`
- Python 3: corresponds to `string.ascii_lowercase`

## `build_opener` {: #py2vs3_build_opener }

- Python 2: corresponds to `urllib2.build_opener` function
- Python 3: corresponds to `urllib.request.build_opener` function

## `configparser` {: #py2vs3_configparser }

- Python 2: corresponds to `ConfigParser.configparser` module
- Python 3: corresponds to `configparser` module

## `create_base_metaclass` {: #py2vs3_create_base_metaclass }

Function to create a metaclass that can be used as a base class,
implemented in a way that is compatible with both Python 2 and 3.

## `extract_method_name` {: #py2vs3_extract_method_name }

Function to method name from lambda function, implemented in a way that
is compatible with both Python 2 and 3.

## `HTTPError` {: #py2vs3_HTTPError }

- Python 2: corresponds to `urllib2.HTTPError`
- Python 3: corresponds to `urllib.request.HTTPError`

## `HTTPSHandler` {: #py2vs3_HTTPSHandler }

- Python 2: corresponds to `urllib2.HTTPSHandler`
- Python 3: corresponds to `urllib.request.HTTPSHandler`

## `json_loads` {: #py2vs3_json_loads }

- Python 2: wraps `json.loads` function

- Python 3: wraps `json.loads` function, taking into account that for Python versions older than 3.6
    - a value of type `string` (rather than `bytes`) is required as argument

## `mk_wrapper_baseclass` {: #py2vs3_mk_wrapper_baseclass }

Function to create a wrapper base class using the specified metaclass,
implemented in a way that is compatible with both Python 2 and 3.

## `OrderedDict` {: #py2vs3_OrderedDict }

- Python 2.6: corresponds to `simplebuild.tools.ordereddict.OrderedDict`
- Python 2.7: corresponds to `collections.OrderedDict`
- Python 3: corresponds to `collections.OrderedDict`

## `reload` {: #py2vs3_reload }

- Python 2: corresponds to `reload` built-in function
- Python 3: corresponds to `importlib.reload` function

## `raise_with_traceback` {: #py2vs3_raise_with_traceback }

Function to raise an error with specified message and traceback,
implemented in a way that is compatible with both Python 2 and 3.

## `Request` {: #py2vs3_Request }

- Python 2: corresponds to `urllib2.Request`
- Python 3: corresponds to `urllib.request.Request`

## `subprocess_popen_text` {: #py2vs3_subprocess_popen_text }

- Python 2: wrapper for `subprocess.Popen`
- Python 3: wrapper for `subprocess.Popen` while forcing text mode
    (using `universal_newlines=True`)

## `std_urllib` {: #py2vs3_std_urllib }

- Python 2: corresponds to `urllib` package
- Python 3: corresponds to `urllib.request` package

## `string_type` {: #py2vs3_string_type }

- Python 2: corresponds to `basestring` built-in string type
- Python 3: corresponds to `str` built-in string type

## `StringIO` {: #py2vs3_StringIO }

- Python 2: corresponds to `StringIO.StringIO` class
- Python 3: corresponds to `io.StringIO` class

## `urlencode` {: #py2vs3_urlencode }

- Python 2: corresponds to `urllib.urlencode` function
- Python 3: corresponds to `urllib.parse.urlencode` function

## `URLError` {: #py2vs3_URLError }

- Python 2: corresponds to `urllib2.URLError`
- Python 3: corresponds to `urllib.request.URLError`

## `urlopen` {: #py2vs3_urlopen }

- Python 2: corresponds to `urllib2.urlopen`
- Python 3: corresponds to `urllib.request.urlopen`

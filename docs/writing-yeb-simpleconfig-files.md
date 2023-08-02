# Writing simpleconfig files in YAML syntax (`.yeb` format) **Deprecated** {: #simpleconfig_yeb_format }

!!! warning
    Use of `.yeb` simpleconfigs is deprecated and [will be removed in SimpleBuild v5.0][yeb].

Useful links:

* YAML syntax specification: <https://www.yaml.org/spec/1.2/spec.html>


## Requirements {: #simpleconfig_yeb_format_requirements }

To use `.yeb` simpleconfigs, you need to have:

* an SimpleBuild (development) version which is aware of the `.yeb` format (i.e., version 2.3.0dev or higher)
* [PyYAML](https://pypi.python.org/pypi/PyYAML) installed and available in your Python search path
  (via `$PYTHONPATH` for example), such that `import yaml` works


## Syntax {: #simpleconfig_yeb_format_syntax }


### YAML header (optional) {: #simpleconfig_yeb_format_syntax_YAML_header }

Simpleconfig files in YAML syntax can start with a standard YAML header.

It consists of two lines:

* a line with a '`%YAML`' *directive* which also indicates the YAML version being used
  (the latest YAML version is 1.2, and dates from 2009);
* followed by a *document marker* line '`---`' (which is used to separate directives from content)

For example::

``` yaml
%YAML 1.2
---
```

This header is optional, but we recommend including it; one advantage is that editor will use proper syntax
highlighting for YAML when the `%YAML` directory is included.


### Comments {: #simpleconfig_yeb_format_syntax_comments }

Comments can be included anywhere, and are prefixed with a hash character `#`:

``` yaml
# this is a comment
```


### Internal variables {: #simpleconfig_yeb_format_syntax_internal_variables }

To define and use temporary/internal variables in simpleconfig files, which can be useful to avoid hardcoding (partial)
simpleconfig parameter values, the YAML anchor/alias functionality can be used
(see also <https://www.yaml.org/spec/1.2/spec.html#id2765878>).

A value can be marked for future reference via an *anchor*, using the ampersand character '`&`'.
Referring to it later is done using an asterisk character '`*`'.

Typically, internal variables are defined at the top of the `.yeb` simpleconfig file using a list named
`_internal_variables_`, but this is just a matter of style; anchors can be defined throughout the entire file if
desired.

For example, referring to the Python version being used in both the `versionsuffix` and list of dependencies can
be done as follows::

``` yaml
_internal_variables_:
    - &pyver 2.7.10

versionsuffix: !join [-Python-, *pyver]
dependencies:
    - [Python, *pyver]
```

In this example, the `!join` is used to concatenate two string values,
see also [Concatenating strings and/or variables][simpleconfig_yeb_format_syntax_string_concatenation].

A more elaborate example of this is the [`goolf-1.4.10.yeb`][simpleconfig_yeb_format_examples_goolf1410] example simpleconfig.



### Concatenating strings and/or variables {: #simpleconfig_yeb_format_syntax_string_concatenation }

The standard YAML format does not support the notion of string concatenation.

Since concatenating string values is a common pattern in simpleconfig files, the SimpleBuild framework
defines the `!join` operator to support this.

For example, defining a `versionsuffix` that contains the Python version being used (which may be referred to
elsewhere too) can be done as follows:

``` yaml
_internal_variables_:
    - &pyver 2.7.10

versionsuffix: !join [-Python-, *pyver]
```



### Escaping string values with single or double quotes {: #simpleconfig_yeb_format_syntax_escaping }

Strings in YAML can be unquoted. However, when they contain special characters they need to be escaped by either single-
or double-quoting the string.

Special characters that require single quotes are: `:` `{` `}` `[` `]` `,` `&` `*` `#` `?` `|` `-` `<` `>` `=` `!` `%` `@` and `\`.
When using single-quoted strings, any single quote inside the string must be doubled to escape it.

If the string contains control characters such as `\n`, it must be escaped with double quotes. 



### Simpleconfig parameter values {: #simpleconfig_yeb_format_syntax_simpleconfig_parameters }

To define an simpleconfig parameter, simply use `<key>: <value>` (i.e., use a colon `:` as a separator).

In YAML terminology, an simpleconfig file is expressed as a *mapping*, with simpleconfig parameters as keys.

Three types of values (*nodes*) are supported: *scalars* (strings, integers), *sequences* (lists) and *mappings*
(dictionaries).


#### Scalar values {: #simpleconfig_yeb_format_syntax_scalars }

Using scalar values is straight-forward, no special syntax is required.

For string values, no quotes must be used (in general).
However, quotes are sometimes required to escape characters that have special meaning in YAML (like '`:`').
(Also see: [Escaping string values with single or double quotes][simpleconfig_yeb_format_syntax_escaping])
It's worth noting that there's a subtle difference between using single and double quotes, see
[Flow Scalar Styles](https://www.yaml.org/spec/1.2/spec.html#id2786942).

Examples:

``` yaml
name: gzip
version: 1.6

# single quotes are required for string values representing URLs, to escape the ':'
homepage: 'http://www.gnu.org/software/gzip/'

parallel: 1
```

Multiline strings can be expressed using indentation:

``` yaml
description:
    gzip is a popular data compression program
    as a replacement for compress
```


#### Sequences {: #simpleconfig_yeb_format_syntax_sequences }

Sequence values (a.k.a. lists) can be expressed in different ways, depending on their size.

If there are a limited number of (short) entries the value can be expressed on a single line,
using square brackets '`[`' '`]`' and with comma '`,`' as separator.

Example:

``` yaml
# quotes are required to escape the ':'
source_urls: ['http://ftpmirror.gnu.org/gzip/', 'ftp://ftp.gnu.org/gnu/gzip/']
```

Alternatively indentation can be used for scope, with each entry on its own line,
indicated with a dash and a space `- item`

Example:

``` yaml
# no quotes required here, since there's no ambiguity w.r.t. ':'
source_urls:
    - http://ftpmirror.gnu.org/gzip/
    - http://ftp.gnu.org/gnu/gzip/
    - ftp://ftp.gnu.org/gnu/gzip/
```


#### Mappings {: #simpleconfig_yeb_format_syntax_mappings }

Mapping values (a.k.a. dictionaries) are expressed using a colon '`:`' and space as key-value separator,
a comma '`,`' to key-value pairs, and curly braces '`{`' '`}`' to mark the start/end.

For example:

``` yaml
    toolchain: {name: intel, version: 2015b}
```


#### Nesting {: #simpleconfig_yeb_format_syntax_nesting }

Different types of values can be nested.

For example, sequence values can be used in a mapping:

``` yaml
sanity_check_paths: {
    files: [bin/gunzip, bin/gzip, bin/uncompress],
    dirs: [],
}
```

And sequences of sequences are also supported:

``` yaml
osdependencies
    - zlib
    - [openssl-devel, libssl-dev, libopenssl-devel]
```



### Templates values and constants {: #simpleconfig_yeb_format_syntax_template_values_constants }

Template values can be specified as a part of string values, using `%(template_name)`.

Template constants are injected by the simpleconfig `.yeb` parser as *node anchors*,
and can be referred to with an *alias node*, i.e. using an asterisk `*`.

For example:

``` yaml
    source_urls: [*GNU_SOURCE]
    sources: ['%(name)s-%(version)s.tar.gz']  # equivalent with [*SOURCE_TAR_GZ]
```

See also [Dynamic values for simpleconfig parameters][simpleconfig_param_templates].


### Dependencies {: #simpleconfig_yeb_format_syntax_dependencies }

We updated the way dependencies are specified to match with the new toolchain format ([OS dependencies and sanity check paths][simpleconfig_yeb_format_new])
The format is a bit more verbose than before, but easier to read. Each dependency is a list entry, indicated by a dash
and space (`- item`). Each entry can specify a `name: version` key-value pair, and a `versionsuffix` and `toolchain`.
Only the `name: version` pair is required.

Dependencies can also be external modules. In this case, the dependency has to be specified with a `name` and the marker 
`external_module: True`. The boolean value is not case-sensitive.


A straightforward example:

``` yaml
dependencies:
    - libreadline: 6.3
    - Tcl: 8.6.4
    - name: fftw/3.3.4.4
      external_module: True

builddependencies:
    # empty versionsuffix, different toolchain (GCC/4.9.2)
    - CMake: 3.2.2
      toolchain: GCC, 4.9.2
```

A more complicated example from a toolchain simpleconfig, where also the `!join` operator
(see [Concatenating strings and/or variables][simpleconfig_yeb_format_syntax_string_concatenation]) and internal variables
(see [Internal variables][simpleconfig_yeb_format_syntax_internal_variables]) are used:

``` yaml
_internal_variables_:
    - &comp_name GCC
    - &comp_version 4.7.2
    - &comp [*comp_name, *comp_version]

    - &blaslib OpenBLAS
    - &blasver 0.2.6
    - &blas !join [*blaslib, -, *blasver]
    - &blas_suff -LAPACK-3.4.2

    - &comp_mpi_tc [gompi, 1.4.10]

dependencies:
    - *comp_name: *comp_version
    - OpenMPI: 1.6.4
      toolchain: *comp
    - *blaslib: *blasver
      versionsuffix: *blas_suff
      toolchain: *comp_mpi_tc
    - FFTW: 3.3.3
      toolchain: *comp_mpi_tc
    - ScaLAPACK: 2.0.2
      versionsuffix: !join [-, *blas, *blas_suff]
      toolchain: *comp_mpi_tc
```

For the full version of this simpleconfig file, see the example `.yeb` simpleconfig
[`goolf-1.4.10.yeb`][simpleconfig_yeb_format_examples_goolf1410].


### OS dependencies and sanity check paths {: #simpleconfig_yeb_format_new }

To specify parameters that used to contain tuples such as `osdependencies` and `sanity_check_paths`, simply use
lists (sequences) instead of tuples.

For example:

``` python
# note: this is eb syntax, will not work in .yeb files
osdependencies = [('openssl-devel', 'libssl-dev', 'libopenssl-devel')]
```

Becomes:

``` yaml
osdependencies: [[openssl-devel, libssl-dev, libopenssl-devel]]
```

And:

``` python
# note: this is eb syntax, will not work in .yeb files
sanity_check_paths = {
    'files': ['fileA', ('fileB', 'fileC')],
    'dirs' : ['dirA', 'dirB'],
}
```

Becomes:

``` yaml
sanity_check_paths: {
    files: [fileA, [fileB, fileC]],
    dirs: [dirA, dirB]
}
```


### Shorthands for common simpleconfig parameters

#### Toolchain format

The simpleconfig parameter `toolchain` in .eb files is defined as a dictionary `{'name':'foo', 'version':'bar'}`. In
the .yeb format, this can be done much easier by just using `name, version`. E.g:

``` python
# note: this is eb syntax, will not work in yeb files
toolchain = {'name':'intel', 'version':'2015b'}
```

becomes:

``` yaml
toolchain: intel, 2015b
```


## Examples {: #simpleconfig_yeb_format_examples }


### gzip-1.6-GCC-4.9.2.yeb {: #simpleconfig_yeb_format_examples_gzip16_GCC492 }

Example simpleconfig for gzip v1.6 using the `GCC/4.9.2` toolchain.

``` yaml
%YAML 1.2
---
simpleblock: ConfigureMake

name: gzip
version: 1.6

homepage: 'http://www.gnu.org/software/gzip/'
description:
    gzip is a popular data compression program
    as a replacement for compress

toolchain: GCC, 4.9.2

# http://ftp.gnu.org/gnu/gzip/gzip-1.6.tar.gz
source_urls: [*GNU_SOURCE]
sources: [%(name)s-%(version)s.tar.gz]

# make sure the gzip, gunzip and compress binaries are available after installation
sanity_check_paths: {
    files: [bin/gunzip, bin/gzip, bin/uncompress],
    dirs: [],
}

moduleclass: tools
```


### goolf-1.4.10.yeb {: #simpleconfig_yeb_format_examples_goolf1410 }

Simpleconfig file in YAML syntax for the goolf v1.4.10 toolchain.

``` yaml
_internal_variables_:
    - &version 1.4.10

    - &comp_name GCC
    - &comp_version 4.7.2
    - &comp [*comp_name, *comp_version]

    - &blaslib OpenBLAS
    - &blasver 0.2.6
    - &blas !join [*blaslib, -, *blasver]
    - &blas_suff -LAPACK-3.4.2

    - &comp_mpi_tc [gompi, *version]


simpleblock: Toolchain

name: goolf
version: *version

homepage: (none)
description: |
    GNU Compiler Collection (GCC) based compiler toolchain, including
    OpenMPI for MPI support, OpenBLAS (BLAS and LAPACK support), FFTW and ScaLAPACK.

toolchain: {name: system, version: system}

# compiler toolchain dependencies
# we need GCC and OpenMPI as explicit dependencies instead of gompi toolchain
# because of toolchain preparation functions
    dependencies:
        - *comp_name: *comp_version
        - OpenMPI: 1.6.4
          toolchain: *comp
        - *blaslib: *blasver
          versionsuffix: *blas_suff
          toolchain: *comp_mpi_tc
        - FFTW: 3.3.3
          toolchain: *comp_mpi_tc
        - ScaLAPACK: 2.0.2
          versionsuffix: !join [-, *blas, *blas_suff]
          toolchain: *comp_mpi_tc

moduleclass: toolchain
```


### Python-2.7.10-intel-2015b.yeb

``` yaml
_internal_variables_:
    - &numpyversion 1.9.2
    - &scipyversion 0.15.1

simpleblock: ConfigureMake

name: Python
version: 2.7.10

homepage: http://python.org/
description: |
    Python is a programming language that lets you work more quickly and integrate your systems
    more effectively.

toolchain: intel, 2015b
toolchainopts: {pic: True, opt: True, optarch: True}

source_urls: ['http://www.python.org/ftp/python/%(version)s/']
sources: [*SOURCE_TGZ]

# python needs bzip2 to build the bz2 package
dependencies: [
    - bzip2: 1.0.6
    - zlib: 1.2.8
    - libreadline: 6.3
    - ncurses: 5.9
    - SQLite: 3.8.10.2
    - Tk: 8.4.6
      versionsuffix: -no-X11
  # - OpenSSL: 1.0.1m
  #   OS dependency should be preferred if the os version is more recent then this version, its
  #   nice to have an up to date openssl for security reasons
]

osdependencies: [[openssl-devel, libssl-dev, libopenssl-devel]]

# order is important!
# package versions updated May 28th 2015
exts_list: [
    [setuptools, '16.0', {
        source_urls: ["https://pypi.python.org/packages/source/s/setuptools/"],
    }],
    [pip, 7.0.1, {
        source_urls: ["https://pypi.python.org/packages/source/p/pip/"],
    }],
    [nose, 1.3.6, {
        source_urls: ["https://pypi.python.org/packages/source/n/nose/"],
    }],
    [numpy, *numpyversion, {
        source_urls: [
            [!join ["http://sourceforge.net/projects/numpy/files/NumPy/", *numpyversion], download]
        ],
        patches: [
            numpy-1.8.0-mkl.patch, # % numpyversion,
        ],
    }],
    [scipy, *scipyversion, {
        source_urls: [
            [!join ["http://sourceforge.net/projects/scipy/files/scipy/", *scipyversion], download]],
    }],
    [blist, 1.3.6, {
        source_urls: ["https://pypi.python.org/packages/source/b/blist/"],
    }],
    [mpi4py, 1.3.1, {
        source_urls: ["http://bitbucket.org/mpi4py/mpi4py/downloads/"],
    }],
    [paycheck, 1.0.2, {
        source_urls: ["https://pypi.python.org/packages/source/p/paycheck/"],
    }],
    [argparse, 1.3.0, {
        source_urls: ["https://pypi.python.org/packages/source/a/argparse/"],
    }],
    [pbr, 1.0.1, {
        source_urls: ["https://pypi.python.org/packages/source/p/pbr/"],
    }],
    [lockfile, 0.10.2, {
        source_urls: ["https://pypi.python.org/packages/source/l/lockfile/"],
    }],
    [Cython, '0.22', {
        source_urls: ["http://www.cython.org/release/"],
    }],
    [six, 1.9.0, {
        source_urls: ["https://pypi.python.org/packages/source/s/six/"],
    }],
    [dateutil, 2.4.2, {
        source_tmpl: python-%(name)s-%(version)s.tar.gz,
        source_urls: ["https://pypi.python.org/packages/source/p/python-dateutil/"],
    }],
    [deap, 1.0.2, {
        # escaped with quotes because yaml values can't start with %
        source_tmpl: "%(name)s-%(version)s.post2.tar.gz",
        source_urls: ["https://pypi.python.org/packages/source/d/deap/"],
    }],
    [decorator, 3.4.2, {
        source_urls: ["https://pypi.python.org/packages/source/d/decorator/"],
    }],
    [arff, 2.0.2, {
        source_tmpl: liac-%(name)s-%(version)s.zip,
        source_urls: ["https://pypi.python.org/packages/source/l/liac-arff/"],
    }],
    [pycrypto, 2.6.1, {
        modulename: Crypto,
        source_urls: ["http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto/"],
    }],
    [ecdsa, '0.13', {
        source_urls: ["https://pypi.python.org/packages/source/e/ecdsa/"],
    }],
    [paramiko, 1.15.2, {
        source_urls: ["https://pypi.python.org/packages/source/p/paramiko/"],
    }],
    [pyparsing, 2.0.3, {
        source_urls: ["https://pypi.python.org/packages/source/p/pyparsing/"],
    }],
    [netifaces, 0.10.4, {
        source_urls: ["https://pypi.python.org/packages/source/n/netifaces"],
    }],
    [netaddr, 0.7.14, {
        source_urls: ["https://pypi.python.org/packages/source/n/netaddr"],
    }],
    [mock, 1.0.1, {
        source_urls: ["https://pypi.python.org/packages/source/m/mock"],
    }],
    [pytz, '2015.4', {
        source_urls: ["https://pypi.python.org/packages/source/p/pytz"],
    }],
    [pandas, 0.16.1, {
        source_urls: ["https://pypi.python.org/packages/source/p/pandas"],
    }],
]

moduleclass: lang
```

# Experimental features {: #experimental_features }

First introduced in SimpleBuild v2.1.0 (see
[SimpleBuild v2.1.0 Release Notes][release_notes_v2.1.0]), experimental features can only be used by enabling the
`--experimental` configuration option.

An experimental feature indicates to users that these features may
change significantly in a future release and should be used only for
testing, not (yet) for production usage.

Currently enabled experimental features include:

- support for simpleconfig files in YAML syntax (see
    [Writing simpleconfig files in YAML syntax][simpleconfig_yeb_format])
- support for generating container recipes & images (see
    [Generating container recipes & images][containers])
- support for using simplestack files (see
    [Simplestack files][simplestack])
- support for trying to update versions of the dependencies of an
    simpleconfig based on what is available in the robot path (see
    [Output of `eb --help`][basic_usage_help])
- support for installing extensions in parallel (see
    [Installing extensions in parallel][installing_extensions_in_parallel])

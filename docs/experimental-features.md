# Experimental features {: #experimental_features }

Experimental features can only be used by enabling the `--experimental` configuration option.

An experimental feature indicates to users that these features may
change significantly in a future release and should be used only for
testing, not (yet) for production usage.

Currently enabled experimental features include:

- support for generating container recipes & images (see 
    [Generating container recipes & images][containers])
- support for trying to update versions of the dependencies of an
    easyconfig based on what is available in the robot path (see
    [Output of `eb --help`][basic_usage_help])

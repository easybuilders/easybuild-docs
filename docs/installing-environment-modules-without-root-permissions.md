# Installing Environment Modules without root permissions {: #installing_env_mod }

This short guide will explain how to install the standard Environment
Modules software package without root permissions on a Linux or
Mac OS X system, together with Tcl on which it depends.

## Tcl

1. Go to <https://www.tcl-lang.org> and download the latest Tcl sources. At
    the time of writing, the latest available Tcl version was 8.6.16,
    which can be downloaded from
    [here](https://prdownloads.sourceforge.net/tcl/tcl8.6.16-src.tar.gz).
    The remainder of these commands will assume Tcl v8.6.16 is being
    installed, you may need to adjust them accordingly.

1. Unpack the Tcl source tarball:

    ``` shell
    tar xfvz tcl8.6.16-src.tar.gz
    ```

1. Pick a location where you will install Tcl. It should be a directory
    you have write permissions on. My suggestion would be to use
    something like `$HOME/.local/Tcl`.

1. Go to the `unix` subdirectory of the unpacked Tcl directory, and run
    the `configure` script using the `--prefix` option:

    ``` shell
    cd tcl8.6.16/unix
    ./configure --prefix=$HOME/.local/Tcl
    ```

    If you're building Tcl and Environment Modules on Mac, you should
    run `configure` in the `tcl8.6.16/macosx` directory instead.

1. Next, build Tcl using the `make` command. If the system you are
    building on has multiple cores, running make in parallel will speed
    up the build. Just use the `-j` option, and pass it a degree of
    parallelism (just use the number of cores your system has
    available), e.g.:

    ``` shell
    make -j 4
    ```

1. The final step consists of installing Tcl to the directory specified
    in step 4. To do this, simply run:

    ``` shell
    make install
    ```

**All done!** Now you are ready to build the Environment Modules
package, which requires Tcl.

## Environment Modules

1. Download the latest source tarball for the Environment Modules tools
    from <https://envmodules.github.io/modules/>. At the time of writing, the
    latest available version is 5.6.0 which can be downloaded [from
    here](https://github.com/envmodules/modules/releases/download/v5.6.0/modules-5.6.0.tar.gz).

1. Unpack the downloaded source tarball:

    ``` shell
    tar xfvz modules-5.6.0.tar.gz
    ```

1. Configure the build, again use `--prefix` to specify where to
    install the Environment Modules tool in the end. If you needed to
    install Tcl by hand as outlined in the previous section, you'll also
    need to specify where it was installed using the `--with-tcl`
    option:

    ``` shell
    cd modules-5.6.0
    ./configure --prefix=$HOME/.local/environment-modules --with-tcl=$HOME/.local/Tcl/lib --with-tclsh=$HOME/.local/Tcl/bin/tclsh8.6
    ```

1. Build with `make`:

    ``` shell
    make
    ```

1. Install:

    ``` shell
    make install
    ```

Alright, now just one more thing...

## Set up your environment

Because you've installed Environment Modules and Tcl in a non-default
location, you need to make sure your environment is setup up correctly
to use them.

To make a long story short, these are the commands you need to execute:

``` shell
export PATH=$HOME/.local/environment-modules/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/Tcl/lib:$LD_LIBRARY_PATH
# adjust line below if you're using a shell other than bash, check with 'echo $SHELL'
source $HOME/.local/environment-modules/init/bash
```

!!! tip
    Add these three lines in your `.bashrc` file, that way they'll
    be executed every time you log in.

You may look at Environment Modules installation guide to learn how to [enable
it in other shells](https://modules.readthedocs.io/en/stable/INSTALL.html#enable-modules-in-shells)
or [adapt the configuration](https://modules.readthedocs.io/en/stable/INSTALL.html#configuration)
to fit your needs.

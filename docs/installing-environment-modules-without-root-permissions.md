# Installing environment modules without root permissions {: #installing_env_mod_c }

This short guide will explain how to install the standard environment
modules Tcl/C software package without root permissions on a Linux or
Mac OS X system, together with Tcl on which it depends.

## Tcl

1. Go to <https://www.tcl.tk> and download the latest Tcl sources. At
    the time of writing, the latest available Tcl version was 8.5.15,
    which can be downloaded from
    [here](https://prdownloads.sourceforge.net/tcl/tcl8.5.15-src.tar.gz).
    The remainder of these commands will assume Tcl v8.5.15 is being
    installed, you may need to adjust them accordingly. **Note**: Stick
    to Tcl v8.5.x, don't consider using the more recent v8.6.x or
    higher, since the environment modules package is not compatible with
    those Tcl versions.

1. Unpack the Tcl source tarball:

    ``` shell
    tar xfvz tcl8.5.15-src.tar.gz
    ```

1. Pick a location where you will install Tcl. It should be a directory
    you have write permissions on. My suggestion would be to use
    something like `$HOME/.local/Tcl`.

1. Go to the `unix` subdirectory of the unpacked Tcl directory, and run
    the `configure` script using the `--prefix` option:

    ``` shell
    cd tcl8.5.15/unix
    ./configure --prefix=$HOME/.local/Tcl
    ```

    If you're building Tcl and environment modules on Mac, you should
    run `configure` in the `tcl8.5.15/macosx` directory instead.

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

**All done!** Now you are ready to build the environment modules
package, which requires Tcl.

## Environment Modules

1. Download the latest source tarball for the environment modules tools
    from <https://modules.sourceforge.net>. At the time of writing, the
    latest available version is 3.2.10 which can be downloaded [from
    here](https://prdownloads.sourceforge.net/modules/modules-3.2.10.tar.gz).

1. Unpack the downloaded source tarball:

    ``` shell
    tar xfvz modules-3.2.10.tar.gz
    ```

1. Configure the build, again use `--prefix` to specify where to
    install the environment modules tool in the end. If you needed to
    install Tcl by hand as outlined in the previous section, you'll also
    need to specify where it was installed using the `--with-tcl`
    option:

    ``` shell
    cd modules-3.2.10
    ./configure --prefix=$HOME/.local/environment-modules --with-tcl=$HOME/.local/Tcl/lib
    ```

1. Build with `make`, consider parallel build if your system is recent
    enough:

    ``` shell
    make -j 4
    ```

1. Install:

    ``` shell
    make install
    ```

Alright, now just one more thing...

## Set up your environment

Because you've installed environment modules and Tcl in a non-default
location, you need to make sure your environment is setup up correctly
to use them.

To make a long story short, these are the commands you need to execute:

``` shell
export PATH=$HOME/.local/environment-modules/Modules/3.2.10/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/Tcl/lib:$LD_LIBRARY_PATH
# adjust line below if you're using a shell other than bash, check with 'echo $SHELL'
source $HOME/.local/environment-modules/Modules/3.2.10/init/bash
```

!!! tip
    Add these three lines in your `.bashrc` file, that way they'll
    be executed every time you log in.

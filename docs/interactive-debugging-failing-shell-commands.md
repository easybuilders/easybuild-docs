# Interactive debugging of failing shell commands via `env.sh` and `cmd.sh` scripts

When a build fails, EasyBuild provides a method of entering the shell environment of the build
to help debug the failure.

## Example

In the following demo, `bzip2-1.0.8.eb` is being built on an Ubuntu 25.04 (Plucky Puffin) system.
This build uses the `SYSTEM` toolchain, which means that the OS default compiler is used - in this case `gcc` v13.3.0.
The failure is because of an incompatibility between the older `binutils` (v2.37, as defined in the easyconfig) and the newer `gcc`.

```sh
$ eb bzip2-1.0.8.eb

```

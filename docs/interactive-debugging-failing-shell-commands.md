# Interactive debugging of failing shell commands via `env.sh` and `cmd.sh` scripts

When a build fails, EasyBuild provides a method of entering an interactive shell environment of the build to help debug the failure.

## Example

In the following demo, `bzip2-1.0.8.eb` is being built on an Ubuntu 25.04 (Plucky Puffin) system.
This build uses the `SYSTEM` toolchain, which means that the OS default compiler is used - in this case `gcc` v13.3.0.
The failure is because of an incompatibility between the older `binutils` (v2.37, as defined in the easyconfig) and the newer `gcc`.

```sh
$ eb bzip2-1.0.8.eb --disable-trace
== Temporary log file in case of crash /tmp/eb-lm7cwh0o/easybuild-1ujtoy7x.log
== processing EasyBuild easyconfig /home/eb/easybuild-easyconfigs/easybuild/easyconfigs/b/bzip2/bzip2-1.0.8.eb
== building and installing bzip2/1.0.8...
== fetching files and verifying checksums...
== creating build dir, resetting environment...
== unpacking...
== patching...
== preparing...
== configuring...
== building...
∙∙∙ Installing bzip2/1.0.8: building (6 out of 17 steps done) ━━━━━━━━━━━━━━╺━━━━━━━━━━━━━━━━━━━━━━━━━ 0:00:02

ERROR: Shell command failed!
    full command              ->  make  -j 12 CC=gcc CFLAGS='-Wall -Winline -O3 -fPIC -g $(BIGFILES)'
    exit code                 ->  2
    called from               ->  'build_step' function in /home/eb/easybuild-easyblocks/easybuild/easyblocks/generic/configuremake.py (line 382)
    working directory         ->  /dev/shm/eb/bzip2/1.0.8/system-system/bzip2-1.0.8
    output (stdout + stderr)  ->  /tmp/eb-lm7cwh0o/run-shell-cmd-output/make-f4_mwpk1/out.txt
    interactive shell script  ->  /tmp/eb-lm7cwh0o/run-shell-cmd-output/make-f4_mwpk1/cmd.sh

== ... (took 2 secs)
== FAILED: Installation ended unsuccessfully: shell command 'make ...' failed with exit code 2 in build step for bzip2-1.0.8.eb (took 2 secs)
== Results of the build can be found in the log file(s) /tmp/eb-lm7cwh0o/easybuild-bzip2-1.0.8-20250811.134024.IRIIQ.log
== Summary:
   * [FAILED]  bzip2/1.0.8

ERROR: Installation of bzip2-1.0.8.eb failed: "shell command 'make ...' failed with exit code 2 in build step for bzip2-1.0.8.eb
```

In the output of the failed build we see:

* We see the full command being run when the failure occurred: `full command              ->  make  -j 12 CC=gcc CFLAGS='-Wall -Winline -O3 -fPIC -g $(BIGFILES)'`
* A link to a file containing the output of just the command being run: `output (stdout + stderr)  ->  /tmp/eb-lm7cwh0o/run-shell-cmd-output/make-f4_mwpk1/out.txt`
* A link to the file that allows access to the interactive shell environment to debug the failure: `interactive shell script  ->  /tmp/eb-lm7cwh0o/run-shell-cmd-output/make-f4_mwpk1/cmd.sh`

The interactive shell can be entered by running the script mentioned.
This will place you in an environment where you can debug the failed build:

* The previous command in the shell history (e.g. via arrow-up key) should be the failing command.
* You can also explore the environment, such as checking environment variables or loaded modules.
* You can repeat the last command to see the failure.

```sh
$ source /tmp/eb-lm7cwh0o/run-shell-cmd-output/make-f4_mwpk1/cmd.sh
# Shell for the command: 'make  -j 12 CC=gcc CFLAGS='-Wall -Winline -O3 -fPIC -g $(BIGFILES)''
# Use command history, exit to stop
eb-shell>
```

Once you have finished debugging then exiting the shell will return you to your previous environment.

### `env.sh`

This file will contain the details of your environment:

1. Environment variables that were set.
1. `bash` functions that were available.

This file will also contain the commands required to change to the working directory for the failed command and set the history and `PS1` for the session.

### `cmd.sh`

This file is run to enter the interactive environment.
This will use the `env.sh` file to setup the environment. 

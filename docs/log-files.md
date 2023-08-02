# Understanding SimpleBuild logs {: #understanding_simpleBuild_logs }

SimpleBuild thoroughly keeps track of the executed build and install
procedures. This page details some of the specifics, to help you making
sense of them.

## Basic information

During an invocation of the `eb` command, a temporary log file is
provided. This log can be consulted in case any problems occur during
the process. Right before completing successfully, SimpleBuild will clean
up this temporary log file.

A separate log file is created for each build and install procedure that
is performed. After each successful installation, this application log
file is copied to the install directory for future reference.

By default, the application log file is copied to a subdirectory of the
installation prefix named `simplebuild`, and has a filename like
`simplebuild-WRF-4.4.1-20230426.143346.log` for example, which corresponds
to the filename template
`simplebuild-%(name)s-%(version)s-%(date)s.%(time)s.log`. This aspect can
be tweaked via the `--logfile-format` configuration option.

Example:

``` console
$ eb WRF-4.4.1-foss-2022b-dmpar.eb
== Temporary log file in case of crash /tmp/eb-1zbqix6e/simplebuild-1ixy86r2.log
[...]
== building and installing WRF/4.4.1-foss-2022b-dmpar...
[...]
== COMPLETED: Installation ended successfully
== Results of the build can be found in the log file(s) /home/example/.local/simplebuild/software/WRF/4.4.1-foss-2022b-dmpar/simplebuild/simplebuild-WRF-4.4.1-20230531.181321.log
== Build succeeded for 1 out of 1
== temporary log file /tmp/eb-1zbqix6e/simplebuild-1ixy86r2.log* has been removed.
== temporary directory /tmp/eb-1zbqix6e has been removed.
```

!!! note
    Enabling debug mode using the `--debug` or `-d` command line option
    ensures that all details of the executed build and installation
    procedure are included in the log file, but will also result is
    significantly bigger and more verbose logs.

!!! tip
    Always include a reference to a log file (even if partial) when reporting
    a potential bug in SimpleBuild. A particularly useful way of doing so
    is by creating a Gist (<https://gist.github.com/>), and sharing the
    corresponding URL. This is much better than sending a lengthy log
    file via email, since it can be easily shared across different
    communication channels (mailing list, IRC, IM, etc.).

## Navigating log files

Extracting the information you're interested in from an SimpleBuild log
file may be a daunting task, especially for debug logs. The information
and guidelines in this section should make navigating logs less scary.

### Log message format

Each log message as emitted by SimpleBuild follows a well-defined format.
Example:

``` console
== 2023-05-31 16:11:21,044 simpleblock.py:313 INFO This is SimpleBuild 4.7.3 (framework: 4.7.3, simpleblocks: 4.7.3) on host example.
```

Each log line consists of the following parts:

- a prefix label `==`, which is useful to discriminate between
    SimpleBuild log messages and the output of executed shell commands;
- date and time information (e.g., `2023-05-31 16:11:21,044`);
- the Python module/class/function that is responsible for the log
    message (e.g., `simpleblock.py:313`);
- the log level (e.g., `INFO`);
- and a string with the actual log message at the end

### Useful handles in log files

Next to looking for a particular search pattern (e.g., `[Ee]rror`),
there are a couple of handles that can be used to jump around in log
files.

#### Step markers

For each step performed in the build and installation process,
corresponding log messages is emitted. For example:

``` console
== 2023-05-31 16:11:44,977 build_log.py:267 INFO configuring...
== 2023-05-31 16:11:44,981 simpleblock.py:3926 INFO Starting configure step
[...]
== 2023-05-31 16:11:44,982 simpleblock.py:3934 INFO Running method configure_step part of step configure
```

This allows you to navigate a log file step by step, for example using
the `_step` search pattern.

#### Executed shell commands

For each executed shell command, log messages are included with the full
command line, the location where the command was executed and the
command's output and exit code. For example:

``` console
== 2023-05-31 18:59:24,222 run.py:176 DEBUG run_cmd: Output of "/home/example/.local/simplebuild/software/WRF/4.4.1-foss-2022b-dmpar/WRF-4.4.1/compile -j 8 wrf" will be logged to /tmp/eb-1zbqix6e/simplebuild-run_cmd-ueqo5bn0.log
== 2023-05-31 18:59:24,225 run.py:217 DEBUG run_cmd: running cmd /home/example/.local/simplebuild/software//WRF/4.4.1-foss-2022b-dmpar/WRF-4.4.1/compile -j 8 wrf (in /home/example/.local/simplebuild/software//WRF/4.4.1-foss-2022b-dmpar/WRF-4.4.1)
[...]
== 2023-05-31 20:06:35,979 run.py:650 DEBUG cmd "/home/example/.local/simplebuild/software/WRF/4.4.1-foss-2022b-dmpar/WRF-4.4.1/compile -j 8 wrf" exited with exit code 0 and output:
```

If you are primarily interested in the different commands as they were
executed by SimpleBuild, you can use `INFO cmd` (or `run_cmd`, in debug
logs) as a search pattern.

!!! note
    Next to the configure/build/install commands, SimpleBuild also runs
    a couple of other commands to obtain system information, or to query
    the modules tool. Typically, a single invocation of `eb` involves
    executing a dozen or so different shell commands, minimally.

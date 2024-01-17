# `run_shell_cmd` function

*(for a full overview of changes in EasyBuild v5.0, see [here](overview-of-changes.md))*

In EasyBuild v5.0, a new function named `run_shell_cmd` is introduced to run shell commands.

This function replaces both the `run_cmd` and `run_cmd_qa` functions, which will be deprecated in EasyBuild v5.0.

## Motivation

Over the years `run_cmd` and `run_cmd_qa` accumulated a lot of arguments which sometimes have misleading names.
Moreover they have two different kinds of return values (depending on whether called with `simple=True` or `simple=False`).
So a new command `run_shell_cmd` is introduced to replace both, using more direct and natural arguments, and as a bonus,
better error reporting. In line with `--trace` being set by default, `run_shell_cmd` is now also more verbose by default.

## High-level overview

First of all `run_shell_cmd` has been designed so the defaults can be used for most situations.
In that case the main thing to watch out for is the return code, which changed from a tuple `(output, exit_code)`
to a named tuple with three fields:

- `output`: command output, `stdout`+`stderr` combined if `split_stderr` is disabled, only `stdout` otherwise
- `exit_code`: exit code of command (integer)
- `stderr`: stderr output if `split_stderr` is enabled, `None` otherwise

A typical transition will then change

```python
(out, _) = run_cmd(cmd, log_all=True, simple=False)
```

to

```python
res = run_shell_cmd(cmd)
out = res.output
```

## Use cases

Examples:

- Basic use

  ```python
  cmd = ' '.join([self.cfg['preinstallopts'], install_cmd, self.cfg['installopts']])
  run_shell_cmd(cmd)
  ```

- Get error code for both failure and non-failure of the command, as otherwise `run_shell_cmd` will raise `RunShellCmdError`. Additionally, don't display this command in terminal output:

  ```python
  cmd = "cmake --version"
  res = run_shell_cmd(cmd, hidden=True, fail_on_error=False)
  out = res.output
  ec = res.code
  ```

## Transitioning from `run_cmd` to `run_shell_cmd`

For parameters in general, the following translation table can be used, where the default values are shown:

| run_cmd parameter    |run_shell_cmd parameter| meaning |
| ---------------------|-----------------------|---------|
| `cmd`                | `cmd`                 | command to run |
| `log_all=False`      | (removed)             | always log command output and exit code (now always `True`) |
| `simple=False`       | (removed)             | if `True`, just return `True`/`False` to indicate success (obsolete) |
| `regexp=True`        | (removed)             | regex used to check the output for errors (obsolete) |
| `log_ok=True`        | `fail_on_error=True`  | fail on non-zero exit code |
|                      | `split_error=False`   | split of stderr from stdout output |
| `inp=None`           | `stdin=None`          | the input given to the command via `stdin` |
|                      | `env=None`            | environment to use to run command (if `None`, inherit current process environment) |
| `trace=True`         | `hidden=False`        | don't show command in terminal output with `--trace`, or `--extended-dry-run` / `-x`) |
| `force_in_dry_run=False`| `in_dry_run=False` | also run command in dry run mode |
| `verbose=True`       | `verbose_dry_run=False` | show that command is run in dry run mode (overrules `--hidden`) |
| `path=None`          | `work_dir=None`       | working directory to run command in (current working directory if `None`) |
| `shell=None`         | `use_bash=True`       | execute command through bash shell (`run_cmd` enables this for `None`)|
| `log_output=False`   | `output_file=True`    | collect command output in temporary output file (changed default) |
| `stream_output=None` | `stream_output=None`  | stream command output to stdout (auto-enabled with `--logtostdout` if `None`) |
| `asynchronous=False` | `asynchronous=False`  | run command asynchronously (not yet implemented for `run_shell_cmd`)|
| `with_hooks=True`    | `with_hooks=True`     | trigger pre/post `run_cmd` or `run_shell_cmd` hooks |
|                      | `qa_patterns=None`    | list of 2-tuples with patterns for questions + corresponding answers (not yet implemented for `run_shell_cmd`) |
|                      | `qa_wait_patterns=None`| list of 2-tuples with patterns for non-questions and number of iterations to allow these patterns to match with end out command output (not yet implemented for `run_shell_cmd`)|

## Transitioning from `run_cmd_qa` to `run_shell_cmd`

This is still to be implemented in `run_shell_cmd`.

...

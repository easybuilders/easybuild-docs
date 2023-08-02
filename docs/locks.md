# Locks

## Locks to prevent duplicate installations running at the same time {: #locks }

Simplebuild creates a lock before starting the installation of an simpleconfig file,
to avoid a collision between multiple installations running at the same time.

If an SimpleBuild session tries to install an simpleconfig file when a lock for that installation already exists,
it will be automatically aborted with an error like "`Lock ... already exists, aborting!`".

!!! note
    Locking of installations was implemented in SimpleBuild version 4.2.0 .


### Locking implementation details {: #locks_implementation }

Simplebuild will create a lock when starting an installation if no corresponding lock exists yet,
regardless of whether the installation was requested explicitly or is performed to resolve a dependency.

The name of the lock corresponds to the *full* path of the installation directory, with slashes (`/`) and
dashes (`-`) replaced by underscores (`_`), and with an additional `.lock` added at the end.

Locks are created in the [locks directory][locks_dir].

The lock created by SimpleBuild is an empty directory (rather than a file),
because that can be created more atomically on modern filesystems.

For example, if `OpenFOAM-v2206-foss-2022a.eb` is being installed to `/apps/simplebuild/software`,
an empty directory that serves as a lock for this installation will be created at
`/apps/simplebuild/software/.locks/_apps_simplebuild_software_OpenFOAM_7_foss_2019b.lock`
(assuming the default [locks directory][locks_dir] is used).

A lock is automatically removed by Simplebuild when the installation ends, regardless of whether the installation
was successful or not. Therefore, new installations of the same simpleconfig will be aborted in case of:

* another installation for the same simpleconfig is in progress;
* a previous installation of the same simpleconfig was abruptly interrupted;


### Removing locks {: #locks_removing }

If a previous installation was abruptly interrupted and a lock was left in place,
it can be easily removed using the `rmdir` command (since the lock is actually an empty directory).


### Configuration options related to installation locks {: #locks_configuration_options }

The behaviour of the locking mechanism in Simplebuild can be tuned with the following configuration options:

#### Ignoring locks {: #locks_ignore }

*(`--ignore-locks`)*

Using the `--ignore-locks` configuration option, you can instruct SimpleBuild to ignore any existing locks.
Locks that exist are left untouched, even if the installation completes successfully.

**Use this with caution, since installations may be (partially) overwritten if another SimpleBuild session is also
performing those installations!**


#### Waiting for locks to be removed {: #locks_wait }

*(`--wait-on-lock-interval`)*

Wait interval (in seconds) to use when waiting for existing lock to be removed

*(`--wait-on-lock-limit`)*

Maximum amount of time (in seconds) to wait until lock is released (0 means no waiting at all, exit with error;
-1 means no waiting limit, keep waiting).

*(`--wait-on-lock <secs>`)* (DEPRECATED)

Using the `--wait-on-lock` configuration option, you can change how SimpleBuild deals with existing locks, by specifying
how frequently SimpleBuild should check whether an existing lock was removed. By specifying a non-zero value `secs`, you
can indicate how many seconds SimpleBuild should wait before checking again whether the lock is still in place.

!!! warning
    The `--wait-on-lock` configuration option is deprecated, please use `--wait-on-lock-interval` and `--wait-on-lock-limit` instead!

!!! note
    If the lock is never removed, the SimpleBuild session will never terminate; it will keep checking every `S` seconds whether the lock is still in place.

By default, SimpleBuild will *abort* the installation with an error like "`Lock ... already exists, aborting!`"
if a corresponding lock already exists.


### Locks directory {: #locks_dir }

If desired, an alternate location where locks should be created and checked for can be specified via the `--locks-dir` configuration option.

!!! note
    Keep in mind that a path on a *shared* filesystem should be used, to ensure that active SimpleBuild sessions running on different systems use the same locks directory.

By default, locks are created in a hidden subdirectory `.locks` in the top-level `software` installation directory; that is, the `software` subdirectory of the `installpath` configuration setting of the active SimpleBuild session.


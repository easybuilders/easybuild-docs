# Backing up of existing modules {: #backup_modules }

While regenerating existing module files, you may want to preserve the
existing module files to compare and assess that the changes in the
newly generated module file match expectations.

Backing up of existing modules can be enabled with `--backup-modules`.

Backups are stored in the same directory as where the module file was
located, and the files are given an additional extension of the form
`.bak_<year><month><day><hour><min><sec>`.

- With module files in Tcl syntax, the backup module file is hidden by
  adding a leading dot to the filename; this is done to avoid that it
  is displayed as a normal module in `module avail`.
- With module files in Lua syntax, the backup module file is not made
  hidden (unless Lmod 6.x is used), since the additional `.bak_*`
  extension prevents from picking it up as a valid module file; only
  files ending in `.lua` are considered to be module files by Lmod 7+.

The location of the backed up module file will be printed, as well as a
"unified diff" comparison (very similar to what `diff -u` produces)
between the backed up module file and the newly generated module file
(or a message mentioning that no differences were found).

## Disabling automatic backup of modules {: #backup_modules_disable }

When `--skip` or `--module-only` is used, backing up of existing modules
is enabled automatically.

This can be disabled with `--disable-backup-modules`.

## Example {: #backup_modules_example }

Suppose existing modules in both Tcl & Lua syntax are present
(`bzip2/1.0.6`).

Both these module files are missing an update statement for `$PATH`
because the `/bin` subdirectory was missing in the installation, for the
purpose of this example:

``` console
$ ls -la $EASYBUILD_PREFIX/modules/all/bzip2
drwxrwsr-x  2 example example 4096 May  9 09:12 .
drwxrwsr-x 17 example example 4096 May  9 09:12 ..
-rw-rw-r--  1 example example 1637 May  9 09:12 1.0.8-GCCcore-12.2.0.lua
```

Using `--force` and `--backup-modules`, we can reinstall the
`bzip2/1.0.6` modules and get a clear view on what has changed.

To reinstall the `bzip2/1.0.6` module in Lua syntax while retaining a
backup of the existing module:

``` console
$ eb bzip2-1.0.8-GCCcore-12.2.0.eb --module-syntax=Lua --force --backup-modules
...
== creating build dir, resetting environment...
== backup of existing module file stored at /example/modules/all/bzip2/1.0.8-GCCcore-12.2.0.lua.bak_20230509091972_3578923
...
== creating module...
  >> generating module file @ /example/modules/all/bzip2/1.0.8-GCCcore-12.2.0.lua
== comparing module file with backup /example/modules/all/bzip2/1.0.8-GCCcore-12.2.0.lua.bak_20230509091972_3578923; diff is:
--- /example/modules/all/bzip2/1.0.8-GCCcore-12.2.0.lua.bak_20230509091972_3578923
+++ /example/modules/all/bzip2/1.0.8-GCCcore-12.2.0.lua
@@ -25,9 +25,10 @@
 prepend_path("LD_LIBRARY_PATH", pathJoin(root, "lib"))
 prepend_path("LIBRARY_PATH", pathJoin(root, "lib"))
 prepend_path("MANPATH", pathJoin(root, "man"))
+prepend_path("PATH", pathJoin(root, "bin"))
 setenv("EBROOTBZIP2", root)
 setenv("EBVERSIONBZIP2", "1.0.8")
 setenv("EBDEVELBZIP2", pathJoin(root, "easybuild/bzip2-1.0.8-GCCcore-12.2.0-easybuild-devel"))

...
```

Equivalently, we can reinstall the module in Tcl syntax using:

``` shell
eb bzip2-1.0.6.eb --module-syntax=Tcl --force --backup-modules
```

Afterwards, both the newly generated modules and the backups are in
place:

``` console
$ ls -la $EASYBUILD_PREFIX/modules/all/bzip2
total 4
drwxrwsr-x  2 example example 4096 May  9 09:29 .
drwxrwsr-x 17 example example 4096 May  9 09:12 ..
-rw-rw-r--  1 example example 1559 May  9 09:29 1.0.8-GCCcore-12.2.0
-rw-rw-r--  1 example example 1637 May  9 09:12 1.0.8-GCCcore-12.2.0.bak_20230509091754_3383740
-rw-rw-r--  1 example example 1681 May  9 09:18 1.0.8-GCCcore-12.2.0.lua
-rw-rw-r--  1 example example 1637 May  9 09:12 1.0.8-GCCcore-12.2.0.lua.bak_20230509091972_3578923
```

Cleaning up the backup module files can be done with the following
command (for example):

``` console
$ find $EASYBUILD_PREFIX/modules/all/bzip2 -name '*.bak*' | xargs rm -v
removed 'example/modules/all/bzip2/1.0.8-GCCcore-12.2.0.bak_20230509091754_3383740'
removed 'example/modules/all/bzip2/1.0.8-GCCcore-12.2.0.lua.bak_20230509091972_3578923'
```

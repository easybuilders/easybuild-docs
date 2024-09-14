# Patch files

## What are patch files (patches)?

A patch file, or just *patch* for short, is a text file that can be used to modify an existing software sources.
They are often used to fix bugs, but can also be used to improve the usability or performance.

## Including patches in an easyconfig file

Patches can be provided via the `patches` easyconfig parameter (list). A
patch can be defined as:

- a `string`,
- a `tuple` of 2 elements, or
- a `dict`

The most straight-forward use-case is `string`, which contains the name
of the patch file (and must have `.patch` extension).

A `tuple` adds the possibility to specify the subdirectory in which the patch should be applied.
This is mostly needed if a patch file adds new files or it is generally
not possible to determine the appropriate directory to apply the patch in.
The first element of this tuple is
the name of patch file. The second element is either the *patch level* (as an integer value)
which is used in the patch command (`patch -p<level>`), or a directory relative to the unpacked source directory.

!!! note
    `tuple` also has a special use case if the patch file has any other extension than `.patch`.
    In this case, the first tuple element is the name of a file which should be
    copied to the unpacked source directory, and the second element is
    the target path, where the files should be copied to (relative to
    the unpacked source directory). See below for an example of this use case.

A `dict` value can be used pass additional arguments to the `patch` command.
For example, the `--binary` flag may be needed for patch files
with CRLF endings. For a `dict` value the `filename` key is required.
`level` and `opts` are supported (optional) keys.

!!! note
    Specifying only `filename` in `dict` is the same as using a plain `string` definition.
    Specifying `filename` and `level` is same as using a `tuple`
    definition.

Example:

```python
patches = [
  # a simple patch file
  'example.patch',

  # when creating only new files by patch file, you need to specify the level:
  ('example-add-files.patch', 1),

  # apply the patch in a (sub-)subdirectory inside the source tree
  ('example-subfolder.patch', 'src/subfolder'),

  # copy file to target_path folder
  ('Makefile', 'path/to/target/'),

  # specify patch file and optionally level and opts for patch command
  {'filename': 'example.patch', 'level': 1, 'opts': '--binary'}
]
```

## Creating a patch file

To create a patch file to use with EasyBuild, follow the steps below.

### 1) Copy unpacked sources

Start by copying the unpacked sources, before making any changes, so we can determine which changes were made:

```bash
cp -a unpacked_sources unpacked_sources.orig

```

### 2) Make necessary changes

Make the necessary changes in the `unpacked_sources` directory.

### 3) Create patch file

Create the patch file by comparing the original sources with the modified sources using the `diff` command:

```bash
diff -ruN unpacked_sources.orig unpacked_sources > example.patch
```

The `-ruN` options here are important:

- `r` instructs the `diff` command to look for changes between the specified directories *recursively*;
- `u` indicates that `diff` should produce a *unified* diff as output;
- `N` indicates that files only found in one directory should be treated as new files;

### 4) Add description, author, reference

Please also add a description on top of the patch file, along with the author and/or reference to the source of the patch.

For example:

```diff
example of a patch description
author: John Doe (Earth University)
diff -ru unpacked_sources.orig/example.c unpacked_sources/example.c
--- unpacked_sources.orig/example.c	2011-08-05 05:08:07.000000000 +0200
+++ unpacked_sources/example.c	2024-03-14 12:31:16.218067000 +0100
...
```

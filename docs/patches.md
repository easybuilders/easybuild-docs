# Patches

## What are Patches?

A patch is a file that can be used to modify an existing software sources. This is ofter used to fix bugs, but can also be usedd to improve the usibility or performance. 

## Including patches in the EasyBuild EasyConfigs

Patches can be provided via the `patches` easyconfig parameter (list). A
patch can be defined as:

- a `string`,
- a `tuple` of 2 elements, or
- a `dict`

The most straight-forward use-case is `string`, which contains the name
of the patch file (and must have `.patch` extension).

A `tuple` adds the possibility to specify where patch should be applied.
This is mostly needed if a patch file adds new files or it is generally
not possible to determine the starting directory. The first element is
the patch file and the second is either the patch level (as an integer)
which is used in the patch command (`patch -p<n>`) or a directory
relative to the unpacked source dir.

!!! note
    `tuple` also has a special use case if the patch file has any other extension than `.patch`.
    In this case, the first tuple argument is a file which should be
    copied to the unpacked source dir and the second tuple argument is
    the target path, where the files should be copied to (relative to
    the unpacked source dir). See below for an example of this use case.

A `dict` adds the ability to pass the `patch` command additional
arguments. For example, the `--binary` flag is needed to patch files
with CRLF endings. The `dict` has a required `filename` key, with
`level` and `opts` being optional ones.

!!! note
    Specifying only `filename` in `dict` is the same as using a plain `string` definition.
    Specifying `filename` and `level` is same as using a `tuple`
    definition.

Example:

``` python
patches = [
  # a simple patch file
  'name-versions-fix.patch',

  # when creating only new files by patch file, you need to specify the level:
  ('name-versions-fix.patch', 1),

  # apply the patch in a (sub-)subdirectory inside the source tree
  ('name-versions-fix.patch', 'src/subfolder'),

  # copy file to target_path folder
  ('Makefile', 'target_path'),

  # specify patch file and optionally level and opts for patch command
  {'filename': 'name-versions-fix.patch', 'level': 1, 'opts': '-l'}
]
```

## Creating a patch file

Get the sources which you would like to patch. And create a copy to be able to create a diff file.

``` bash
cp -a <unpacked_sources> <unpacked_sources>.orig

```

Than you can make the necessary changes to the sources in the `<unpacked_sources>` that are not marked with the `.orig` extension. Once you have made all the updates to the sources you can create the `.patch` file with `diff`.

``` bash
diff -ruN <unpacked_sources>.orig <unpacked_sources> > <software_name>-<version>_<short_description>.patch
```

Please also add a description on top of the patch file and the author or source of the patch.

For example:

```
minimus2 needs delta-filter and show-coords but these were not set correctly like NUCMER
author: Lara Peeters (HPC-UGent)
diff -ru amos-3.1.0.orig/src/Pipeline/Makefile.in amos-3.1.0/src/Pipeline/Makefile.in
--- amos-3.1.0.orig/src/Pipeline/Makefile.in	2011-08-05 05:08:07.000000000 +0200
+++ amos-3.1.0/src/Pipeline/Makefile.in	2024-03-14 12:31:16.218067000 +0100
@@ -477,7 +477,8 @@
```

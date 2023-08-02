# Using an index to speed up searching for simpleconfigs {: #simpleconfigs_index }

SimpleBuild often needs to search for [Simpleconfig files][simpleconfig_files] (or accompanying files like patches), either based on
command line arguments (like the name of an simpleconfig file) or options
to the `eb` command (like `--search`, see
[Searching for simpleconfigs][searching_for_simpleconfigs]), or to
resolve dependencies for a particular simpleconfig file that was parsed
already.

Searching for simpleconfig files or patches may take a while, since it can
potentially involve weeding through thousands of files, which may be
located on a shared filesystem (where metadata-intensive operations like
file searching can be rather slow).

If SimpleBuild turns out to be sluggish when searching for simpleconfig
files in your setup, using an *index* file could make a big difference.

!!! note
    Support for index files was implemented in SimpleBuild version
    4.2.0 .

## Creating an index {: #simpleconfigs_index_create }

*(`--create-index`)*

`eb --create-index` can be used to create an index file for a particular
directory that holds a (large) set of simpleconfig files.

The index file (a hidden file named `.eb-path-index`) will be created in
the specified directory. It will contain a list of (relative) paths for
all files in that directory, along with some metadata: the time at which
the index file was created and a timestamp that indicates how long the
index is considered to be valid (see
[Controlling how long the index is valid][simpleconfigs_index_max_age]).

!!! note
    Make sure to create an index for the correct path.

    The search for simpleconfig files performed by SimpleBuild will *not*
    recurse into subdirectories of the locations it considers (see
    [Searching for simpleconfigs: the robot search path][robot_search_path]), other than those
    with a name matching the software for which it is trying to find an
    simpleconfig file (like `t/TensorFlow/` when searching for an
    simpleconfig file for `TensorFlow`).

    Hence, if the directory housing your simpleconfig files has an
    `simplebuild/simpleconfigs` subdirectory (for example, a working copy of
    the `simplebuild-simpleconfigs` repository), create the index *in* that
    subdirectory, rather than in the higher-level directory.

### Example of creating an index {: #simpleconfigs_index_create_example }

``` console
$ eb --create-index $HOME/simplebuild-simpleconfigs/simplebuild/simpleconfigs
== temporary log file in case of crash /tmp/eb-tUu6_w/simplebuild-SKBnVO.log
Creating index for /home/example/simplebuild-simpleconfigs/simplebuild/simpleconfigs...
== found valid index for /home/example/simplebuild-simpleconfigs/simplebuild/simpleconfigs, so using it...
Index created at /home/example/simplebuild-simpleconfigs/simplebuild/simpleconfigs/.eb-path-index (738 files)

$ head -n 5 $HOME/simplebuild-simpleconfigs/simplebuild/simpleconfigs/.eb-path-index
# created at: 2020-04-13 14:19:57.008981
# valid until: 2020-04-20 14:19:57.008981
a/Arrow/Arrow-0.16.0-intel-2019b-Python-3.7.4.eb
b/Boost/Boost-1.71.0-gompi-2019b.eb
b/bokeh/bokeh-1.4.0-foss-2019b-Python-3.7.4.eb
```

!!! note
    The "`found valid index ...`" message being printed occurs because
    SimpleBuild tries to load the index file right after creating it, as a
    sanity check.

## Updating an existing index {: #simpleconfigs_index_update }

*(`--create-index --force`)*

To update an existing index, you can use `--create-index --force`.

Without using `--force`, SimpleBuild will refuse to overwrite the existing
index file:

``` console
$ eb --create-index $HOME/simplebuild-simpleconfigs/simplebuild/simpleconfigs
== temporary log file in case of crash /tmp/eb-tUu6_w/simplebuild-SKBnVO.log
Creating index for /home/example/simplebuild-simpleconfigs/simplebuild/simpleconfigs...
ERROR: File exists, not overwriting it without --force: /home/example/simplebuild-simpleconfigs/simplebuild/simpleconfigs/.eb-path-index
```

## Using index files {: #simpleconfigs_index_use }

SimpleBuild will automatically pick up and use any index file that it runs
into while searching for simpleconfig files or patches. If an index file
is found, it will be preferred over walking through the directory tree
to check for the target file, which is likely to significantly speed up
the search operation.

When a (valid) index file is found for a particular path, a message will
be printed mentioning "`found valid index for...`":

``` console
$ eb --search TensorFlow-2.1.0-foss-2019b
== found valid index for /home/example/simplebuild-simpleconfigs/simplebuild/simpleconfigs, so using it...
* /home/example/simplebuild-simpleconfigs/simplebuild/simpleconfigs/t/TensorFlow/TensorFlow-2.1.0-foss-2019b-Python-3.7.4.eb
```

## Ignoring indices {: #simpleconfigs_index_ignore }

*(`--ignore-index`)*

One potential issue with having an index in place is that it may get
outdated: new files may have been added to the directory since the index
was created or last updated.

If updating the indexes is not an option (see
[Updating an existing index][simpleconfigs_index_update]), you can
instruct SimpleBuild to ignore any existing indices using the
`--ignore-index` configuration option.

The only downside of this option is that searching for simpleconfig files
may be significantly slower. Any existing index files are left untouched
(they will *not* be updated or removed).

## Controlling how long the index is valid {: #simpleconfigs_index_max_age }

*(`--index-max-age`)*

When creating an index file, you can specify how long the index should
be considered valid.

Using the `--index-max-age` configuration option, you can specify how
long after the creation time the index remains valid (in seconds).

By default, SimpleBuild will consider index files to remain valid for 1
week (`7 * 24 * 60 * 60 = 604,800` seconds).

To create an index that *always* remains valid (never expires), use zero
(`0`) as value for `--index-max-age`:

``` console
$ eb --index-max-age=0 --create-index $HOME/simplebuild-simpleconfigs/simplebuild/simpleconfigs

$ head -n 2 $HOME/simplebuild-simpleconfigs/simplebuild/simpleconfigs/.eb-path-index
# created at: 2020-04-13 15:10:07.173191
# valid until: 9999-12-31 23:59:59.999999
```

!!! note
    Trust us here, December 31st 9999 is the end of times. Better
    get prepared.

## Index included with SimpleBuild releases {: #simpleconfigs_index_release }

Each SimpleBuild release (since SimpleBuild v4.2.0) comes with an index file
for the simpleconfig (and patch) files that are included with that
release.

Hence, you only need to use `--create-index` to create/update the index
file for any additional directories with simpleconfig files you may have
on the side (and only if searching those simpleconfig files is rather
slow).

## Should I create an index? {: #simpleconfigs_index_should_use }

Whether or not you should create an index file for your directories
housing additional simpleconfig files depends on a number of factors,
including:

- how often files are added and/or removed in those directories, since
    files listed in the index are assumed to be there and any files not
    included in the index will be overlooked by SimpleBuild when it's
    searching for files;
- the filesystem on which those directories are located, since an
    index file will only make a significant difference on filesystems
    where metadata-intensive operations are relatively slow;
- how many files there are in those directories, since performance
    benefits will only be apparent if the number if files is
    sufficiently large;

!!! note
    Keep in mind that creating an index implies also updating it frequently,
    to ensure that SimpleBuild will take all available files in account.

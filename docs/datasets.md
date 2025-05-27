EasyBuild v5.1.0 adds support for installing datasets as modules.

Sam Moors (VUB) gave a talk about this idea at EUM'24 (see [slides](https://users.ugent.be/~kehoste/eum24/019_eum24_datasets.pdf) + [recording](https://www.youtube.com/watch?v=13q_aKDDv9k&list=PLhnGtSmEGEQild9FmlP8Qmz9Csc_gOJKF&index=20&pp=gAQBiAQB)).

## `data_sources` easyconfig parameter

A dedicated easyconfig parameter `data_sources` was introduced for this:

```python
source_urls = ["https://example.com/data/"]
data_sources = ["example-data-%(version)s.tar.gz"]
checksums = ["d3adb33fc0ff33d3adb33fc0ff33d3adb33fc0ff33d3adb33fc0ff33d3adb33f"]
```

## Configuration settings for datasets

Additional EasyBuild configuration settings were introduced, to control:

* Location where the "source" files for these datasets are stored (`sourcepath-data`) - if left unspecified, `sourcepath` location is used;
* Path where the datasets are installed (`installpath-data`) - if left unspecified, `installpath` is combined with `subdir-data` configuration setting (which is `'data'` by default);

## `Dataset` generic easyblock

A new [generic easyblock `Dataset`](https://github.com/easybuilders/easybuild-easyblocks/blob/main/easybuild/easyblocks/generic/dataset.py) was added that can be used in easyconfig files to install datasets, see for example the [`RFdiffusion-models-1.1.0.eb`](https://github.com/easybuilders/easybuild-easyconfigs/blob/main/easybuild/easyconfigs/r/RFdiffusion-models/RFdiffusion-models-1.1.0.eb) easyconfig file.

## Installing datasets

Installing datasets works exactly the same way as installed software:

```shell
# specify location for "sources" for data installations
$ export EASYBUILD_SOURCEPATH_DATA=/sources/data

# use /data for data installations
$ export EASYBUILD_INSTALLPATH_DATA=/data

# installed example dataset easyconfig
$ eb RFdiffusion-models-1.1.0.eb
...
$ module load RFdiffusion-models/1.1.0
```

Since a module file is generated for the installed dataset, it can be used as a dependency for a software installation by including it in the `dependencies` easyconfig parameter in the corresponding easyconfig file.

## Special treatment of datasets

EasyBuild provides separate configuration settings for the location of data installations and the source files for datasets, for two reasons:

- Datasets can be large, and you may want to install them on a different filesystem than software installations;
- Datasets are often exactly the same across different software versions, and so the "source" files for them should be only downloaded and stored once, even if their filenames are different;

Because of the latter, EasyBuild will store the "source" files for datasets in an object storage hierarchy, where the actual location of the file is determined by the SHA256 checksum of the file. For example:

```
/sources/data/RFdiffusion-models/object_storage/7/6/e/4/e/2/6/0/76e4e260aefee3b582bd76b77ab95d2592e64f00c51bf344968ab9239f3250bc
```

Symlinks are created to have a version-specific path to the dataset, without storing it multiple times on disk:

```
$ ls -l /sources/data/RFdiffusion-models/1.1.0/Complex_base_ckpt.pt
lrwxrwxrwx 1 vsc40023 vsc40023 98 May 27 16:46 /sources/data/RFdiffusion-models/1.1.0/Complex_base_ckpt.pt -> ../object_storage/7/6/e/4/e/2/6/0/76e4e260aefee3b582bd76b77ab95d2592e64f00c51bf344968ab9239f3250bc
```

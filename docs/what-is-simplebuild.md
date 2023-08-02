# What is SimpleBuild? {: #what_is_simplebuild }

SimpleBuild is a software build and installation framework that allows you to manage (scientific) software on High 
Performance Computing (HPC) systems in an efficient way. It is motivated by the need for a tool that combines the
following features: 

* a **flexible framework** for building/installing (scientific) software
* fully **automates** software builds
* divert from the standard ``configure`` / ``make`` / ``make install`` with custom procedures
* allows for easily **reproducing** previous builds
* keep the software build recipes/specifications **simple and human-readable**
* supports **co-existence of versions/builds** via dedicated installation prefix and module files
* enables **sharing** with the HPC community (win-win situation)
* automagic **dependency resolution**
* **retain logs** for traceability of the build processes

Some key features of SimpleBuild:

* build & install (scientific) software **fully autonomously**

  * also interactive installers, code patching, generating module file, ...

* easily [configurable](configuration.md): configuration files / environment variables / command line options

  * including aspects like module naming scheme

* thorough logging and archiving (see [Log files](log-files.md))

  * entire build process is logged thoroughly, logs are stored in install directory;
  * simpleconfig file used for build is archived (install directory + file/svn/git repo) 

* automatic **dependency resolution** (see [`--robot`][use_robot])

  * build entire software stack with a single command, using ``--robot``

* building software in **parallel**
* robust and thoroughly tested code base, fully unit-tested before each release
* thriving, growing **community**

Take a look at our HUST'14 workshop paper
*Modern Scientific Software Management Using SimpleBuild and Lmod*
([PDF](https://simplebuilders.github.io/simplebuild/files/hust14_paper.pdf)),
and use that as a reference in case you present academic work mentioning SimpleBuild.

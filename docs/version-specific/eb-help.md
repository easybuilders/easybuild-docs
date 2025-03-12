# EasyBuild configuration options {: #basic_usage_help }

*(corresponds with output of* ``eb --help`` *)*

## Usage

``eb [options] easyconfig [...]``

## Description

Builds software based on easyconfig (or parse a directory).
Provide one or more easyconfigs or directories, use -H or --help more information.

## Help options

Option flag                               |Option description
------------------------------------------|--------------------------------------
``--version``                             |show program's version number and exit
``-h, --shorthelp``                       |show short help message and exit
``-H OUTPUT_FORMAT, --help=OUTPUT_FORMAT``|show full help message and exit
``--confighelp``                          |show help as annotated configfile

## Debug and logging options (configfile section MAIN)

Option flag    |Option description
---------------|----------------------------------------------
``-d, --debug``|Enable debug log mode (default: False)
``--info``     |Enable info log mode (default: False)
``--quiet``    |Enable quiet/warning log mode (default: False)

## Configfile options

Option flag                              |Option description
-----------------------------------------|----------------------------------------------------------
``--configfiles=CONFIGFILES``            |Parse (additional) configfiles (type comma-separated list)
``--ignoreconfigfiles=IGNORECONFIGFILES``|Ignore configfiles (type comma-separated list)

## Basic options

Option flag                                |Option description
-------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
``--dry-run``                              |Print build overview incl. dependencies (full paths) (default: False)
``-D, --dry-run-short``                    |Print build overview incl. dependencies (short paths) (default: False)
``-x, --extended-dry-run``                 |Print build environment and (expected) build procedure that will be performed (default: False)
``--extended-dry-run-ignore-errors``       |Ignore errors that occur during dry run (default: True; disable with --disable-extended-dry-run-ignore-errors)
``-f, --force``                            |Force to rebuild software even if it's already installed (i.e. if it can be found as module), and skipping check for OS dependencies (default: False)
``--ignore-locks``                         |Ignore locks that prevent two identical installations running in parallel (default: False)
``--job``                                  |Submit the build as a job (default: False)
``--locks-dir=LOCKS-DIR``                  |Directory to store lock files (should be on a shared filesystem); None implies .locks subdirectory of software installation directory
``-l, --logtostdout``                      |Redirect main log to stdout (default: False)
``-M, --missing-modules``                  |Print list of missing modules for dependencies of specified easyconfigs (default: False)
``-b BLOCKS, --only-blocks=BLOCKS``        |Only build listed blocks (type comma-separated list)
``--rebuild``                              |Rebuild software, even if module already exists (don't skip OS dependencies checks) (default: False)
``-r [PATH[:PATH]], --robot=[PATH[:PATH]]``|Enable dependency resolution, optionally consider additional paths to search for easyconfigs (type pathsep-separated list)
``--robot-paths=PATH[:PATH]``              |Additional paths to consider by robot for easyconfigs (--robot paths get priority) (type pathsep-separated list; default: /home/example/work/easybuild-easyconfigs/easybuild/easyconfigs)
``--search-paths=PATH[:PATH]``             |Additional locations to consider in --search (next to --robot and --robot-paths paths) (type pathsep-separated list)
``-k, --skip``                             |Skip existing software (useful for installing additional packages) (default: False)
``-s STOP, --stop=STOP``                   |Stop the installation after certain step (type choice; default: source) (choices: fetch, ready, source, patch, prepare, configure, build, test, install, extensions, postiter, postproc, sanitycheck, cleanup, module, permissions, package, testcases)
``--strict=STRICT``                        |Set strictness level (type choice; default: warn) (choices: ignore, warn, error)

## Configuration options

Option flag                                                      |Option description
-----------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
``--avail-module-naming-schemes``                                |Show all supported module naming schemes (default: False)
``--avail-modules-tools``                                        |Show all supported module tools (default: False)
``--avail-repositories``                                         |Show all repository types (incl. non-usable) (default: False)
``--buildpath=BUILDPATH``                                        |Temporary build path (default: /home/example/.local/easybuild/build)
``--containerpath=CONTAINERPATH``                                |Location where container recipe & image will be stored (default: /home/example/.local/easybuild/containers)
``--envvars-user-modules=ENVVARS-USER-MODULES``                  |List of environment variables that hold the base paths for which user-specific modules will be installed relative to (type comma-separated list; default: HOME)
``--external-modules-metadata=EXTERNAL-MODULES-METADATA``        |List of (glob patterns for) paths to files specifying metadata for external modules (INI format) (type comma-separated list)
``--hooks=HOOKS``                                                |Location of Python module with hook implementations (type str)
``--ignore-dirs=IGNORE-DIRS``                                    |Directory names to ignore when searching for files/dirs (type comma-separated list; default: .git,.svn)
``--include-easyblocks=INCLUDE-EASYBLOCKS``                      |Location(s) of extra or customized easyblocks (type comma-separated list)
``--include-module-naming-schemes=INCLUDE-MODULE-NAMING-SCHEMES``|Location(s) of extra or customized module naming schemes (type comma-separated list)
``--include-toolchains=INCLUDE-TOOLCHAINS``                      |Location(s) of extra or customized toolchains or toolchain components (type comma-separated list)
``--installpath=INSTALLPATH``                                    |Install path for software and modules (default: /home/example/.local/easybuild)
``--installpath-modules=INSTALLPATH-MODULES``                    |Install path for modules (if None, combine --installpath and --subdir-modules)
``--installpath-software=INSTALLPATH-SOFTWARE``                  |Install path for software (if None, combine --installpath and --subdir-software)
``--job-backend=JOB-BACKEND``                                    |Backend to use for submitting jobs (type choice; default: GC3Pie) (choices: GC3Pie, PbsPython, Slurm)
``--logfile-format=DIR,FORMAT``                                  |Directory name and format of the log file (type comma-separated tuple; default: easybuild,easybuild-%(name)s-%(version)s-%(date)s.%(time)s.log)
``--module-depends-on``                                          |Use depends_on (Lmod 7.6.1+) for dependencies in all generated modules (implies recursive unloading of modules). (default: False)
``--module-extensions``                                          |Include 'extensions' statement in generated module file (Lua syntax only) (default: False)
``--module-naming-scheme=MODULE-NAMING-SCHEME``                  |Module naming scheme to use (default: EasyBuildMNS)
``--module-syntax=MODULE-SYNTAX``                                |Syntax to be used for module files (type choice; default: Lua) (choices: Lua, Tcl)
``--moduleclasses=MODULECLASSES``                                |Extend supported module classes (For more info on the default classes, use --show-default-moduleclasses) (type comma-separated list; default: base,ai,astro,bio,cae,chem,compiler,data,debugger,devel,geo,ide,lang,lib,math,mpi,numlib,perf,quantum,phys,system,toolchain,tools,vis)
``--modules-footer=PATH``                                        |Path to file containing footer to be added to all generated module files
``--modules-header=PATH``                                        |Path to file containing header to be added to all generated module files
``--modules-tool=MODULES-TOOL``                                  |Modules tool to use (type choice; default: Lmod) (choices: EnvironmentModules, EnvironmentModulesC, EnvironmentModulesTcl, Lmod)
``--package-naming-scheme=PACKAGE-NAMING-SCHEME``                |Packaging naming scheme choice (type choice; default: EasyBuildPNS) (choices: EasyBuildDebFriendlyPNS, EasyBuildPNS)
``--packagepath=PACKAGEPATH``                                    |The destination path for the packages built by package-tool (default: /home/example/.local/easybuild/packages)
``--prefix=PREFIX``                                              |Change prefix for buildpath, installpath, sourcepath and repositorypath (used prefix for defaults /home/example/.local/easybuild)
``--recursive-module-unload``                                    |Enable generating of modules that unload recursively. (default: False)
``--repository=REPOSITORY``                                      |Repository type, using repositorypath (type choice; default: FileRepository) (choices: FileRepository, GitRepository)
``--repositorypath=REPOSITORYPATH``                              |Repository path, used by repository (is passed as list of arguments to create the repository instance). For more info, use --avail-repositories. (type comma-separated list; default: /home/example/.local/easybuild/ebfiles_repo)
``--sourcepath=SOURCEPATH``                                      |Path(s) to where sources should be downloaded (string, colon-separated) (default: /home/example/.local/easybuild/sources)
``--subdir-modules=SUBDIR-MODULES``                              |Installpath subdir for modules (default: modules)
``--subdir-software=SUBDIR-SOFTWARE``                            |Installpath subdir for software (default: software)
``--subdir-user-modules=SUBDIR-USER-MODULES``                    |Base path of user-specific modules relative to --envvars-user-modules
``--suffix-modules-path=SUFFIX-MODULES-PATH``                    |Suffix for module files install path (default: all)
``--testoutput=TESTOUTPUT``                                      |Path to where a job should place the output (to be set within jobscript)
``--tmp-logdir=TMP-LOGDIR``                                      |Log directory where temporary log files are stored
``--tmpdir=TMPDIR``                                              |Directory to use for temporary storage

## Container options

Option flag                                    |Option description
-----------------------------------------------|----------------------------------------------------------------------------------------------------------------------
``--container-build-image``                    |Build container image (requires sudo privileges!) (default: False)
``--container-config=CONFIG``                  |Configuration for container image (type <class 'str'>)
``--container-image-format=IMAGE-FORMAT``      |Container image format (type choice) (choices: ext3, sandbox, sif, squashfs)
``--container-image-name=IMAGE-NAME``          |Custom name for container image (defaults to name of easyconfig)
``--container-template-recipe=TEMPLATE-RECIPE``|Template recipe for container image (type <class 'str'>)
``--container-tmpdir=TMPDIR``                  |Temporary directory where container image is built
``--container-type=TYPE``                      |Type of container recipe/image to create (type choice; default: singularity) (choices: apptainer, docker, singularity)

## Options for Easyconfigs

Option flag                                            |Option description
-------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
``--create-index=CREATE-INDEX``                        |Create index for files in specified directory
``--fix-deprecated-easyconfigs``                       |Fix use of deprecated functionality in specified easyconfig files. (default: False)
``--ignore-index``                                     |Ignore index when searching for files (default: False)
``--index-max-age=INDEX-MAX-AGE``                      |Maximum age for index before it is considered stale (in seconds) (type <class 'int'>; default: 604800)
``--inject-checksums=INJECT-CHECKSUMS``                |Inject checksums of specified type for sources/patches into easyconfig file(s) (type choice; default: sha256) (choices: adler32, crc32, md5, sha1, sha256, sha512, size)
``--inject-checksums-to-json=INJECT-CHECKSUMS-TO-JSON``|Inject checksums of specified type for sources/patches into checksums.json (type choice; default: sha256) (choices: adler32, crc32, md5, sha1, sha256, sha512, size)
``--local-var-naming-check=LOCAL-VAR-NAMING-CHECK``    |Mode to use when checking whether local variables follow the recommended naming scheme ('log': only log warnings (no printed messages); 'warn': print warnings; 'error': fail with an error) (type choice; default: warn) (choices: error, log, warn)

## GitHub integration options

Option flag                                            |Option description
-------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------
``--add-pr-labels=PR#``                                |Try to add labels to PR based on files changed (type <class 'int'>)
``--check-contrib``                                    |Runs checks to see whether the given easyconfigs are ready to be contributed back (default: False)
``--check-github``                                     |Check status of GitHub integration, and report back (default: False)
``--check-style``                                      |Run a style check on the given easyconfigs (default: False)
``--cleanup-easyconfigs``                              |Clean up easyconfig files for pull request (default: True; disable with --disable-cleanup-easyconfigs)
``--close-pr=PR#``                                     |Close pull request (type <class 'int'>)
``--close-pr-msg=CLOSE-PR-MSG``                        |Custom close message for pull request closed with --close-pr;  (type <class 'str'>)
``--close-pr-reasons=CLOSE-PR-REASONS``                |Close reason for pull request closed with --close-pr; supported values: archived, inactive, obsolete, retest (type <class 'str'>)
``--dump-test-report=DUMP-TEST-REPORT``                |Dump test report to specified path (default: test_report.md)
``--from-commit=commit_SHA``                           |Obtain easyconfigs from specified commit (type str)
``--from-pr=PR#``                                      |Obtain easyconfigs from specified PR (type comma-separated list)
``--git-working-dirs-path=GIT-WORKING-DIRS-PATH``      |Path to Git working directories for EasyBuild repositories (type <class 'str'>)
``--github-org=GITHUB-ORG``                            |GitHub organization (type <class 'str'>)
``--github-user=GITHUB-USER``                          |GitHub username (type <class 'str'>)
``--include-easyblocks-from-commit=commit_SHA``        |Include easyblocks from specified commit (type str)
``--include-easyblocks-from-pr=PR#``                   |Include easyblocks from specified PR (type comma-separated list)
``--install-github-token``                             |Install GitHub token (requires --github-user) (default: False)
``--list-prs=STATE,ORDER,DIRECTION``                   |List pull requests (type <class 'str'>; default: open,created,desc)
``--merge-pr=PR#``                                     |Merge pull request (type <class 'int'>)
``--new-branch-github``                                |Create new branch in GitHub in preparation for a PR (default: False)
``--new-pr``                                           |Open a new pull request (default: False)
``--new-pr-from-branch=NEW-PR-FROM-BRANCH``            |Open a new pull request from branch in GitHub (type <class 'str'>)
``--pr-branch-name=PR-BRANCH-NAME``                    |Branch name to use for new PRs; '<timestamp>_new_pr_<name><version>' if unspecified (type <class 'str'>)
``--pr-commit-msg=PR-COMMIT-MSG``                      |Commit message for new/updated pull request created with --new-pr (type <class 'str'>)
``--pr-descr=PR-DESCR``                                |Description for new pull request created with --new-pr (type <class 'str'>)
``--pr-target-account=PR-TARGET-ACCOUNT``              |Target account for new PRs (type <class 'str'>; default: easybuilders)
``--pr-target-branch=PR-TARGET-BRANCH``                |Target branch for new PRs (type <class 'str'>; default: develop)
``--pr-target-repo=PR-TARGET-REPO``                    |Target repository for new/updating PRs (default: auto-detect based on provided files) (type <class 'str'>)
``--pr-title=PR-TITLE``                                |Title for new pull request created with --new-pr (type <class 'str'>)
``--preview-pr``                                       |Preview a new pull request (default: False)
``--review-pr=PR#``                                    |Review specified pull request (type <class 'int'>)
``--review-pr-filter=REVIEW-PR-FILTER``                |Regex used to filter out easyconfigs to diff against in --review-pr
``--review-pr-max=REVIEW-PR-MAX``                      |Maximum number of easyconfigs to diff against in --review-pr (type <class 'int'>)
``--sync-branch-with-develop=SYNC-BRANCH-WITH-DEVELOP``|Sync branch with current 'develop' branch (type <class 'str'>)
``--sync-pr-with-develop=PR#``                         |Sync pull request with current 'develop' branch (type <class 'int'>)
``--test-report-env-filter=TEST-REPORT-ENV-FILTER``    |Regex used to filter out variables in environment dump of test report
``--update-branch-github=UPDATE-BRANCH-GITHUB``        |Update specified branch in GitHub (type <class 'str'>)
``--update-pr=PR#``                                    |Update an existing pull request (type <class 'int'>)
``-u, --upload-test-report``                           |Upload full test report as a gist on GitHub (default: False)

## Informative options

Option flag                                          |Option description
-----------------------------------------------------|------------------------------------------------------------------------------------------------
``--avail-cfgfile-constants``                        |Show all constants that can be used in configuration files (default: False)
``--avail-easyconfig-constants``                     |Show all constants that can be used in easyconfigs (default: False)
``--avail-easyconfig-licenses``                      |Show all license constants that can be used in easyconfigs (default: False)
``-a, --avail-easyconfig-params``                    |Show all easyconfig parameters (include easyblock-specific ones by using -e) (default: False)
``--avail-easyconfig-templates``                     |Show all template names and template constants that can be used in easyconfigs. (default: False)
``--avail-hooks``                                    |Show list of known hooks (default: False)
``--avail-toolchain-opts=AVAIL-TOOLCHAIN-OPTS``      |Show options for toolchain (type str)
``--check-conflicts``                                |Check for version conflicts in dependency graphs (default: False)
``--check-eb-deps``                                  |Check presence and version of (required and optional) EasyBuild dependencies (default: False)
``--dep-graph=depgraph.<ext>``                       |Create dependency graph. Output format depends on <ext>, e.g. 'dot', 'png', 'pdf', 'gv'.
``--dump-env-script``                                |Dump source script to set up build environment based on toolchain/dependencies (default: False)
``--easystack=EASYSTACK``                            |Path to easystack file in YAML format, specifying details of a software stack
``--last-log``                                       |Print location to EasyBuild log file of last (failed) session (default: False)
``--list-easyblocks=LIST-EASYBLOCKS``                |Show list of available easyblocks (type choice; default: simple) (choices: simple, detailed)
``--list-installed-software=LIST-INSTALLED-SOFTWARE``|Show list of installed software (type choice; default: simple) (choices: simple, detailed)
``--list-software=LIST-SOFTWARE``                    |Show list of supported software (type choice; default: simple) (choices: simple, detailed)
``--list-toolchains``                                |Show list of known toolchains (default: False)
``--search=REGEX``                                   |Search for easyconfig files in the robot search path, print full paths
``--search-filename=REGEX``                          |Search for easyconfig files in the robot search path, print only filenames
``-S REGEX, --search-short=REGEX``                   |Search for easyconfig files in the robot search path, print short paths
``--show-config``                                    |Show current EasyBuild configuration (only non-default + selected settings) (default: False)
``--show-default-configfiles``                       |Show list of default config files (default: False)
``--show-default-moduleclasses``                     |Show default module classes with description (default: False)
``--show-ec``                                        |Show contents of specified easyconfig(s) (default: False)
``--show-full-config``                               |Show current EasyBuild configuration (all settings) (default: False)
``--show-system-info``                               |Show system information relevant to EasyBuild (default: False)
``--terse``                                          |Terse output (machine-readable) (default: False)

## Options for job backend

Option flag                                |Option description
-------------------------------------------|---------------------------------------------------------------------------------------------------------------------------
``--job-backend-config=BACKEND-CONFIG``    |Configuration file for job backend
``--job-cores=CORES``                      |Number of cores to request per job (type int)
``--job-deps-type=DEPS-TYPE``              |Type of dependency to set between jobs (default depends on job backend) (type choice) (choices: abort_on_error, always_run)
``--job-eb-cmd=EB-CMD``                    |EasyBuild command to use in jobs (type str; default: eb)
``--job-max-jobs=MAX-JOBS``                |Maximum number of concurrent jobs (queued and running, 0 = unlimited) (type int; default: 0)
``--job-max-walltime=MAX-WALLTIME``        |Maximum walltime for jobs (in hours) (type int; default: 24)
``--job-output-dir=OUTPUT-DIR``            |Output directory for jobs (default: current directory) (default: /Volumes/work/easybuild-docs/docs/version-specific)
``--job-polling-interval=POLLING-INTERVAL``|Interval between polls for status of jobs (in seconds) (type <class 'float'>; default: 30.0)
``--job-target-resource=TARGET-RESOURCE``  |Target resource for jobs

## Override options

Option flag                                                              |Option description
-------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
``--accept-eula=ACCEPT-EULA``                                            |Accept EULA for specified software [DEPRECATED, use --accept-eula-for instead!] (type comma-separated list)
``--accept-eula-for=ACCEPT-EULA-FOR``                                    |Accept EULA for specified software (type comma-separated list)
``--add-dummy-to-minimal-toolchains``                                    |Include dummy toolchain in minimal toolchain searches [DEPRECATED, use --add-system-to-minimal-toolchains instead!] (default: False)
``--add-system-to-minimal-toolchains``                                   |Include system toolchain in minimal toolchain searches (default: False)
``--allow-loaded-modules=ALLOW-LOADED-MODULES``                          |List of software names for which to allow loaded modules in initial environment (type comma-separated list; default: EasyBuild)
``--allow-modules-tool-mismatch``                                        |Allow mismatch of modules tool and definition of 'module' function (default: False)
``--allow-use-as-root-and-accept-consequences``                          |Allow using of EasyBuild as root (NOT RECOMMENDED!) (default: False)
``--backup-modules``                                                     |Back up an existing module file, if any. Auto-enabled when using --module-only or --skip
``--backup-patched-files``                                               |Create a backup (*.orig) file when applying a patch (default: False)
``--banned-linked-shared-libs=BANNED-LINKED-SHARED-LIBS``                |Comma-separated list of shared libraries (names, file names, or paths) which are not allowed to be linked in any installed binary/library (type comma-separated list)
``--check-ebroot-env-vars=CHECK-EBROOT-ENV-VARS``                        |Action to take when defined $EBROOT* environment variables are found for which there is no matching loaded module; supported values: error, ignore, unset, warn (default: warn)
``--checksum-priority=CHECKSUM-PRIORITY``                                |When checksums are found in both the EasyConfig and the checksums.json fileDefine which one to use.  (type choice; default: easyconfig) (choices: json, easyconfig)
``--cleanup-builddir``                                                   |Cleanup build dir after successful installation. (default: True; disable with --disable-cleanup-builddir)
``--cleanup-tmpdir``                                                     |Cleanup tmp dir after successful run. (default: True; disable with --disable-cleanup-tmpdir)
``--color=WHEN``                                                         |Colorize output (type choice; default: auto) (choices: auto, always, never)
``--consider-archived-easyconfigs``                                      |Also consider archived easyconfigs (default: False)
``-C, --containerize``                                                   |Generate container recipe/image (default: False)
``--copy-ec``                                                            |Copy specified easyconfig(s) to specified location (default: False)
``--cuda-cache-dir=PATH``                                                |Path to CUDA cache dir to use if enabled. Defaults to a path inside the build dir. (type <class 'str'>)
``--cuda-cache-maxsize=CUDA-CACHE-MAXSIZE``                              |Maximum size of the CUDA cache (in MiB) used for JIT compilation of PTX code. Leave value empty to let EasyBuild choose a value or '0' to disable the cache (type <class 'int'>)
``--cuda-compute-capabilities=CUDA-COMPUTE-CAPABILITIES``                |List of CUDA compute capabilities to use when building GPU software; values should be specified as digits separated by a dot, for example: 3.5,5.0,7.2 (type comma-separated list)
``--debug-lmod``                                                         |Run Lmod modules tool commands in debug module (default: False)
``--default-opt-level=DEFAULT-OPT-LEVEL``                                |Specify default optimisation level (type choice; default: defaultopt) (choices: noopt, lowopt, defaultopt, opt)
``--deprecated=DEPRECATED``                                              |Run pretending to be (future) version, to test removal of deprecated code.
``--detect-loaded-modules=DETECT-LOADED-MODULES``                        |Detect loaded EasyBuild-generated modules, act accordingly; supported values: error, ignore, purge, unload, warn (default: warn)
``--devel``                                                              |Enable including of development log messages (default: False)
``--download-timeout=DOWNLOAD-TIMEOUT``                                  |Timeout for initiating downloads (in seconds) (type <class 'float'>; default: 10)
``--dump-autopep8``                                                      |Reformat easyconfigs using autopep8 when dumping them (default: False)
``-e CLASS, --easyblock=CLASS``                                          |easyblock to use for processing the spec file or dumping the options
``--enforce-checksums``                                                  |Enforce availability of checksums for all sources/patches, so they can be verified (default: False)
``--env-for-shebang=ENV-FOR-SHEBANG``                                    |Define the env command to use when fixing shebangs (default: /usr/bin/env)
``--experimental``                                                       |Allow experimental code (with behaviour that can be changed/removed at any given time). (default: False)
``--extra-modules=EXTRA-MODULES``                                        |List of extra modules to load after setting up the build environment (type comma-separated list)
``--extra-source-urls=URL[|URL]``                                        |Specify URLs to fetch sources from in addition to those in the easyconfig (type |-separated tuple; default: https://sources.easybuild.io)
``--fetch``                                                              |Allow downloading sources ignoring OS and modules tool dependencies, implies --stop=fetch, --ignore-osdeps and ignore modules tool (default: False)
``--filter-deps=FILTER-DEPS``                                            |List of dependencies that you do *not* want to install with EasyBuild, because equivalent OS packages are installed. (e.g. --filter-deps=zlib,ncurses) (type comma-separated list)
``--filter-ecs=FILTER-ECS``                                              |List of easyconfigs (given as glob patterns) to *ignore* when given on command line or auto-selected when building with --from-pr. (e.g. --filter-ecs=*intel*) (type comma-separated list)
``--filter-env-vars=FILTER-ENV-VARS``                                    |List of names of environment variables that should *not* be defined/updated by module files generated by EasyBuild (type comma-separated list)
``--filter-rpath-sanity-libs=FILTER-RPATH-SANITY-LIBS``                  |List of libraries that should be ignored by the RPATH sanity check. I.e. if these libraries are not RPATH-ed, that will be accepted by the RPATH sanity check. Note that you'll need to provide the exact library name, as it is returned by 'ldd', including any version  (type comma-separated list; default: libcuda.so,libcuda.so.1,libnvidia-ml.so,libnvidia-ml.so.1)
``--fixed-installdir-naming-scheme``                                     |Use fixed naming scheme for installation directories (default: True; disable with --disable-fixed-installdir-naming-scheme)
``--force-download=FORCE-DOWNLOAD``                                      |Force re-downloading of sources and/or patches, even if they are available already in source path (type choice; default: sources) (choices: all, patches, sources)
``--generate-devel-module``                                              |Generate a develop module file, implies --force if disabled (default: True; disable with --disable-generate-devel-module)
``--group=GROUP``                                                        |Group to be used for software installations (only verified, not set)
``--group-writable-installdir``                                          |Enable group write permissions on installation directory after installation (default: False)
``--hidden``                                                             |Install 'hidden' module file(s) by prefixing their version with '.' (default: False)
``--hide-deps=HIDE-DEPS``                                                |Comma separated list of dependencies that you want automatically hidden, (e.g. --hide-deps=zlib,ncurses) (type comma-separated list)
``--hide-toolchains=HIDE-TOOLCHAINS``                                    |Comma separated list of toolchains that you want automatically hidden, (e.g. --hide-toolchains=GCCcore) (type comma-separated list)
``--http-header-fields-urlpat=[URLPAT::][HEADER:]FIELDVALUE|FILE``       |Set extra HTTP header FIELD when downloading files from URL PATterns. Use FILE (to hide sensitive values) and newline separated FIELDs in the same format. e.g. "^https://www.example.com::path/to/headers.txt" or "client[A-z0-9]*.example.com:: Authorization: Basic token".
``--ignore-checksums``                                                   |Ignore failing checksum verification (default: False)
``--ignore-osdeps``                                                      |Ignore any listed OS dependencies (default: False)
``--ignore-test-failure``                                                |Ignore a failing test step (default: False)
``--insecure-download``                                                  |Don't check the server certificate against the available certificate authorities. (default: False)
``--install-latest-eb-release``                                          |Install latest known version of easybuild (default: False)
``--lib-lib64-symlink``                                                  |Automatically create symlinks for lib/ pointing to lib64/ if the former is missing (default: True; disable with --disable-lib-lib64-symlink)
``--lib64-fallback-sanity-check``                                        |Fallback in sanity check to lib64/ equivalent for missing libraries (default: True; disable with --disable-lib64-fallback-sanity-check)
``--lib64-lib-symlink``                                                  |Automatically create symlinks for lib64/ pointing to lib/ if the former is missing (default: True; disable with --disable-lib64-lib-symlink)
``--max-fail-ratio-adjust-permissions=MAX-FAIL-RATIO-ADJUST-PERMISSIONS``|Maximum ratio for failures to allow when adjusting permissions (type float; default: 0.5)
``--minimal-build-env=MINIMAL-BUILD-ENV``                                |Minimal build environment to define when using system toolchain, specified as a comma-separated list that defines a mapping between name of environment variable and its value separated by a colon (':') (default: CC:gcc,CXX:g++)
``--minimal-toolchains``                                                 |Use minimal toolchain when resolving dependencies (default: False)
``--module-cache-suffix=MODULE-CACHE-SUFFIX``                            |Suffix to add to the cache file name (before the extension) when updating the modules tool cache
``--module-only``                                                        |Only generate module file(s); skip all steps except for module, prepare, ready, postiter, sanitycheck (default: False)
``--modules-tool-version-check``                                         |Check version of modules tool being used (default: True; disable with --disable-modules-tool-version-check)
``--mpi-cmd-template=MPI-CMD-TEMPLATE``                                  |Template for MPI commands (template keys: %(nr_ranks)s, %(cmd)s)
``--mpi-tests``                                                          |Run MPI tests (when relevant) (default: True; disable with --disable-mpi-tests)
``--optarch=OPTARCH``                                                    |Set architecture optimization, overriding native architecture optimizations
``--output-format=OUTPUT-FORMAT``                                        |Set output format (type choice; default: txt) (choices: json, md, rst, txt)
``--output-style=OUTPUT-STYLE``                                          |Control output style; auto implies using Rich if available to produce rich output, with fallback to basic colored output (type choice; default: auto) (choices: auto, basic, no_color, rich)
``--parallel=PARALLEL``                                                  |Specify (maximum) level of parallelism used during build procedure (type int)
``--parallel-extensions-install``                                        |Install list of extensions in parallel (if supported) (default: False)
``--pre-create-installdir``                                              |Create installation directory before submitting build jobs (default: True; disable with --disable-pre-create-installdir)
``-p, --pretend``                                                        |Does the build/installation in a test directory located in $HOME/easybuildinstall (default: False)
``--read-only-installdir``                                               |Set read-only permissions on installation directory after installation (default: False)
``--remove-ghost-install-dirs``                                          |Remove ghost installation directories when --force or --rebuild is used, rather than just warning about them (default: False)
``--required-linked-shared-libs=REQUIRED-LINKED-SHARED-LIBS``            |Comma-separated list of shared libraries (names, file names, or paths) which must be linked in all installed binaries/libraries (type comma-separated list)
``--rpath``                                                              |Enable use of RPATH for linking with libraries (default: False)
``--rpath-filter=RPATH-FILTER``                                          |List of regex patterns to use for filtering out RPATH paths (type comma-separated list)
``--rpath-override-dirs=RPATH-OVERRIDE-DIRS``                            |Path(s) to be prepended when linking with RPATH (string, colon-separated)
``--sanity-check-only``                                                  |Only run sanity check (module is expected to be installed already (default: False)
``--set-default-module``                                                 |Set the generated module as default (default: False)
``--set-gid-bit``                                                        |Set group ID bit on newly created directories (default: False)
``--show-progress-bar``                                                  |Show progress bar in terminal output (default: True; disable with --disable-show-progress-bar)
``--silence-deprecation-warnings=SILENCE-DEPRECATION-WARNINGS``          |Silence specified deprecation warnings out of (python2, Lmod6, easyconfig, toolchain) (type comma-separated list)
``--silence-hook-trigger``                                               |Suppress printing of debug message every time a hook is triggered (default: False)
``--skip-extensions``                                                    |Skip installation of extensions (default: False)
``--skip-sanity-check``                                                  |Skip running the sanity check step (e.g. testing for installed files or running basic commands) (default: False)
``-t, --skip-test-cases``                                                |Skip running test cases (default: False)
``--skip-test-step``                                                     |Skip running the test step (e.g. unit tests) (default: False)
``--software-commit=SOFTWARE-COMMIT``                                    |Git commit to use for the target software build (robot capabilities are automatically disabled)
``--sticky-bit``                                                         |Set sticky bit on newly created directories (default: False)
``--sysroot=SYSROOT``                                                    |Location root directory of system, prefix for standard paths like /usr/lib and /usr/include
``-T, --trace``                                                          |Provide more information in output to stdout on progress (default: False)
``--umask=UMASK``                                                        |umask to use (e.g. '022'); non-user write permissions on install directories are removed
``--unit-testing-mode``                                                  |Run in unit test mode (default: False)
``--update-modules-tool-cache``                                          |Update modules tool cache file(s) after generating module file (default: False)
``--use-ccache=PATH``                                                    |Enable use of ccache to speed up compilation, with specified cache dir (type <class 'str'>; default: False)
``--use-existing-modules``                                               |Use existing modules when resolving dependencies with minimal toolchains (default: False)
``--use-f90cache=PATH``                                                  |Enable use of f90cache to speed up compilation, with specified cache dir (type <class 'str'>; default: False)
``--verify-easyconfig-filenames``                                        |Verify whether filename of specified easyconfigs matches with contents (default: False)
``--wait-on-lock=WAIT-ON-LOCK``                                          |Wait for lock to be released; 0 implies no waiting (exit with an error if the lock already exists), non-zero value specified waiting interval [DEPRECATED: use --wait-on-lock-interval and --wait-on-lock-limit instead] (type <class 'int'>)
``--wait-on-lock-interval=WAIT-ON-LOCK-INTERVAL``                        |Wait interval (in seconds) to use when waiting for existing lock to be removed (type <class 'int'>; default: 60)
``--wait-on-lock-limit=WAIT-ON-LOCK-LIMIT``                              |Maximum amount of time (in seconds) to wait until lock is released (0 means no waiting at all, exit with error; -1 means no waiting limit, keep waiting) (type <class 'int'>; default: 0)
``--zip-logs=ZIP-LOGS``                                                  |Zip logs that are copied to install directory, using specified command (default: gzip)

## Package options

Option flag                                    |Option description
-----------------------------------------------|----------------------------------------------
``--package``                                  |Enabling packaging (default: False)
``--package-release=PACKAGE-RELEASE``          |Package release iteration number (default: 1)
``--package-tool=PACKAGE-TOOL``                |Packaging tool to use (default: fpm)
``--package-tool-options=PACKAGE-TOOL-OPTIONS``|Extra options for packaging tool (default: '')
``--package-type=PACKAGE-TYPE``                |Type of package to generate (default: rpm)

## Regression test options

Option flag                 |Option description
----------------------------|--------------------------------------------------------------------------
``--aggregate-regtest=DIR`` |Collect all the xmls inside the given directory and generate a single file
``--regtest``               |Enable regression test mode (default: False)
``--regtest-output-dir=DIR``|Set output directory for test-run
``--sequential``            |Specify this option if you want to prevent parallel build (default: False)

## Software search and build options

Option flag                        |Option description
-----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------
``--amend=VAR=VALUE[,VALUE]``      |Specify additional search and build parameters (can be used multiple times); for example: versionprefix=foo or patches=one.patch,two.patch)
``--map-toolchains``               |Enable mapping of (sub)toolchains when --try-toolchain(-version) is used (default: True; disable with --disable-map-toolchains)
``--software=NAME,VERSION``        |Search and build software with given name and version (type comma-separated list)
``--software-name=NAME``           |Search and build software with given name
``--software-version=VERSION``     |Search and build software with given version
``--toolchain=NAME,VERSION``       |Search and build with given toolchain (name and version) (type comma-separated list)
``--toolchain-name=NAME``          |Search and build with given toolchain name
``--toolchain-version=VERSION``    |Search and build with given toolchain version
``--try-amend=VAR=VALUE[,VALUE]``  |Try to specify additional search and build parameters (can be used multiple times); for example: versionprefix=foo or patches=one.patch,two.patch) (USE WITH CARE!)
``--try-ignore-versionsuffixes``   |Ignore versionsuffix differences when --try-update-deps is used (default: False)
``--try-software=NAME,VERSION``    |Try to search and build software with given name and version (USE WITH CARE!) (type comma-separated list)
``--try-software-name=NAME``       |Try to search and build software with given name (USE WITH CARE!)
``--try-software-version=VERSION`` |Try to search and build software with given version (USE WITH CARE!)
``--try-toolchain=NAME,VERSION``   |Try to search and build with given toolchain (name and version) (USE WITH CARE!) (type comma-separated list)
``--try-toolchain-name=NAME``      |Try to search and build with given toolchain name (USE WITH CARE!)
``--try-toolchain-version=VERSION``|Try to search and build with given toolchain version (USE WITH CARE!)
``--try-update-deps``              |Try to update versions of the dependencies of an easyconfig based on what is available in the robot path (default: False)

## Unittest options

Option flag             |Option description
------------------------|---------------------------------
``--unittest-file=FILE``|Log to this file in unittest mode

*(see also* ``eb --help`` *)*

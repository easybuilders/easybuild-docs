# Available easyconfig parameters {: #vsd_avail_easyconfig_params }

## Mandatory parameters

**Parameter name**     |**Description**                                                              |**Default value**
-----------------------|-----------------------------------------------------------------------------|-----------------
`description`          |A short description of the software                                          |`None`
`docurls`              |List of urls with documentation of the software (not necessarily on homepage)|`None`
`homepage`             |The homepage of the software                                                 |`None`
`name`                 |Name of software                                                             |`None`
`software_license`     |Software license                                                             |`None`
`software_license_urls`|List of software license locations                                           |`None`
`toolchain`            |Name and version of toolchain                                                |`None`
`version`              |Version of software                                                          |`None`

## Toolchain parameters

**Parameter name**|**Description**                                                                                                                                                                                                                  |**Default value**
------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------
`onlytcmod`       |Boolean/string to indicate if the toolchain should only load the environment with module (True) or also set all other variables (False) like compiler CC etc (if string: comma separated list of variables that will be ignored).|`False`
`toolchainopts`   |Extra options for compilers                                                                                                                                                                                                      |`None`

## Build parameters

**Parameter name**           |**Description**                                                                                                                          |**Default value**
-----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|-----------------
`banned_linked_shared_libs`  |List of shared libraries (names, file names, or paths) which are not allowed to be linked in any installed binary/library                |`[]`
`bin_lib_subdirs`            |List of subdirectories for binaries and libraries, which is used during sanity check to check RPATH linking and banned/required libraries|`[]`
`bitbucket_account`          |Bitbucket account name to be used to resolve template values in source URLs                                                              |`"%(namelower)s"`
`buildopts`                  |Extra options passed to make step (default already has -j X)                                                                             |`""`
`checksums`                  |Checksums for sources and patches                                                                                                        |`[]`
`configopts`                 |Extra options passed to configure (default already has --prefix)                                                                         |`""`
`cuda_compute_capabilities`  |List of CUDA compute capabilities to build with (if supported)                                                                           |`[]`
`download_instructions`      |Specify steps to acquire necessary file, if obtaining it is difficult                                                                    |`""`
`easyblock`                  |EasyBlock to use for building; if set to None, an easyblock is selected based on the software name                                       |`None`
`easybuild_version`          |EasyBuild-version this spec-file was written for                                                                                         |`None`
`enhance_sanity_check`       |Indicate that additional sanity check commands & paths should enhance the existing sanity check, not replace it                          |`False`
`fix_bash_shebang_for`       |List of files for which Bash shebang should be fixed to '#!/usr/bin/env bash' (glob patterns supported)                                  |`None`
`fix_perl_shebang_for`       |List of files for which Perl shebang should be fixed to '#!/usr/bin/env perl' (glob patterns supported)                                  |`None`
`fix_python_shebang_for`     |List of files for which Python shebang should be fixed to '#!/usr/bin/env python' (glob patterns supported)                              |`None`
`github_account`             |GitHub account name to be used to resolve template values in source URLs                                                                 |`"%(namelower)s"`
`hidden`                     |Install module file as 'hidden' by prefixing its version with '.'                                                                        |`False`
`installopts`                |Extra options for installation                                                                                                           |`""`
`maxparallel`                |Max degree of parallelism                                                                                                                |`None`
`module_only`                |Only generate module file                                                                                                                |`False`
`parallel`                   |Degree of parallelism for e.g. make (default: based on the number of cores, active cpuset and restrictions in ulimit)                    |`None`
`patches`                    |List of patches to apply                                                                                                                 |`[]`
`postinstallcmds`            |Commands to run after the install step.                                                                                                  |`[]`
`postinstallmsgs`            |Messages to print after running the install step.                                                                                        |`[]`
`postinstallpatches`         |Patch files to apply after running the install step.                                                                                     |`[]`
`prebuildopts`               |Extra options pre-passed to build command.                                                                                               |`""`
`preconfigopts`              |Extra options pre-passed to configure.                                                                                                   |`""`
`preinstallopts`             |Extra prefix options for installation.                                                                                                   |`""`
`pretestopts`                |Extra prefix options for test.                                                                                                           |`""`
`required_linked_shared_libs`|List of shared libraries (names, file names, or paths) which must be linked in all installed binaries/libraries                          |`[]`
`runtest`                    |Indicates if a test should be run after make; should specify argument after make (for e.g.,"test" for make test)                         |`None`
`sanity_check_commands`      |format: [(name, options)] e.g. [('gzip','-h')]. Using a non-tuple is equivalent to (name, '-h')                                          |`[]`
`sanity_check_paths`         |List of files and directories to check (format: {'files':&lt;list&gt;, 'dirs':&lt;list&gt;})                                             |`{}`
`skip`                       |Skip existing software                                                                                                                   |`False`
`skipsteps`                  |Skip these steps                                                                                                                         |`[]`
`source_urls`                |List of URLs for source files                                                                                                            |`[]`
`sources`                    |List of source files                                                                                                                     |`[]`
`stop`                       |Keyword to halt the build process after a certain step.                                                                                  |`None`
`testopts`                   |Extra options for test.                                                                                                                  |`""`
`tests`                      |List of test-scripts to run after install. A test script should return a non-zero exit status to fail                                    |`[]`
`unpack_options`             |Extra options for unpacking source                                                                                                       |`""`
`unwanted_env_vars`          |List of environment variables that shouldn't be set during build                                                                         |`[]`
`versionprefix`              |Additional prefix for software version (placed before version and toolchain name)                                                        |`""`
`versionsuffix`              |Additional suffix for software version (placed after toolchain name)                                                                     |`""`

## File-management parameters

**Parameter name**    |**Description**                                                                                                               |**Default value**
----------------------|------------------------------------------------------------------------------------------------------------------------------|-----------------
`buildininstalldir`   |Boolean to build (True) or not build (False) in the installation directory                                                    |`False`
`cleanupoldbuild`     |Boolean to remove (True) or backup (False) the previous build directory with identical name or not.                           |`True`
`cleanupoldinstall`   |Boolean to remove (True) or backup (False) the previous install directory with identical name or not.                         |`True`
`dontcreateinstalldir`|Boolean to create (False) or not create (True) the install directory                                                          |`False`
`keeppreviousinstall` |Boolean to keep the previous installation with identical name. Experts only!                                                  |`False`
`keepsymlinks`        |Boolean to determine whether symlinks are to be kept during copying or if the content of the files pointed to should be copied|`False`
`start_dir`           |Path to start the make in. If the path is absolute, use that path. If not, this is added to the guessed path.                 |`None`

## Dependencies parameters

**Parameter name**       |**Description**                                                           |**Default value**
-------------------------|--------------------------------------------------------------------------|-----------------
`allow_system_deps`      |Allow listed system dependencies (format: (&lt;name&gt;, &lt;version&gt;))|`[]`
`builddependencies`      |List of build dependencies                                                |`[]`
`dependencies`           |List of dependencies                                                      |`[]`
`hiddendependencies`     |List of dependencies available as hidden modules                          |`[]`
`moddependpaths`         |Absolute path(s) to prepend to MODULEPATH before loading dependencies     |`None`
`multi_deps`             |Dict of lists of dependency versions over which to iterate                |`{}`
`multi_deps_load_default`|Load module for first version listed in multi_deps by default             |`True`
`osdependencies`         |OS dependencies that should be present on the system                      |`[]`

## License parameters

**Parameter name**   |**Description**                                                                                                                                    |**Default value**
---------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|-----------------
`accept_eula`        |Accepted End User License Agreement (EULA) for this software                                                                                       |`False`
`group`              |Name of the user group for which the software should be available; format: string or 2-tuple with group name + custom error for users outside group|`None`
`key`                |Key for installing software                                                                                                                        |`None`
`license_file`       |License file for software                                                                                                                          |`None`
`license_server`     |License server for software                                                                                                                        |`None`
`license_server_port`|Port for license server                                                                                                                            |`None`

## Extensions parameters

**Parameter name**      |**Description**                                                                                           |**Default value**
------------------------|----------------------------------------------------------------------------------------------------------|-----------------
`exts_classmap`         |Map of extension name to class for handling build and installation.                                       |`{}`
`exts_default_options`  |List of default options for extensions                                                                    |`{}`
`exts_defaultclass`     |List of module for and name of the default extension class                                                |`None`
`exts_download_dep_fail`|Fail if downloaded dependencies are detected for extensions                                               |`False`
`exts_filter`           |Extension filter details: template for cmd and input to cmd (templates for ext_name, ext_version and src).|`None`
`exts_list`             |List with extensions added to the base installation                                                       |`[]`

## Modules parameters

**Parameter name**          |**Description**                                                                                                                                                                   |**Default value**
----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------
`allow_append_abs_path`     |Allow specifying absolute paths to append in modextrapaths_append                                                                                                                 |`False`
`allow_prepend_abs_path`    |Allow specifying absolute paths to prepend in modextrapaths                                                                                                                       |`False`
`citing`                    |Free-form text that describes how the software should be cited in publications                                                                                                    |`None`
`docpaths`                  |List of paths for documentation relative to installation directory                                                                                                                |`None`
`examples`                  |Free-form text with examples on using the software                                                                                                                                |`None`
`include_modpath_extensions`|Include $MODULEPATH extensions specified by module naming scheme.                                                                                                                 |`True`
`modaliases`                |Aliases to be defined in module file                                                                                                                                              |`{}`
`modaltsoftname`            |Module name to use (rather than using software name                                                                                                                               |`None`
`modextrapaths`             |Extra paths to be prepended in module file                                                                                                                                        |`{}`
`modextrapaths_append`      |Extra paths to be appended in module file                                                                                                                                         |`{}`
`modextravars`              |Extra environment variables to be added to module file                                                                                                                            |`{}`
`modloadmsg`                |Message that should be printed when generated module is loaded                                                                                                                    |`{}`
`modluafooter`              |Footer to include in generated module file (Lua syntax)                                                                                                                           |`""`
`modtclfooter`              |Footer to include in generated module file (Tcl syntax)                                                                                                                           |`""`
`module_depends_on`         |Use depends_on (Lmod 7.6.1+) for dependencies in generated module (implies recursive unloading of modules).                                                                       |`False`
`moduleclass`               |Module class to be used for this software                                                                                                                                         |`"base"`
`moduleforceunload`         |Force unload of all modules when loading the extension                                                                                                                            |`False`
`moduleloadnoconflict`      |Don't check for conflicts, unload other versions instead                                                                                                                          |`False`
`modunloadmsg`              |Message that should be printed when generated module is unloaded                                                                                                                  |`{}`
`recursive_module_unload`   |Recursive unload of all dependencies when unloading module (True/False to hard enable/disable; None implies honoring the --recursive-module-unload EasyBuild configuration setting|`None`
`site_contacts`             |String/list of strings with site contacts for the software                                                                                                                        |`None`
`upstream_contacts`         |String/list of strings with upstream contact addresses (e.g., support e-mail, mailing list, bugtracker)                                                                           |`None`
`usage`                     |Usage instructions for the software                                                                                                                                               |`None`
`whatis`                    |List of brief (one line) description entries for the software                                                                                                                     |`None`

## Other parameters

**Parameter name**|**Description**                                                                                                            |**Default value**
------------------|---------------------------------------------------------------------------------------------------------------------------|-----------------
`block`           |List of other 'block' sections on which this block depends (only relevant in easyconfigs with subblocks)                   |`None`
`build_info_msg`  |String with information to be printed to stdout and logged during the building of the easyconfig                           |`None`
`buildstats`      |A list of dicts with build statistics                                                                                      |`None`
`deprecated`      |String specifying reason why this easyconfig file is deprecated and will be archived in the next major release of EasyBuild|`False`


*(see also* ``eb -a`` or ``eb --avail-easyconfig-params`` *)*

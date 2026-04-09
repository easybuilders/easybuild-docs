# Constants available (only) in configuration files {: #avail_cfgfile_constants }

## Only in 'DEFAULT' section:

Constant name             |Constant help                                                       |Constant value
--------------------------|--------------------------------------------------------------------|----------------------------------------------------------------------------
``DEFAULT_REPOSITORYPATH``|Default easyconfigs repository path                                 |``/home/example/.local/easybuild/ebfiles_repo``
``DEFAULT_ROBOT_PATHS``   |List of default robot paths (':'-separated)                         |``/home/example/work/EasyBuild/easybuild-easyconfigs/easybuild/easyconfigs``
``HOME``                  |Current user's home directory, expanded '~'                         |``/home/example``
``USER``                  |Current username, translated uid from password file (when available)|``example``

*(see also* ``eb --avail-cfgfile-constants`` *)*

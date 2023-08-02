# Constants available (only) in configuration files {: #avail_cfgfile_constants }

## Only in 'DEFAULT' section:

Constant name             |Constant help                                      |Constant value
--------------------------|---------------------------------------------------|-------------------------------------------------------------------
``DEFAULT_REPOSITORYPATH``|Default simpleconfigs repository path                |``/home/example/.local/simplebuild/ebfiles_repo``
``DEFAULT_ROBOT_PATHS``   |List of default robot paths (':'-separated)        |``/home/example/work/simplebuild-simpleconfigs/simplebuild/simpleconfigs``
``HOME``                  |Current user's home directory, expanded '~'        |``/home/example``
``USER``                  |Current username, translated uid from password file|``example``

*(see also* ``eb --avail-cfgfile-constants`` *)*

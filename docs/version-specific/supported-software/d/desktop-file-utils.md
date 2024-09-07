# desktop-file-utils

desktop-file-utils contains a few command line utilities for working with desktop entries:   * desktop-file-validate: validates a desktop file and prints warnings/errors about desktop entry specification     violations.   * desktop-file-install: installs a desktop file to the applications directory, optionally munging it a bit in transit.   * update-desktop-database: updates the database containing a cache of MIME types handled by desktop files. It requires     GLib to compile, because the implementation requires Unicode utilities and such.

*homepage*: <https://www.freedesktop.org/wiki/Software/desktop-file-utils/>

version | toolchain
--------|----------
``0.27`` | ``GCCcore/12.3.0``

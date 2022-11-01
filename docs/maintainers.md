# EasyBuild maintainers

!!! warning
    This page will soon replace <https://docs.easybuild.io/en/latest/Maintainers.html>.

    **
    It still needs to be ported from *reStructuredText* (.rst) to *MarkDown* (.md),  
    and you can help with that!
    **

    - source: [`docs/Maintainers.rst` in `easybuilders/easybuild` repo](https://raw.githubusercontent.com/easybuilders/easybuild/develop/docs/Maintainers.rst)
    - target: [`docs/maintainers.md` in `easybuilders/easybuild-docs` repo](https://github.com/easybuilders/easybuild-docs/tree/main/docs/maintainers.md)

    See <https://github.com/easybuilders/easybuild-docs> for more information.

```rst
.. _maintainers:

EasyBuild maintainers
=====================

This page provides an overview of the current maintainers of the EasyBuild repositories.

.. contents::
    :depth: 3
    :backlinks: none


.. _maintainers_criteria:

Criteria
--------

EasyBuild maintainers should meet the following criteria:

* being sufficiently familiar with the contribution procedure (see :ref:`contributing`)
* frequently contributing to the EasyBuild GitHub repositories
* being an active member of the EasyBuild community for a significant amount of time, i.e.:

  * following the EasyBuild mailing list and participating in discussions (see :ref:`getting_help`)
  * actively participating in the EasyBuild IRC or Slack channel (see :ref:`getting_help`);
  * (occasionally) joining in on the EasyBuild conference calls (see https://github.com/easybuilders/easybuild/wiki/Conference-calls)

* having access to a working setup for submitting test reports (see :ref:`contributing_review_process_test_reports`)


.. _maintainers_roles:

Roles
-----

.. _maintainers_release_manager:

Release managers
~~~~~~~~~~~~~~~~

The release managers are responsible for releasing new stable EasyBuild versions on a regular basis,
with the help of the other EasyBuild maintainers.

Sebastian, Miguel & Kenneth have been working together to get EasyBuild releases out the door on a regular basis
(about once every 6 weeks, see https://pypi.org/project/easybuild/#history).

* **Sebastian Achilles** (`JSC <http://www.fz-juelich.de/ias/jsc/EN>`_)

  * GitHub: `@SebastianAchilles <https://github.com/SebastianAchilles>`_ - e-mail: ``s.achilles (at) fz-juelich.de`` - IRC/Slack: ``Sebastian Achilles``

* **Miguel Dias Costa** (National University of Singapore)

  * GitHub: `@migueldiascosta <https://github.com/migueldiascosta>`_ - e-mail: ``migueldiascosta (at) nus.edu.sg`` - IRC/Slack: ``migueldiascosta``

* **Kenneth Hoste** (`HPC-UGent <http://www.ugent.be/hpc/en>`_)

  * GitHub: `@boegel <https://github.com/boegel>`_ - e-mail: ``kenneth.hoste (at) ugent.be`` - IRC/Slack: ``boegel``


.. _maintainers_easybuild_repo:

Maintainers
~~~~~~~~~~~

The EasyBuild maintainers all have admin access to the different EasyBuild GitHub repositories:

* https://github.com/easybuilders/easybuild (documentation (http://easybuild.readthedocs.io), EasyBuild website, `easybuild` metapackage)
* https://github.com/easybuilders/easybuild-framework (EasyBuild framework)
* https://github.com/easybuilders/easybuild-easyblocks (central repository for easyblocks)
* https://github.com/easybuilders/easybuild-easyconfigs (central repository for easyconfigs)

(maintainers are listed in alphabetical order, by last name)

* **Sebastian Achilles** (`JSC <http://www.fz-juelich.de/ias/jsc/EN>`_)

  * GitHub: `@SebastianAchilles <https://github.com/SebastianAchilles>`_ - e-mail: ``s.achilles (at) fz-juelich.de`` - IRC/Slack: ``Sebastian Achilles``

* **Damian Alvarez** (`JSC <http://www.fz-juelich.de/ias/jsc/EN>`_)

  * GitHub: `@damianam <https://github.com/damianam>`_ - e-mail: ``d.alvarez (at) fz-juelich.de`` - IRC/Slack: ``dalvarez``

* **Simon Branford** (`BEAR - University of Birmingham <https://intranet.birmingham.ac.uk/bear>`_)

  * GitHub: `@branfosj <https://github.com/branfosj>`_ - e-mail: ``s.j.branford (at) bham.ac.uk`` - IRC/Slack: ``Simon``

* **Miguel Dias Costa** (National University of Singapore)

  * GitHub: `@migueldiascosta <https://github.com/migueldiascosta>`_ - e-mail: ``migueldiascosta (at) nus.edu.sg`` - IRC/Slack: ``migueldiascosta``

* **Alex Domingo** (`Vrije Universiteit Brussel <https://hpc.vub.be>`_)

  * GitHub: `@lexming <https://github.com/lexming>`_ - e-mail: ``alex.domingo.toro (at) vub.be`` - IRC/Slack: ``lexming``

* **Bob Dröge** (`University of Groningen <https://www.rug.nl/?lang=en>`_)

  * GitHub: `@bedroge <https://github.com/bedroge>`_ - e-mail: ``b.e.droge (at) rug.nl`` - IRC/Slack: ``Bob Dröge``

* **Pablo Escobar** (`sciCORE, University of Basel <https://scicore.unibas.ch/>`_)

  * GitHub: `@pescobar <https://github.com/pescobar>`_ - e-mail: ``pablo.escobarlopez (at) unibas.ch`` - IRC/Slack: ``pescobar``

* **Fotis Georgatos** (`SDSC <https://datascience.ch/>`_)

  * GitHub: `@fgeorgatos <https://github.com/fgeorgatos>`_ - e-mail: ``kefalonia (at) gmail.com`` - IRC/Slack: ``fotis``

* **Jasper Grimm** (`University or York <https://www.york.ac.uk/it-services/research-computing/>`_)

  * GitHub: `@jfgrimm <https://github.com/jfgrimm>`_ - e-mail: ``jasper.grimm (at) york.ac.uk`` - IRC/Slack: ``Jasper``

* **Balázs Hajgató** (`HPC-UGent <http://www.ugent.be/hpc/en>`_)

  * GitHub: `@hajgato <https://github.com/hajgato>`_ - e-mail: ``balazs.hajgato (at) ugent.be`` - IRC/Slack: ``hajgato``

* **Kenneth Hoste** (`HPC-UGent <http://www.ugent.be/hpc/en>`_)

  * GitHub: `@boegel <https://github.com/boegel>`_ - e-mail: ``kenneth.hoste (at) ugent.be`` - IRC/Slack: ``boegel``

* **Adam Huffman** (`Big Data Institute, University of Oxford <https://www.bdi.ox.ac.uk/>`_)

  * GitHub: `@verdurin <https://github.com/verdurin>`_ - e-mail: ``adam.huffman (at) gmail.com`` - IRC/Slack: ``verdurin``

* **Samuel Moors** (`Vrije Universiteit Brussel <https://hpc.vub.be>`_)

  * GitHub: `@smoors <https://github.com/smoors>`_ - e-mail: ``samuel.moors (at) vub.be`` - IRC/Slack: ``smoors``

* **Alan O'Cais** (`CECAM <https://www.cecam.org/>`_)

  * GitHub: `@ocaisa <https://github.com/ocaisa>`_ - e-mail: ``alan.ocais (at) cecam.org`` - IRC/Slack: ``ocaisa``

* **Mikael Öhman** (`Chalmers University of Technology <https://www.chalmers.se/en>`_)

  * GitHub: `@Micket <https://github.com/Micket>`_ - e-mail: ``micketeer (at) gmail.com`` - IRC/Slack: ``micketeer``

* **Bart Oldeman** (`ComputeCanada <https://www.computecanada.ca/>`_)

  * GitHub: `@bartoldeman <https://github.com/bartoldeman>`_ - e-mail: ``bart.oldeman (at) calculquebec.ca`` - IRC/Slack: ``bartoldeman``

* **Ward Poelmans** (`Vrije Universiteit Brussel <https://hpc.vub.be>`_)

  * GitHub: `@wpoely86 <https://github.com/wpoely86>`_ - e-mail: ``wpoely86 (at) gmail.com`` - IRC/Slack: ``wpoely86``

* **Åke Sandgren** (`Umeå University, Sweden <http://www.umu.se/english/>`_)

  * GitHub: `@akesandgren <https://github.com/akesandgren>`_ - e-mail: ``ake.sandgren (at) hpc2n.umu.se`` - IRC/Slack: ``ake_s``

* **Caspar Van Leeuwen** (`SURFsara, Netherlands <https://www.surf.nl/en/research-ict>`_)

  * GitHub: `@casparvl <https://github.com/casparvl>`_ - e-mail: ``caspar.vanleeuwen (at) surfsara.nl`` - IRC/Slack: ``Caspar Van Leeuwen``

* **Davide Vanzo** (`Microsoft <https://www.microsoft.com/>`_)

  * GitHub: `@vanzod <https://github.com/vanzod>`_ - e-mail: ``davide.vanzo (at) microsoft.com`` - IRC/Slack: ``vanzod``

* **Lars Viklund** (`Umeå University, Sweden <http://www.umu.se/english/>`_)

  * GitHub: `@zao <https://github.com/zao>`_ - e-mail: ``lars.viklund (at) umu.se`` - IRC/Slack: ``zao``

```

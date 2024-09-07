# kim-api

Open Knowledgebase of Interatomic Models.  KIM is an API and OpenKIM is a collection of interatomic models (potentials) for atomistic simulations.  This is a library that can be used by simulation programs to get access to the models in the OpenKIM database.  This EasyBuild only installs the API, the models can be installed with the package openkim-models, or the user can install them manually by running     kim-api-collections-management install user MODELNAME or     kim-api-collections-management install user OpenKIM to install them all.

*homepage*: <https://openkim.org/>

version | toolchain
--------|----------
``2.1.2`` | ``foss/2019a``
``2.1.2`` | ``intel/2019a``
``2.1.3`` | ``foss/2019b``
``2.1.3`` | ``foss/2020a``
``2.1.3`` | ``intel/2019b``
``2.1.3`` | ``intel/2020a``
``2.2.1`` | ``GCC/10.2.0``
``2.2.1`` | ``GCC/10.3.0``
``2.2.1`` | ``iccifort/2020.4.304``
``2.3.0`` | ``GCC/11.2.0``
``2.3.0`` | ``GCC/11.3.0``
``2.3.0`` | ``GCC/12.2.0``
``2.3.0`` | ``GCC/12.3.0``
``2.3.0`` | ``intel-compilers/2023.1.0``

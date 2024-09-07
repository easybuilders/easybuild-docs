# expecttest

This library implements expect tests (also known as "golden" tests). Expect tests are a method of  writing tests where instead of hard-coding the expected output of a test, you run the test to get the output, and  the test framework automatically populates the expected output. If the output of the test changes, you can rerun  the test with the environment variable EXPECTTEST_ACCEPT=1 to automatically update the expected output.

*homepage*: <https://github.com/ezyang/expecttest>

version | toolchain
--------|----------
``0.1.3`` | ``GCCcore/10.2.0``
``0.1.3`` | ``GCCcore/10.3.0``
``0.1.3`` | ``GCCcore/11.2.0``
``0.1.3`` | ``GCCcore/11.3.0``
``0.1.3`` | ``GCCcore/12.2.0``
``0.1.5`` | ``GCCcore/12.3.0``
``0.2.1`` | ``GCCcore/13.2.0``

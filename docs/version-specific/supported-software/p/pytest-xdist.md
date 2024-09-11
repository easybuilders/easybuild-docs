---
search:
  boost: 0.5
---
# pytest-xdist

xdist: pytest distributed testing plugin  The pytest-xdist plugin extends pytest with some unique test execution modes:      * test run parallelization: if you have multiple CPUs or hosts you       can use those for a combined test run. This allows to speed up       development or to use special resources of remote machines.      * --looponfail: run your tests repeatedly in a subprocess. After         each run pytest waits until a file in your project changes and         then re-runs the previously failing tests. This is repeated         until all tests pass after which again a full run is         performed.      * Multi-Platform coverage: you can specify different Python       interpreters or different platforms and run tests in parallel on       all of them.  Before running tests remotely, pytest efficiently “rsyncs” your program source code to the remote place. All test results are reported back and displayed to your local terminal. You may specify different Python versions and interpreters.

*homepage*: <https://github.com/pytest-dev/pytest-xdist>

version | toolchain
--------|----------
``2.1.0`` | ``GCCcore/10.2.0``
``2.3.0`` | ``GCCcore/10.2.0``
``2.3.0`` | ``GCCcore/10.3.0``
``2.5.0`` | ``GCCcore/11.2.0``
``2.5.0`` | ``GCCcore/11.3.0``
``3.3.1`` | ``GCCcore/12.3.0``


*(quick links: [(all)](../index.md) - [0](../0/index.md) - [a](../a/index.md) - [b](../b/index.md) - [c](../c/index.md) - [d](../d/index.md) - [e](../e/index.md) - [f](../f/index.md) - [g](../g/index.md) - [h](../h/index.md) - [i](../i/index.md) - [j](../j/index.md) - [k](../k/index.md) - [l](../l/index.md) - [m](../m/index.md) - [n](../n/index.md) - [o](../o/index.md) - [p](../p/index.md) - [q](../q/index.md) - [r](../r/index.md) - [s](../s/index.md) - [t](../t/index.md) - [u](../u/index.md) - [v](../v/index.md) - [w](../w/index.md) - [x](../x/index.md) - [y](../y/index.md) - [z](../z/index.md))*


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

[../0/index.md](0) - [../a/index.md](a) - [../b/index.md](b) - [../c/index.md](c) - [../d/index.md](d) - [../e/index.md](e) - [../f/index.md](f) - [../g/index.md](g) - [../h/index.md](h) - [../i/index.md](i) - [../j/index.md](j) - [../k/index.md](k) - [../l/index.md](l) - [../m/index.md](m) - [../n/index.md](n) - [../o/index.md](o) - [../p/index.md](p) - [../q/index.md](q) - [../r/index.md](r) - [../s/index.md](s) - [../t/index.md](t) - [../u/index.md](u) - [../v/index.md](v) - [../w/index.md](w) - [../x/index.md](x) - [../y/index.md](y) - [../z/index.md](z)


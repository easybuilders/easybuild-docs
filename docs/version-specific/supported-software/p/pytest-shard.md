# pytest-shard

pytest plugin to support parallelism across multiple machines.  Shards tests based on a hash of their test name enabling easy parallelism across machines, suitable for a wide variety of continuous integration services. Tests are split at the finest level of granularity, individual test cases, enabling parallelism even if all of your tests are in a single file (or even single parameterized test method).

*homepage*: <https://github.com/AdamGleave/pytest-shard>

version | toolchain
--------|----------
``0.1.2`` | ``GCCcore/11.3.0``
``0.1.2`` | ``GCCcore/12.2.0``
``0.1.2`` | ``GCCcore/12.3.0``
``0.1.2`` | ``GCCcore/13.2.0``

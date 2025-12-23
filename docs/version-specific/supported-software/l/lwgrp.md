---
search:
  boost: 0.5
---
# lwgrp

The light-weight group library defines data structures and collective operations to group MPI processes as an ordered set.  Such groups are useful as substitutes for MPI communicators when the overhead of communicator creation is too costly.  For example, certain sorting algorithms recursively divide processes into subgroups as the sort algorithm progresses.  These groups may be different with each invocation, so that it is inefficient to create and destroy communicators during the sort routine.

*homepage*: <https://github.com/LLNL/lwgrp>

version | toolchain
--------|----------
``1.0.5`` | ``gompi/2022a``
``1.0.5`` | ``gompi/2023a``
``1.0.6`` | ``gompi/2024a``
``1.0.6`` | ``gompi/2025a``
``1.0.6`` | ``gompi/2025b``


*(quick links: [(all)](../index.md) - [0](../0/index.md) - [a](../a/index.md) - [b](../b/index.md) - [c](../c/index.md) - [d](../d/index.md) - [e](../e/index.md) - [f](../f/index.md) - [g](../g/index.md) - [h](../h/index.md) - [i](../i/index.md) - [j](../j/index.md) - [k](../k/index.md) - [l](../l/index.md) - [m](../m/index.md) - [n](../n/index.md) - [o](../o/index.md) - [p](../p/index.md) - [q](../q/index.md) - [r](../r/index.md) - [s](../s/index.md) - [t](../t/index.md) - [u](../u/index.md) - [v](../v/index.md) - [w](../w/index.md) - [x](../x/index.md) - [y](../y/index.md) - [z](../z/index.md))*


# LISFLOOD-FP

The LISFLOOD-FP is a raster-based hydrodynamic model originally developed by the University of Bristol. It has undergone extensive development since conception and includes a collection of numerical schemes implemented to solve a variety of mathematical approximations of the 2D shallow water equations of different complexity. The local inertia solver, known as the ACC solver, is widely used to simulate floods with gradually-varying, subcritical flow over sufficiently rough surfaces with Manning’s coefficient of at least 0.03. It has a version with CPU-specific optimisations and enhanced with a subgrid channel model. LISFLOOD-FP also includes second-order discontinuous Galerkin (DG2) and first-order finite volume (FV1) solvers of the full shallow water equations for modelling a wide range of flows, including rapidly-propagating, supercritical flows, shock waves, or flows over very smooth surfaces. The DG2/FV1 solvers are parallelised for the multi-core CPU architecture, but do not integrate with the subgrid channel model nor with the CPU-specific optimisations.

*homepage*: <https://www.seamlesswave.com/LISFLOOD8.0.html>

version | versionsuffix | toolchain
--------|---------------|----------
``8.1`` | ``-CUDA-11.7.0`` | ``gompi/2022a``
``8.1`` |  | ``gompi/2022a``

# hampel

The Hampel filter is generally used to detect anomalies in data with a timeseries  structure. It basically consists of a sliding window of a parameterizable size. For each  window, each observation will be compared with the Median Absolute Deviation (MAD). The  observation will be considered an outlier in the case in which it exceeds the MAD by n  times (the parameter n is also parameterizable).

*homepage*: <https://github.com/MichaelisTrofficus/hampel_filter>

version | toolchain
--------|----------
``0.0.5`` | ``foss/2022a``

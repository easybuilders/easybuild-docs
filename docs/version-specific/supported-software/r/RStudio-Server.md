---
search:
  boost: 0.5
---
# RStudio-Server

This is the RStudio Server version. RStudio is a set of integrated tools designed to help you be more productive with R.  The server can be started with:   rserver --server-daemonize=0 --www-port=8787  If you need a database config one can be created with:   MYTMP=`mktemp -d` && echo -e "provider=sqlite\ndirectory=${MYTMP}/sqlite" > "${MYTMP}/db.conf" and then used with:   rserver ... --database-config-file="${MYTMP}/db.conf"

*homepage*: <https://www.rstudio.com/>

version | versionsuffix | toolchain
--------|---------------|----------
``2022.07.2+576`` | ``-Java-11-R-4.2.1`` | ``foss/2022a``
``2023.09.1+494`` | ``-Java-11-R-4.3.2`` | ``foss/2023a``
``2023.12.1+402`` | ``-Java-11-R-4.3.3`` | ``gfbf/2023b``
``2024.09.0+375`` | ``-Java-11-R-4.4.1`` | ``foss/2023b``
``2024.12.0+467`` | ``-R-4.4.2`` | ``foss/2024a``
``2025.09.2+418`` | ``-R-4.5.1`` | ``foss/2025a``


*(quick links: [(all)](../index.md) - [0](../0/index.md) - [a](../a/index.md) - [b](../b/index.md) - [c](../c/index.md) - [d](../d/index.md) - [e](../e/index.md) - [f](../f/index.md) - [g](../g/index.md) - [h](../h/index.md) - [i](../i/index.md) - [j](../j/index.md) - [k](../k/index.md) - [l](../l/index.md) - [m](../m/index.md) - [n](../n/index.md) - [o](../o/index.md) - [p](../p/index.md) - [q](../q/index.md) - [r](../r/index.md) - [s](../s/index.md) - [t](../t/index.md) - [u](../u/index.md) - [v](../v/index.md) - [w](../w/index.md) - [x](../x/index.md) - [y](../y/index.md) - [z](../z/index.md))*


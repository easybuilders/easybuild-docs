# Tracing progress {: #trace }

To trace the progress of EasyBuild while it is installing software, you
can use `eb --trace`.

!!! note
    Tracing support was added as an experimental feature in EasyBuild v3.4.0, and thus required
    using `--experimental`. Since EasyBuild v3.4.1, `--trace` is
    considered stable and no longer requires the use of
    `--experimental`.

## Trace output {: #trace_output }

When `eb --trace` is used, EasyBuild will print additional output on top
of the standard output, which only mentions which step of the
installation procedure is being executed (without any further details).

This output includes:

- location of build and install directories
- list of sources and patches
- modules being loaded
- executed commands
- results of the sanity check
- location of generated module file

For each (non-trivial) executed command, the location to a temporary log
file will be provided so the output of that command can be monitored
while it is running. In addition, the start time of the command is
printed, to allow determining how long the command has been running.

## Example {: #trace_example }

``` console
$ eb DBD-mysql-4.050-GCC-11.3.0.eb -df --trace
== Temporary log file in case of crash /tmp/vsc43810/eb-0hlic_jz/easybuild-r15wx134.log
== processing EasyBuild easyconfig /user/gent/438/vsc43810/easybuild/easybuild-easyconfigs/easybuild/easyconfigs/d/DBD-mysql/DBD-mysql-4.050-GCC-11.3.0.eb
== building and installing DBD-mysql/4.050-GCC-11.3.0...
  >> installation prefix: /scratch/gent/vo/001/gvo00117/easybuild/RHEL8/cascadelake-ampere-ib/software/DBD-mysql/4.050-GCC-11.3.0
== fetching files...
  >> sources:
  >> /apps/gent/sources/d/DBD-mysql/DBD-mysql-4.050.tar.gz [SHA256: 4f48541ff15a0a7405f76adc10f81627c33996fbf56c95c26c094444c0928d78]
== ... (took < 1 sec)
== creating build dir, resetting environment...
  >> build dir: /tmp/vsc43810/easybuild/build/DBDmysql/4.050/GCC-11.3.0
== ... (took < 1 sec)
== unpacking...
  >> running command:
        [started at: 2023-07-10 15:50:37]
        [working dir: /tmp/vsc43810/easybuild/build/DBDmysql/4.050/GCC-11.3.0]
        [output logged in /tmp/vsc43810/eb-0hlic_jz/easybuild-run_cmd-lb_c_n28.log]
        tar xzf /apps/gent/sources/d/DBD-mysql/DBD-mysql-4.050.tar.gz
  >> command completed: exit 0, ran in < 1s
== ... (took < 1 sec)
== patching...
== ... (took < 1 sec)
== preparing...
  >> loading toolchain module: GCC/11.3.0
  >> (no build dependencies specified)
  >> loading modules for (runtime) dependencies:
  >>  * Perl/5.34.1-GCCcore-11.3.0
  >>  * MariaDB/10.9.3-GCC-11.3.0
  >>  * zlib/1.2.12-GCCcore-11.3.0
  >>  * OpenSSL/1.1
  >> defining build environment for GCC/11.3.0 toolchain
== ... (took 20 secs)
== configuring...
== ... (took < 1 sec)
== building...
== ... (took < 1 sec)
== testing...
== ... (took < 1 sec)
== installing...
  >> running command:
        [started at: 2023-07-10 15:50:58]
        [working dir: /tmp/vsc43810/easybuild/build/DBDmysql/4.050/GCC-11.3.0/DBD-mysql-4.050]
        [output logged in /tmp/vsc43810/eb-0hlic_jz/easybuild-run_cmd-28s6zzlb.log]
        perl Makefile.PL PREFIX=/scratch/gent/vo/001/gvo00117/easybuild/RHEL8/cascadelake-ampere-ib/software/DBD-mysql/4.050-GCC-11.3.0
  >> command completed: exit 0, ran in 00h00m05s
  >> running command:
        [started at: 2023-07-10 15:51:03]
        [working dir: /tmp/vsc43810/easybuild/build/DBDmysql/4.050/GCC-11.3.0/DBD-mysql-4.050]
        [output logged in /tmp/vsc43810/eb-0hlic_jz/easybuild-run_cmd-vawy0_q0.log]
        make  -j 8
  >> command completed: exit 0, ran in 00h00m02s
  >> running command:
        [started at: 2023-07-10 15:51:06]
        [working dir: /tmp/vsc43810/easybuild/build/DBDmysql/4.050/GCC-11.3.0/DBD-mysql-4.050]
        [output logged in /tmp/vsc43810/eb-0hlic_jz/easybuild-run_cmd-szr0wujz.log]
        make test
  >> command completed: exit 0, ran in 00h00m06s
  >> running command:
        [started at: 2023-07-10 15:51:12]
        [working dir: /tmp/vsc43810/easybuild/build/DBDmysql/4.050/GCC-11.3.0/DBD-mysql-4.050]
        [output logged in /tmp/vsc43810/eb-0hlic_jz/easybuild-run_cmd-u7n5p0oq.log]
        make install
  >> command completed: exit 0, ran in < 1s
== ... (took 14 secs)
== taking care of extensions...
== ... (took < 1 sec)
== restore after iterating...
== ... (took < 1 sec)
== postprocessing...
== ... (took < 1 sec)
== sanity checking...
  >> running command:
        [started at: 2023-07-10 15:51:12]
        [working dir: /tmp/vsc43810/easybuild/build/DBDmysql/4.050/GCC-11.3.0/DBD-mysql-4.050]
        [output logged in /tmp/vsc43810/eb-0hlic_jz/easybuild-run_cmd-1ovlnqgj.log]
        perl -MConfig -e 'print $Config::Config{PERL_API_REVISION}'
  >> command completed: exit 0, ran in < 1s
  >> running command:
        [started at: 2023-07-10 15:51:12]
        [working dir: /tmp/vsc43810/easybuild/build/DBDmysql/4.050/GCC-11.3.0/DBD-mysql-4.050]
        [output logged in /tmp/vsc43810/eb-0hlic_jz/easybuild-run_cmd-gu5r14nn.log]
        perl -MConfig -e 'my $a = $Config::Config{"sitearch"}; $a =~ s/($Config::Config{"siteprefix"})//; print $a'
  >> command completed: exit 0, ran in < 1s
  >> running command:
        [started at: 2023-07-10 15:51:12]
        [working dir: /tmp/vsc43810/easybuild/build/DBDmysql/4.050/GCC-11.3.0/DBD-mysql-4.050]
        [output logged in /tmp/vsc43810/eb-0hlic_jz/easybuild-run_cmd-nnk7n5w8.log]
        perl -MConfig -e 'my $a = $Config::Config{"sitelib"}; $a =~ s/($Config::Config{"siteprefix"})//; print $a'
  >> command completed: exit 0, ran in < 1s
  >> running command:
        [started at: 2023-07-10 15:51:20]
        [working dir: /kyukon/scratch/gent/vo/001/gvo00117/easybuild/RHEL8/cascadelake-ampere-ib/software/DBD-mysql/4.050-GCC-11.3.0]
        [output logged in /tmp/vsc43810/eb-0hlic_jz/easybuild-run_cmd-bo0su7a0.log]
        perldoc -lm DBD::mysql
  >> command completed: exit 0, ran in < 1s
  >> file 'lib/perl5/site_perl/5.34.1/x86_64-linux-thread-multi/DBD/mysql.pm' found: OK
  >> (non-empty) directory 'lib/perl5/site_perl/5.34.1/x86_64-linux-thread-multi/DBD/mysql' found: OK
  >> running command:
        [started at: 2023-07-10 15:51:25]
        [working dir: /kyukon/scratch/gent/vo/001/gvo00117/easybuild/RHEL8/cascadelake-ampere-ib/software/DBD-mysql/4.050-GCC-11.3.0]
        [output logged in /tmp/vsc43810/eb-0hlic_jz/easybuild-run_cmd-69mrzxwx.log]
        perl -MConfig -e 'print $Config::Config{PERL_API_REVISION}'
  >> command completed: exit 0, ran in < 1s
  >> running command:
        [started at: 2023-07-10 15:51:25]
        [working dir: /kyukon/scratch/gent/vo/001/gvo00117/easybuild/RHEL8/cascadelake-ampere-ib/software/DBD-mysql/4.050-GCC-11.3.0]
        [output logged in /tmp/vsc43810/eb-0hlic_jz/easybuild-run_cmd-1y9q6bb9.log]
        perl -MConfig -e 'my $a = $Config::Config{"sitearch"}; $a =~ s/($Config::Config{"siteprefix"})//; print $a'
  >> command completed: exit 0, ran in < 1s
  >> running command:
        [started at: 2023-07-10 15:51:25]
        [working dir: /kyukon/scratch/gent/vo/001/gvo00117/easybuild/RHEL8/cascadelake-ampere-ib/software/DBD-mysql/4.050-GCC-11.3.0]
        [output logged in /tmp/vsc43810/eb-0hlic_jz/easybuild-run_cmd-a1yiis3i.log]
        perl -MConfig -e 'my $a = $Config::Config{"sitelib"}; $a =~ s/($Config::Config{"siteprefix"})//; print $a'
  >> command completed: exit 0, ran in < 1s
  >> loading modules: DBD-mysql/4.050-GCC-11.3.0...
== ... (took 22 secs)
== cleaning up...
== ... (took < 1 sec)
== creating module...
  >> generating module file @ /scratch/gent/vo/001/gvo00117/easybuild/RHEL8/cascadelake-ampere-ib/modules/all/DBD-mysql/4.050-GCC-11.3.0.lua
  >> running command:
        [started at: 2023-07-10 15:51:35]
        [working dir: /kyukon/home/gent/438/vsc43810]
        [output logged in /tmp/vsc43810/eb-0hlic_jz/easybuild-run_cmd-t70ouz_f.log]
        perl -MConfig -e 'print $Config::Config{PERL_API_REVISION}'
  >> command completed: exit 0, ran in < 1s
  >> running command:
        [started at: 2023-07-10 15:51:35]
        [working dir: /kyukon/home/gent/438/vsc43810]
        [output logged in /tmp/vsc43810/eb-0hlic_jz/easybuild-run_cmd-pvoshtmb.log]
        perl -MConfig -e 'my $a = $Config::Config{"sitearch"}; $a =~ s/($Config::Config{"siteprefix"})//; print $a'
  >> command completed: exit 0, ran in < 1s
  >> running command:
        [started at: 2023-07-10 15:51:35]
        [working dir: /kyukon/home/gent/438/vsc43810]
        [output logged in /tmp/vsc43810/eb-0hlic_jz/easybuild-run_cmd-hhuo5ew4.log]
        perl -MConfig -e 'my $a = $Config::Config{"sitelib"}; $a =~ s/($Config::Config{"siteprefix"})//; print $a'
  >> command completed: exit 0, ran in < 1s
  >> running command:
        [started at: 2023-07-10 15:51:36]
        [working dir: /kyukon/home/gent/438/vsc43810]
        [output logged in /tmp/vsc43810/eb-0hlic_jz/easybuild-run_cmd-i48pnde3.log]
        perl -MConfig -e 'print $Config::Config{PERL_API_REVISION}'
  >> command completed: exit 0, ran in < 1s
  >> running command:
        [started at: 2023-07-10 15:51:36]
        [working dir: /kyukon/home/gent/438/vsc43810]
        [output logged in /tmp/vsc43810/eb-0hlic_jz/easybuild-run_cmd-nvi8om1l.log]
        perl -MConfig -e 'my $a = $Config::Config{"sitearch"}; $a =~ s/($Config::Config{"siteprefix"})//; print $a'
  >> command completed: exit 0, ran in < 1s
  >> running command:
        [started at: 2023-07-10 15:51:36]
        [working dir: /kyukon/home/gent/438/vsc43810]
        [output logged in /tmp/vsc43810/eb-0hlic_jz/easybuild-run_cmd-mir66d85.log]
        perl -MConfig -e 'my $a = $Config::Config{"sitelib"}; $a =~ s/($Config::Config{"siteprefix"})//; print $a'
  >> command completed: exit 0, ran in < 1s
== ... (took 11 secs)
== permissions...
== ... (took < 1 sec)
== packaging...
== ... (took < 1 sec)
== COMPLETED: Installation ended successfully (took 1 min 9 secs)
== Results of the build can be found in the log file(s) /scratch/gent/vo/001/gvo00117/easybuild/RHEL8/cascadelake-ampere-ib/software/DBD-mysql/4.050-GCC-11.3.0/easybuild/easybuild-DBD-mysql-4.050-20230710.155146.log
== Build succeeded for 1 out of 1
== Temporary log file(s) /tmp/vsc43810/eb-0hlic_jz/easybuild-r15wx134.log* have been removed.
== Temporary directory /tmp/vsc43810/eb-0hlic_jz has been removed.
```

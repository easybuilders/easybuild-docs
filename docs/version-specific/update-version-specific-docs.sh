#!/bin/bash
##
# Copyright 2015-2022 Ghent University
#
# This file is part of SimpleBuild,
# originally created by the HPC team of Ghent University (http://ugent.be/hpc/en),
# with support of Ghent University (http://ugent.be/hpc),
# the Flemish Supercomputer Centre (VSC) (https://vscentrum.be/nl/en),
# the Hercules foundation (http://www.herculesstichting.be/in_English)
# and the Department of Economy, Science and Innovation (EWI) (http://www.ewi-vlaanderen.be/en).
#
# https://github.com/simplebuilders/simplebuild
#
# SimpleBuild is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation v2.
#
# SimpleBuild is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with SimpleBuild.  If not, see <http://www.gnu.org/licenses/>.
##

# This script generates all SimpleBuild documentation that can be automatically updated.
#
# authors: Caroline De Brouwer, Kenneth Hoste (HPC-UGent)

set -euo pipefail

export LC_ALL=en_US.UTF-8

if [[ ! $PWD =~ .*/simplebuild-docs/docs/version-specific$ ]]; then
    echo "$(basename $0) script should be run from simplebuild-docs/docs/version-specific ($PWD)"
    exit 1
fi

generic_simpleblocks_script=./gen_simpleblocks_docs.py

if [ ! -f $generic_simpleblocks_script ]; then
    echo "Could not find required script: $generic_simpleblocks_script" >&2
    exit 1
fi

###################################################################################################

overview=$PWD/index.md
touch $overview

ov_title="Overview of version-specific (auto-generated) documentation pages"
echo "# $ov_title" > $overview
echo >> $overview
echo >> $overview

###################################################################################################

#  available configfile constants
echo "eb --avail-cfgfile-constants"
eb --avail-cfgfile-constants --output-format md | sed "s@$HOME@/home/example@g" | sed "s@$USER@example@g" | sed 's/^\(# .*\)/\1 {: #avail_cfgfile_constants }/g' > config-file-constants.md
echo >> config-file-constants.md
echo "*(see also* \`\`eb --avail-cfgfile-constants\`\` *)*" >> config-file-constants.md

echo "* [Config file constants](config-file-constants.md)" >> $overview

###################################################################################################

#  available simpleconfig params
echo "eb --avail-simpleconfig-params"
eb --avail-simpleconfig-params --output-format md | sed 's/^\(# .*\)/\1 {: #vsd_avail_simpleconfig_params }/g' > simpleconfig-parameters.md
echo >> simpleconfig-parameters.md
echo "*(see also* \`\`eb -a\`\` or \`\`eb --avail-simpleconfig-params\`\` *)*" >> simpleconfig-parameters.md

echo "* [Available simpleconfig parameters](simpleconfig-parameters.md)" >> $overview

###################################################################################################

# available simpleconfig constants
echo "eb --avail-simpleconfig-constants"
eb --avail-simpleconfig-constants --output-format md | sed "s@$HOME@/home/example@g" | sed "s@$USER@example@g" | sed 's/^\(# .*\)/\1 {: #avail_simpleconfig_constants }/g' > simpleconfig-constants.md
echo >> simpleconfig-constants.md
echo "*(see also* \`\`eb --avail-simpleconfig-constants\`\` *)*" >> simpleconfig-constants.md
echo "* [Constants available for simpleconfig files](simpleconfig-constants.md)" >> $overview

###################################################################################################

# available simpleconfig licenses
echo "eb --avail-simpleconfig-licenses"
eb --avail-simpleconfig-licenses --output-format md | sed 's/^\(# .*\)/\1 {: #avail_simpleconfig_licenses }/g' > simpleconfig-license-constants.md
echo >> simpleconfig-license-constants.md
echo "*(see also* \`\`eb --avail-simpleconfig-licenses\`\` *)*" >> simpleconfig-license-constants.md
echo "* [License constants available for simpleconfig files](simpleconfig-license-constants.md)" >> $overview

###################################################################################################

#  list-simpleblocks doc
echo "eb --list-simpleblocks"
echo "# List of simpleblocks {: #vsd_list_simpleblocks }" > simpleblocks.md
echo >> simpleblocks.md
eb --list-simpleblocks --output-format md >> simpleblocks.md
echo >> simpleblocks.md
echo "*(see also* \`\`eb --list-simpleblocks\`\` and* [*overview of generic simpleblocks*][generic_simpleblocks] *)*" >> simpleblocks.md
echo "* [List of available simpleblocks](simpleblocks.md)" >> $overview

###################################################################################################

#  available toolchain options
echo "eb --avail-toolchain-opts"
echo "# Available toolchain options (by toolchain) {: #avail_toolchain_opts }" > toolchain-opts.md
echo >> toolchain-opts.md
echo "*(see also* \`\`eb --avail-toolchain-opts <tcname>\`\` *)*" >> toolchain-opts.md
echo >> toolchain-opts.md

temp_tc="$(mktemp)"

IFS=$'\n'
for line in `eb --list-toolchains | sed 1d | sort --ignore-case`
do
    tc=`echo $line | cut -d ':' -f1`
    echo "${tc//[[:blank:]]/}" >> $temp_tc
done

tcname=`cat $temp_tc | head -1`
tcnamelower=$(echo $tcname | tr '[:upper:]' '[:lower:]')
echo -n "[${tcname}](#${tcnamelower})" >> toolchain-opts.md

cat $temp_tc | sed 1d | while read tcname
do
    tcnamelower=$(echo $tcname | tr '[:upper:]' '[:lower:]')
    echo -n " - [${tcname}](#${tcnamelower})" >> toolchain-opts.md
done
echo >> toolchain-opts.md

cat $temp_tc | while read toolchain
do
    echo >> toolchain-opts.md
    echo "## ${toolchain}" >> toolchain-opts.md
    echo >> toolchain-opts.md
    eb --avail-toolchain-opts ${toolchain} --output-format md | sed 's/^## /### /g' >> toolchain-opts.md
done
rm $temp_tc

echo "* [List of available toolchain options](toolchain-opts.md)" >> $overview

###################################################################################################

#  list-toolchain doc
echo "eb --list-toolchains"
eb --list-toolchains --output-format md | sed 's/^\(# .*\)/\1 {: #toolchains_table }/g' > toolchains.md
echo >> toolchains.md
echo "*(see also* \`\`eb --list-toolchains\`\` *)*" >> toolchains.md

echo "* [List of known toolchains](toolchains.md)" >> $overview

###################################################################################################

echo "eb --list-software=detailed"
skip_lines='Temporary log file|Processed.*simpleconfigs|Found.*different software packages|^# List of supported software'
echo "# List of supported software" > supported-software.md
echo >> supported-software.md
echo "!!! note" >> supported-software.md
echo >> supported-software.md
echo "    This page contains a lot of information, it may take a while to load." >> supported-software.md
echo >> supported-software.md
eb --list-software=detailed --output-format=md | egrep -v $skip_lines >> supported-software.md

echo "* [List of supported software](supported-software.md)" >> $overview

###################################################################################################

#  help doc
echo "eb --help"
echo "# SimpleBuild configuration options {: #basic_usage_help }" > eb-help.md
echo >> eb-help.md
echo "*(corresponds with output of* \`\`eb --help\`\` *)*" >> eb-help.md
echo >> eb-help.md
eb --help=md | sed "s@$HOME@/home/example@g" | sed "s@$USER@example@g" >> eb-help.md
echo >> eb-help.md
echo "*(see also* \`\`eb --help\`\` *)*" >> eb-help.md

echo "* [Overview of SimpleBuild configuration options](eb-help.md)" >> $overview

###################################################################################################

#  generic simpleblocks doc
echo "generic simpleblocks"
python3 $generic_simpleblocks_script | sed 's/^\(# .*\)/\1 {: #generic_simpleblocks }/g' > generic-simpleblocks.md

echo "* [Overview of generic simpleblocks](generic-simpleblocks.md)" >> $overview

###################################################################################################

# available simpleconfig templates
echo "eb --avail-simpleconfig-templates"
echo "# Available template values for simpleconfigs {: #avail_simpleconfig_templates }" > simpleconfig-templates.md
echo >> simpleconfig-templates.md
eb --avail-simpleconfig-templates --output-format md >> simpleconfig-templates.md
echo >> simpleconfig-templates.md
echo "*(see also* \`\`eb --avail-simpleconfig-templates\`\` *)*" >> simpleconfig-templates.md

echo "* [Templates available for simpleconfig files](simpleconfig-templates.md)" >> $overview

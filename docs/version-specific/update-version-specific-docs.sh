#!/bin/bash
##
# Copyright 2015-2022 Ghent University
#
# This file is part of EasyBuild,
# originally created by the HPC team of Ghent University (http://ugent.be/hpc/en),
# with support of Ghent University (http://ugent.be/hpc),
# the Flemish Supercomputer Centre (VSC) (https://vscentrum.be/nl/en),
# the Hercules foundation (http://www.herculesstichting.be/in_English)
# and the Department of Economy, Science and Innovation (EWI) (http://www.ewi-vlaanderen.be/en).
#
# https://github.com/easybuilders/easybuild
#
# EasyBuild is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation v2.
#
# EasyBuild is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with EasyBuild.  If not, see <http://www.gnu.org/licenses/>.
##

# This script generates all EasyBuild documentation that can be automatically updated.
#
# authors: Caroline De Brouwer, Kenneth Hoste (HPC-UGent)

set -euo pipefail

export LC_ALL=en_US.UTF-8

if [[ ! $PWD =~ .*/easybuild-docs/docs/version-specific$ ]]; then
    echo "$(basename $0) script should be run from easybuild-docs/docs/version-specific ($PWD)"
    exit 1
fi

generic_easyblocks_script=./gen_easyblocks_docs.py

if [ ! -f $generic_easyblocks_script ]; then
    echo "Could not find required script: $generic_easyblocks_script" >&2
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

#  available easyconfig params
echo "eb --avail-easyconfig-params"
eb --avail-easyconfig-params --output-format md | sed 's/^\(# .*\)/\1 {: #vsd_avail_easyconfig_params }/g' > easyconfig-parameters.md
echo >> easyconfig-parameters.md
echo "*(see also* \`\`eb -a\`\` or \`\`eb --avail-easyconfig-params\`\` *)*" >> easyconfig-parameters.md

echo "* [Available easyconfig parameters](easyconfig-parameters.md)" >> $overview

###################################################################################################

# available easyconfig constants
echo "eb --avail-easyconfig-constants"
eb --avail-easyconfig-constants --output-format md | sed "s@$HOME@/home/example@g" | sed "s@$USER@example@g" | sed 's/^\(# .*\)/\1 {: #avail_easyconfig_constants }/g' > easyconfig-constants.md
echo >> easyconfig-constants.md
echo "*(see also* \`\`eb --avail-easyconfig-constants\`\` *)*" >> easyconfig-constants.md
echo "* [Constants available for easyconfig files](easyconfig-constants.md)" >> $overview

###################################################################################################

# available easyconfig licenses
echo "eb --avail-easyconfig-licenses"
eb --avail-easyconfig-licenses --output-format md | sed 's/^\(# .*\)/\1 {: #avail_easyconfig_licenses }/g' > easyconfig-license-constants.md
echo >> easyconfig-license-constants.md
echo "*(see also* \`\`eb --avail-easyconfig-licenses\`\` *)*" >> easyconfig-license-constants.md
echo "* [License constants available for easyconfig files](easyconfig-license-constants.md)" >> $overview

###################################################################################################

#  list-easyblocks doc
echo "eb --list-easyblocks"
echo "# List of easyblocks {: #vsd_list_easyblocks }" > easyblocks.md
echo >> easyblocks.md
eb --list-easyblocks --output-format md >> easyblocks.md
echo >> easyblocks.md
echo "*(see also* \`\`eb --list-easyblocks\`\` and* [*overview of generic easyblocks*][generic_easyblocks] *)*" >> easyblocks.md
echo "* [List of available easyblocks](easyblocks.md)" >> $overview

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

tmp_software_json="$(mktemp)"
echo "eb --list-software=detailed"
skip_lines='Temporary log file|Processed.*easyconfigs|Found.*different software packages|^# List of supported software'
eb --list-software=detailed --output-format=json | egrep -v "$skip_lines" > ${tmp_software_json}
python3 software-markdown-pages.py --jsonfile ${tmp_software_json} --output-base supported-software --delete-existing-output
rm ${tmp_software_json}

echo "* [List of supported software](supported-software/index.md)" >> $overview

###################################################################################################

#  help doc
echo "eb --help"
echo "# EasyBuild configuration options {: #basic_usage_help }" > eb-help.md
echo >> eb-help.md
echo "*(corresponds with output of* \`\`eb --help\`\` *)*" >> eb-help.md
echo >> eb-help.md
eb --help=md | sed "s@$HOME@/home/example@g" | sed "s@$USER@example@g" >> eb-help.md
echo >> eb-help.md
echo "*(see also* \`\`eb --help\`\` *)*" >> eb-help.md

echo "* [Overview of EasyBuild configuration options](eb-help.md)" >> $overview

###################################################################################################

#  generic easyblocks doc
echo "generic easyblocks"
python3 $generic_easyblocks_script | sed 's/^\(# .*\)/\1 {: #generic_easyblocks }/g' > generic-easyblocks.md

echo "* [Overview of generic easyblocks](generic-easyblocks.md)" >> $overview

###################################################################################################

# available easyconfig templates
echo "eb --avail-easyconfig-templates"
echo "# Available template values for easyconfigs {: #avail_easyconfig_templates }" > easyconfig-templates.md
echo >> easyconfig-templates.md
eb --avail-easyconfig-templates --output-format md >> easyconfig-templates.md
echo >> easyconfig-templates.md
echo "*(see also* \`\`eb --avail-easyconfig-templates\`\` *)*" >> easyconfig-templates.md

echo "* [Templates available for easyconfig files](easyconfig-templates.md)" >> $overview

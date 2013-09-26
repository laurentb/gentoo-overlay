# Copyright 2012-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit distutils-r1

if [[ ${PR} == 'r0' ]]; then
	FIX=""
elif [[ ${PR} == 'r1' ]]; then
	FIX="-fix"
else
	FIX="-fix${PR/r/}"
fi

DESCRIPTION="Shell interface for docopt, the command-line interface description language"
HOMEPAGE="https://github.com/docopt/docopts
https://pypi.python.org/pypi/docopts"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}${FIX}.tar.gz"

S="${WORKDIR}/${P}${FIX}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/docopt[${PYTHON_USEDEP}]"

DOCS=( README.rst )

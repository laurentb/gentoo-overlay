# Copyright 2013-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Defines override classes that should be included with pies only if running on Python2"
HOMEPAGE="https://pypi.python.org/pypi/pies2overrides
https://github.com/timothycrosley/pies"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="virtual/python-argparse[${PYTHON_USEDEP}]
python_targets_python2_6? ( dev-python/ordereddict[python_targets_python2_6] )
dev-python/ipaddress[${PYTHON_USEDEP}]"

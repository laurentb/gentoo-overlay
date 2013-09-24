# Copyright 2011-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Convert JSON to a UNIX-friendly line-based format"
HOMEPAGE="https://github.com/dvxhouse/jsonpipe
https://pypi.python.org/pypi/jsonpipe"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/simplejson[${PYTHON_USEDEP}]
virtual/python-argparse[${PYTHON_USEDEP}]
>=dev-python/calabash-0.0.3[${PYTHON_USEDEP}]"

src_prepare() {
	sed -i "s/'argparse>=1.1', //" setup.py
	sed -i "s/calabash==/calabash>=/" setup.py
}

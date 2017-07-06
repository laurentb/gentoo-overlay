# Copyright 2012-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="Small tool to interact with shell pipes"
HOMEPAGE="https://pypi.python.org/pypi/chut
https://github.com/gawel/chut"
SRC_URI="https://pypi.python.org/packages/bc/3a/93b3235398e40a3ffe284fc233d7e4872994dc7662f537476a8d2ab940ec/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/six[${PYTHON_USEDEP}]
dev-python/docopt[${PYTHON_USEDEP}]
dev-python/ConfigObject[${PYTHON_USEDEP}]
virtual/python-pathlib[${PYTHON_USEDEP}]"

DOCS=( README.rst docs/. )

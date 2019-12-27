# Copyright 2012-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{3_5,3_6,3_7,3_8} )

inherit distutils-r1

DESCRIPTION="Small tool to interact with shell pipes"
HOMEPAGE="https://pypi.org/project/chut/
https://github.com/gawel/chut"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

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

src_prepare() {
	default

	sed -i "s/'pathlib', //" setup.py
}

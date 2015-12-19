# Copyright 2014-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Python Task Warrior library"
HOMEPAGE="https://pypi.python.org/pypi/tasklib
https://github.com/robgolding63/tasklib"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=app-misc/task-2.1.0
>=dev-python/six-1.5.2[${PYTHON_USEDEP}]
dev-python/pytz[${PYTHON_USEDEP}]
dev-python/tzlocal[${PYTHON_USEDEP}]"

DOCS=( README.rst LICENSE )

src_prepare() {
	sed -i 's/six==/six>=/' setup.py
}

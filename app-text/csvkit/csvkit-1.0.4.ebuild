# Copyright 2017-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_5,3_6,3_7,3_8} )

inherit distutils-r1

DESCRIPTION="A suite of utilities for converting to and working with CSV"
HOMEPAGE="https://csvkit.readthedocs.io/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
	>=dev-python/agate-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/agate-excel-0.2.2[${PYTHON_USEDEP}]
	>=dev-python/agate-dbf-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/agate-sql-0.5.3[${PYTHON_USEDEP}]
	>=dev-python/six-1.6.1[${PYTHON_USEDEP}]"

DOCS=( COPYING README.rst )

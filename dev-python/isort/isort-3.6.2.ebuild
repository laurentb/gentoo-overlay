# Copyright 2013-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="A Python utility / library to sort Python imports"
HOMEPAGE="https://pypi.python.org/pypi/isort
https://github.com/timothycrosley/isort"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=dev-python/natsort-3.0.0[${PYTHON_USEDEP}]
>=dev-python/pies-2.0.0[${PYTHON_USEDEP}]"

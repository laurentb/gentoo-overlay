# Copyright 2013-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="Implementation of per object permissions for Django"
HOMEPAGE="https://pypi.python.org/pypi/django-guardian"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~x86"
IUSE=""

LICENSE="BSD"
SLOT="0"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=dev-python/django-1.2[${PYTHON_USEDEP}]
dev-python/six[${PYTHON_USEDEP}]"

DOCS=( README.rst LICENSE CHANGES )

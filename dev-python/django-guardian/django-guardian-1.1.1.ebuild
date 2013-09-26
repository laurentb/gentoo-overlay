# Copyright 2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Implementation of per object permissions for Django"
HOMEPAGE="https://pypi.python.org/pypi/django-guardian"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~x86"
IUSE=""

LICENSE="BSD"
SLOT="0"

RDEPEND=">=dev-python/django-1.2[${PYTHON_USEDEP}]"
DEPEND=""

DOCS=( README.rst LICENSE CHANGES )

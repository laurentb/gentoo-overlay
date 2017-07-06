# Copyright 2016-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="Kitchen contains a cornucopia of useful code"
HOMEPAGE="https://pypi.python.org/pypi/kitchen
https://fedorahosted.org/kitchen"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

DOCS=( COPYING COPYING.LESSER README.rst NEWS.rst HACKING.rst )

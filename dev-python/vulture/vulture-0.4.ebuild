# Copyright 2012-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_1,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="Find dead code (unused classes, functions and variables)"
HOMEPAGE="https://pypi.python.org/pypi/vulture
https://bitbucket.org/jendrikseipp/vulture"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=( README.txt NEWS.txt LICENSE.txt )

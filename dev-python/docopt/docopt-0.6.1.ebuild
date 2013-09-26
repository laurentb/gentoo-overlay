# Copyright 2012-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

SUPPORT_PYTHON_ABIS="1"

inherit distutils-r1

DESCRIPTION="Pythonic argument parser"
HOMEPAGE="http://docopt.org/
https://pypi.python.org/pypi/docopt"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=( README.rst LICENSE-MIT )

# Copyright 2011-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3
PYTHON_DEPEND="*:2.5"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="ANSII Color formatting for output in terminal."
HOMEPAGE="http://pypi.python.org/pypi/termcolor"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

PYTHON_MODNAME="${PN}.py"
DOCS="README.rst CHANGES.rst COPYING.txt"

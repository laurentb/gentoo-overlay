# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3
PYTHON_DEPEND="*:2.4"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="ANSII Color formatting for output in terminal."
HOMEPAGE="http://pypi.python.org/pypi/termcolor"
SRC_URI="http://pypi.python.org/packages/source/t/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

PYTHON_MODNAME="${PN}.py"
DOCS="README.rst CHANGES.rst COPYING.txt"

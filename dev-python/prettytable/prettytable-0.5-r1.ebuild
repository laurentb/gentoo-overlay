# Copyright 2010-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3
PYTHON_DEPEND="2:2.4"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="A simple Python library for easily displaying tabular data in a
visually appealing ASCII table format."
HOMEPAGE="https://code.google.com/p/prettytable/
http://pypi.python.org/pypi/PrettyTable"
MY_PN="PrettyTable"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

PYTHON_MODNAME="${PN}.py"

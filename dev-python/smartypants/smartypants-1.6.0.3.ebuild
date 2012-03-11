# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit base distutils

DESCRIPTION="SmartyPants: a smart-quotes plugin."
HOMEPAGE="http://web.chad.org/projects/smartypants.py/
http://pypi.python.org/pypi/smartypants/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="BSD"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

DOCS="COPYING README"

PYTHON_MODNAME="${PN}.py"

# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3
PYTHON_DEPEND="2:2.5 3:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Annoying helper module that finds unicode/bytestring
comparisions and other problems."
HOMEPAGE="http://github.com/mitsuhiko/unicode-nazi
http://pypi.python.org/pypi/unicode-nazi"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

PYTHON_MODNAME="${PN/-/}.py"

DOCS="README"

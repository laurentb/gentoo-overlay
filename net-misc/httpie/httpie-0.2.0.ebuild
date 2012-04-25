# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="HTTPie is a CLI, cURL-like tool for humans"
HOMEPAGE="https://github.com/jkbr/httpie
http://pypi.python.org/pypi/httpie"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-python/requests-0.10.4
	>=dev-python/pygments-1.4
	|| ( dev-lang/python:2.7 dev-python/argparse )"

DOCS="README.rst LICENSE"

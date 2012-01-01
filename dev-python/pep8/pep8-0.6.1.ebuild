# Copyright 2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3
PYTHON_DEPEND="2:2.4 3:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="pep8 is a tool to check your Python code against some of the style
conventions in PEP 8."
HOMEPAGE="http://pypi.python.org/pypi/pep8
https://github.com/jcrocholl/pep8"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS="README.rst CHANGES.txt TODO.txt"

DEPEND=""
RDEPEND=""

PYTHON_MODNAME="${PN}.py"

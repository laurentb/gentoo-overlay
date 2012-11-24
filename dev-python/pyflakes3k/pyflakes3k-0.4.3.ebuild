# Copyright 2011-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
PYTHON_DEPEND="3:3.1"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.*"

inherit distutils

DESCRIPTION="passive checker of Python programs (py3k port)"
HOMEPAGE="http://pypi.python.org/pypi/pyflakes3k
http://bitbucket.org/hsoft/pyflakes3k"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS="README"

DEPEND=""
RDEPEND=""

src_prepare() {
	mv bin/pyflakes bin/pyflakes3k
	sed -i 's#bin/pyflakes#bin/pyflakes3k#' setup.py
}

PYTHON_MODNAME="pyflakes"

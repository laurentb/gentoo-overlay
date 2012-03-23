# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
PYTHON_DEPEND="2:2.5 3:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit eutils distutils

DESCRIPTION="Python Command-line Application Tools"
HOMEPAGE="https://github.com/kennethreitz/clint
http://pypi.python.org/pypi/clint"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	# https://github.com/kennethreitz/clint/issues/33
	epatch "${FILESDIR}"/fix-data-files.patch
}

DOCS="HISTORY.rst README.rst LICENSE AUTHORS NOTICE"

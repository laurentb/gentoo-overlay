# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="XML elements is a Python library designed
to make it easy to work with XML"
HOMEPAGE="http://home.avvanta.com/~steveha/xe.html"
SRC_URI="http://home.avvanta.com/~steveha/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

PYTHON_MODNAME="${PN}.py"

src_prepare() {
	sed -i '/not possible to reach this line/d' xe.py
}

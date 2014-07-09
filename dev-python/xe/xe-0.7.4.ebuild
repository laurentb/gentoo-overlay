# Copyright 2012-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="XML elements is a Python library designed
to make it easy to work with XML"
HOMEPAGE="http://home.avvanta.com/~steveha/xe.html"
SRC_URI="http://home.avvanta.com/~steveha/${P}.tar.gz
http://www.blarg.net/~steveha/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=( README.txt TODO psf.txt )

src_prepare() {
	sed -i '/not possible to reach this line/d' xe.py
}

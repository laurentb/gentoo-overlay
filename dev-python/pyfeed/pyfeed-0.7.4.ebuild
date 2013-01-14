# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Python modules for working with syndication feeds"
HOMEPAGE="http://home.avvanta.com/~steveha/pyfeed.html"
SRC_URI="http://home.avvanta.com/~steveha/${P}.tar.gz
http://www.blarg.net/~steveha/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/xe"

PYTHON_MODNAME="feed"

DOCS="README.txt TODO examples"

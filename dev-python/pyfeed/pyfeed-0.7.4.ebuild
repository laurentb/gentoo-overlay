# Copyright 2012-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Python modules for working with syndication feeds"
HOMEPAGE="http://home.avvanta.com/~steveha/pyfeed.html"
SRC_URI="http://home.avvanta.com/~steveha/${P}.tar.gz
http://www.blarg.net/~steveha/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/xe[${PYTHON_USEDEP}]"

DOCS=( README.txt TODO examples psf.txt )

# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="On-screen text file reader employing Rapid Serial Visual Presentation."
SRC_URI="mirror://sourceforge/dictator/${P}.tar.gz"
HOMEPAGE="http://dictator.kieranholland.com/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-python/wxpython[${PYTHON_USEDEP}]"

src_prepare() {
	mkdir bin
	mv "dictator_start.py" "bin/dictator"
	sed -i 's#dictator_start\.py#bin/dictator#' "setup.py"
}

DOCS=( doc/. )

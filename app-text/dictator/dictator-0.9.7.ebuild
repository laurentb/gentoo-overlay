# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="On-screen text file reader employing Rapid Serial Visual Presentation."
SRC_URI="mirror://sourceforge/dictator/${P}.tar.gz"
HOMEPAGE="http://dictator.kieranholland.com/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/wxpython[${PYTHON_USEDEP}]"

src_prepare() {
	default

	mkdir bin
	mv "dictator_start.py" "bin/dictator"
	sed -i 's#dictator_start\.py#bin/dictator#' "setup.py"
}

DOCS=( doc/. )

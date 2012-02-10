# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="On-screen text file reader employing Rapid Serial Visual Presentation."
SRC_URI="mirror://sourceforge/dictator/${P}.tar.gz"
HOMEPAGE="http://dictator.kieranholland.com/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	>=x11-libs/gtk+-2.4
	>=dev-python/wxpython-2.4.2.4"

src_prepare() {
	default
	mkdir bin
	mv "dictator_start.py" "bin/dictator"
	sed -i 's#dictator_start\.py#bin/dictator#' "setup.py"
}

src_install() {
	distutils_src_install
	dodoc doc/*
}

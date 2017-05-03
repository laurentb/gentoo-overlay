# Copyright 2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{3_4,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="Compute the DR14 value of the given audio files"
HOMEPAGE="http://dr14tmeter.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="virtual/ffmpeg[encode]
	media-libs/flac
	media-sound/lame
	media-sound/vorbis-tools
	dev-python/numpy[${PYTHON_USEDEP}]"

src_prepare() {
	default

	sed -i '/cmdclass/d' setup.py
}


python_install_all() {
	distutils-r1_python_install_all

	doman man/dr14_tmeter.1
}


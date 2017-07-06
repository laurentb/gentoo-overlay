# Copyright 2011-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit cmake-utils

DESCRIPTION="GUI application to submit audio fingerprints to the Acoustid database."
HOMEPAGE="https://acoustid.org/fingerprinter"
SRC_URI="https://bitbucket.org/acoustid/${PN}/downloads/${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE=""
DEPEND="dev-qt/qtgui
	media-libs/chromaprint
	virtual/ffmpeg"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/0001-libav.patch" "${FILESDIR}/0002-libav.patch" )

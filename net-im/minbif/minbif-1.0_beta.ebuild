# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit cmake-utils

DESCRIPTION="an IRC instant messaging gateway, using libpurple"
HOMEPAGE="http://symlink.me/projects/show/minbif"
SRC_URI="http://symlink.me/attachments/download/22/${P/_}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="libcaca"

DEPEND="net-im/pidgin
	libcaca? ( media-libs/libcaca[imlib] )"
RDEPEND="${DEPEND}"

#S=${WORKDIR}/${P/_}
S=${WORKDIR}

src_prepare() {
	sed -i "s/-Werror//g" CMakeLists.txt || die "sed failed"
}

src_configure() {
	local mycmakeargs
	use libcaca || mycmakeargs="${mycmakeargs} -DENABLE_CACA=0 -DENABLE_VIDEO=0"
	
	cmake-utils_src_configure
}

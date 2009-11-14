# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit cmake-utils

DESCRIPTION="an IRC instant messaging gateway, using libpurple"
HOMEPAGE="http://symlink.me/projects/show/minbif"
SRC_URI="http://symlink.me/attachments/download/27/${P/_}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+libcaca gstreamer"

DEPEND="net-im/pidgin[gstreamer?]
	libcaca? ( media-libs/libcaca[imlib] )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/minbif"

src_prepare() {
	sed -i "s/-Werror//g" CMakeLists.txt || die "sed failed"
}

src_configure() {
	local mycmakeargs
	mycmakeargs="${mycmakeargs}
		$(cmake-utils_use_with libcaca CACA)
		$(cmake-utils_use_with gstreamer VIDEO)
	"

	cmake-utils_src_configure
}

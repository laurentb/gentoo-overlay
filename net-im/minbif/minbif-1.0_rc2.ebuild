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
	libcaca? ( media-libs/libcaca[imlib] media-libs/imlib2[png] )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/minbif"

src_prepare() {
	sed -i "s/-Werror//g" CMakeLists.txt || die "sed failed"
	rm "doc/Doxyfile"
}

src_configure() {
	local mycmakeargs
	mycmakeargs="${mycmakeargs}
		-DCONF_PREFIX=${PREFIX:-/etc/minbif}
		$(cmake-utils_use_with libcaca CACA)
		$(cmake-utils_use_with gstreamer VIDEO)
	"

	cmake-utils_src_configure
}

pkg_setup() {
	einfo
	elog If you only want libpurple, you can emerge
	elog net-im/pidgin with the -gtk -ncurses flags.
	einfo
}

pkg_preinst() {
	enewgroup minbif
	enewuser minbif -1 -1 /var/lib/minbif minbif
}

src_install() {
	cmake-utils_src_install

	dodoc README COPYING
	doman man/minbif.8

	dodir /usr/share/minbif
	insinto /usr/share/minbif
	doins -r scripts

	keepdir /var/lib/minbif
	fperms 700 /var/lib/minbif
	fowners minbif:minbif /var/lib/minbif

	keepdir /var/run/minbif
	fperms 700 /var/run/minbif
	fowners minbif:minbif /var/run/minbif

	newinitd "${FILESDIR}"/minbif.initd minbif || die
}


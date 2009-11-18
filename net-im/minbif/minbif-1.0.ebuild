# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit cmake-utils eutils

DESCRIPTION="an IRC instant messaging gateway, using libpurple"
HOMEPAGE="http://symlink.me/projects/show/minbif"
SRC_URI="http://symlink.me/attachments/download/30/${P/_}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+libcaca gstreamer -xinetd +syslog"

DEPEND="net-im/pidgin[gstreamer?]
	libcaca? ( media-libs/libcaca[imlib] media-libs/imlib2[png] )"
RDEPEND="${DEPEND}
		xinetd? ( sys-apps/xinetd )
		syslog? ( virtual/logger )"

src_prepare() {
	sed -i "s/-Werror//g" CMakeLists.txt || die "sed failed"

	sed -i "s#share/doc/minbif)#share/doc/${P})#" \
		CMakeLists.txt || die "sed failed"

	use xinetd && { sed -i "s/type\s=\s[0-9]/type = 0/" \
		minbif.conf || die "sed failed"; }

	use syslog || { sed -i "s/to_syslog\s=\strue/to_syslog = false/" \
		minbif.conf || die "sed failed"; }

	rm "doc/Doxyfile"
	mv "doc/minbif.xinetd" ./
}

src_configure() {
	append-flags "-DX_DISPLAY_MISSING"

	use libcaca || { use gstreamer && \
		die "You need to enable libcaca if you enable gstreamer"; }

	local mycmakeargs
	mycmakeargs="${mycmakeargs}
		-DCONF_PREFIX=${PREFIX:-/etc/minbif}
		$(cmake-utils_use_enable libcaca CACA)
		$(cmake-utils_use_enable gstreamer VIDEO)
	"

	cmake-utils_src_configure
}

pkg_setup() {
	einfo If you only want libpurple, you can emerge
	einfo net-im/pidgin with the -gtk -ncurses flags.

	if use xinetd; then
		elog
		ewarn Unlike BitlBee, inetd mode is not the recommended
		ewarn way of operation, since the daemon mode is stable.
	fi
}

pkg_postinst() {
	elog
	elog irssi scripts are located in /usr/share/minbif
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

	if use xinetd; then
		insinto /etc/xinetd.d
		newins minbif.xinetd minbif
	fi

	diropts -o minbif -g minbif -m0700
	keepdir /var/lib/minbif

	diropts -o minbif -g minbif -m0700
	keepdir /var/run/minbif

	newinitd "${FILESDIR}"/minbif.initd minbif || die
}


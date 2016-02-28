# Copyright 2009-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils user systemd
[ "$PV" == "9999" ] \
	&& EGIT_REPO_URI="git://git.symlink.me/pub/romain/${PN}.git" \
	&& inherit git-r3

DESCRIPTION="an IRC instant messaging gateway, using libpurple"
HOMEPAGE="http://minbif.im/"

if [ "$PV" != "9999" ]; then
	SRC_URI="https://symlink.me/attachments/download/148/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
else
	SRC_URI=""
	KEYWORDS=""
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="debug gnutls +imlib +libcaca pam +syslog video -xinetd"

DEPEND=">=net-im/pidgin-2.7.10
	video? ( >=net-im/pidgin-2.7[gstreamer] )
	libcaca? ( media-libs/libcaca[imlib] )
	imlib? ( media-libs/imlib2[png] )
	pam? ( sys-libs/pam )
	gnutls? ( net-libs/gnutls )"
RDEPEND="${DEPEND}
	xinetd? ( sys-apps/xinetd )
	syslog? ( virtual/logger )"

src_prepare() {
	default

	if [ "$PV" != "9999" ]; then
		eapply "${FILESDIR}/${PN}-1.0.5-glib-single-includes.patch"
		eapply "${FILESDIR}/${PN}-1.0.5-gcc47.patch"
		eapply "${FILESDIR}/${PN}-1.0.5-imlib.patch"
	fi

	sed -i "s#share/doc/minbif)#share/doc/${PF})#" CMakeLists.txt

	use xinetd && sed -i "s/type\s=\s[0-9]/type = 0/" minbif.conf

	use syslog || sed -i "s/to_syslog\s=\strue/to_syslog = false/" minbif.conf

	rm "doc/Doxyfile"
	mv "doc/minbif.xinetd" ./
}

src_configure() {
	append-flags "-DX_DISPLAY_MISSING"

	local mycmakeargs
	mycmakeargs=(
		-DCONF_PREFIX=/etc/minbif
		-DENABLE_CACA="$(usex libcaca)"
		-DENABLE_DEBUG="$(usex debug)"
		-DENABLE_IMLIB="$(usex imlib)"
		-DENABLE_PAM="$(usex pam)"
		-DENABLE_TLS="$(usex gnutls)"
		-DENABLE_VIDEO="$(usex video)"
	)

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

pkg_setup() {
	enewgroup minbif
	enewuser minbif -1 -1 /var/lib/minbif minbif
}

src_install() {
	cmake-utils_src_install

	dodoc AUTHORS README COPYING ChangeLog
	doman man/minbif.8

	dodir /usr/share/minbif
	insinto /usr/share/minbif
	doins -r scripts

	if use xinetd; then
		insinto /etc/xinetd.d
		newins minbif.xinetd minbif
	fi

	systemd_dounit "${FILESDIR}/minbif.service"
	systemd_newtmpfilesd "${FILESDIR}/tmpfiles.d-minbif.conf" "minbif.conf"

	diropts -o minbif -g minbif -m0700
	keepdir /var/lib/minbif

	newinitd "${FILESDIR}"/minbif.initd minbif
}

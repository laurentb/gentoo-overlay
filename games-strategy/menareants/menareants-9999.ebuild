# Copyright 2005-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit autotools eutils
[ "$PV" == "9999" ] \
	&& EGIT_REPO_URI="git://git.symlink.me/pub/romain/${PN}.git" \
	&& inherit git-r3

DESCRIPTION="Men Are Ants is a strategic turn by turn
(simultaneous) game with solo and multiplayer modes."
HOMEPAGE="http://menareants.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug server +game meta-server"

DEPEND="
	game? (
		>=media-libs/libsdl-1.2.6[X,sound,video]
		>=media-libs/sdl-ttf-2.0[X]
		>=media-libs/sdl-image-1.2[png]
		>=media-libs/sdl-mixer-1.2.6[wav,vorbis]
		>=media-libs/sdl-gfx-2.0
		)"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable debug) \
		$(use_enable server) \
		$(use_enable meta-server) \
		$(use_enable game)
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc API AUTHORS DEVELOPPEURS COPYING ChangeLog NEWS README TODO
	doman src/menareants.6
	use server && doman server/menareants-server.6
	use meta-server && doman meta-server/menareants-meta-server.6
	{ use server || use meta-server ;} && dodoc doc/ADMINS
}

pkg_postinst() {
	if use server
	then
		echo
		einfo "For now, menareants-server should be run " && \
		einfo "as an user with a valid user directory." && \
		echo
	fi
}

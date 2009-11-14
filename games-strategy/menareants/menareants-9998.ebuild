inherit eutils git games

DESCRIPTION="Men Are Ants is a strategic turn by turn \
(simultaneous) game with solo and multiplayer modes. \
0.4 stable branch."
HOMEPAGE="http://menareants.org/"

EGIT_REPO_URI="git://git.symlink.me/pub/menareants/0.4.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug server +game meta-server"

DEPEND="
	game? (
		>=media-libs/libsdl-1.2.6
		>=media-libs/sdl-ttf-2.0
		>=media-libs/sdl-image-1.2
		>=media-libs/sdl-mixer-1.2.6
		>=media-libs/sdl-gfx-2.0
		)"
RDEPEND="${DEPEND}"

src_unpack() {
	git_src_unpack
}

src_compile() {
	# needed because we are using git
	NOCONFIGURE=1 ./autogen.sh || die "autogen.sh failed"

	egamesconf \
		$(use_enable debug) \
		$(use_enable server) \
		$(use_enable meta-server) \
		$(use_enable game) \
		|| die

	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc API AUTHORS DEVELOPPEURS COPYING ChangeLog NEWS README TODO WIN32
	doman src/menareants.6
	useq server && doman server/menareants-server.6
	useq meta-server && doman meta-server/menareants-meta-server.6

	prepgamesdirs
}

pkg_postinst() {
	if useq server
	then
		echo
		einfo "For now, menareants-server should be run " && \
		einfo "as an user with a valid user directory." && \
		echo
	fi
	games_pkg_postinst
}

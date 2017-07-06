# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit toolchain-funcs git-r3

DESCRIPTION="Make pointer-driven interfaces easier and faster for users to operate"
HOMEPAGE="https://github.com/jordansissel/keynav"
EGIT_REPO_URI="git://github.com/jordansissel/keynav.git"
EGIT_COMMIT="4ae486db6697877e84b66583a0502afc7301ba16"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/cairo[X]
	x11-libs/libXinerama
	>=x11-misc/xdotool-3.0
	>=dev-libs/glib-2.0"
DEPEND="x11-proto/xproto
	${RDEPEND}"

src_prepare() {
	default

	sed -i 's/^[A-Z]\+FLAGS+=-pg -g$//' Makefile
}

src_compile() {
	tc-export CC LD

	default
}

src_install() {
	dodoc README CHANGELIST COPYRIGHT
	dobin keynav

	insinto /etc
	doins keynavrc
}

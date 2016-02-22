# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit toolchain-funcs

DESCRIPTION="Make pointer-driven interfaces easier and faster for users to operate"
HOMEPAGE="http://www.semicomplete.com/projects/keynav/"
SRC_URI="http://semicomplete.googlecode.com/files/${PN}-0.${PV}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${PN}-0.${PV}"

RDEPEND="x11-libs/cairo[X]
	x11-libs/libXinerama
	>=x11-misc/xdotool-2.0
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

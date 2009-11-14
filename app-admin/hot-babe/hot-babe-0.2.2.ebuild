# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Displays the system activity in a very special way ;-)"
HOMEPAGE="http://dindinx.net/hotbabe/"
SRC_URI="http://dindinx.net/hotbabe/downloads/${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="offensive"
RESTRICT="nomirror"

DEPEND="=x11-libs/gtk+-2*"

pkg_setup() {
	use offensive || die "You need USE=offensive to emerge"
}

src_compile() {
	emake PREFIX="/usr" || die "emake failed"
}

src_install() {
	make PREFIX="${D}"/usr install || die "install failed"
	mv "${D}"/usr/share/doc/{${PN},${PF}}
	newman "${D}"/usr/share/man/man1/${PN}.1 ${PN}.6
	rm -r "${D}"/usr/share/man/man1
}

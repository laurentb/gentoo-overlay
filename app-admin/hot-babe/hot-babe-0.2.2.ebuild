# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Displays the system activity in a very special way ;-)"
HOMEPAGE="http://hotbabe.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN/-/}/${PV}/${P}.tar.gz
http://packages.medibuntu.org/pool/free/${PN:0:1}/${PN}/${P}.orig.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="offensive"
RESTRICT="mirror"

DEPEND="x11-libs/gdk-pixbuf:2"
RDEPEND="${DEPEND}"

pkg_setup() {
	use offensive || die "You need USE=offensive to emerge"
}

src_compile() {
	emake PREFIX="/usr"
}

src_install() {
	emake install DESTDIR="${D}" PREFIX="/usr"

	dodoc -r "${D}/usr/share/doc/${PN}/"
	rm -r "${D}/usr/share/doc/${PN}/"
	newman "${D}/usr/share/man/man1/${PN}.1" "${PN}.6"
	rm -r "${D}/usr/share/man/man1"
}

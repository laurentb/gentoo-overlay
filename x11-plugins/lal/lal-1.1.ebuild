# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="lal is a clock for the dock. Nothing more, nothing less."
HOMEPAGE="http://projects.l3ib.org/lal/"
SRC_URI="http://projects.l3ib.org/lal/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/libX11
x11-libs/libXft"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_prepare() {
	sed -i 's/\$(CC) /$(CC) $(CFLAGS) /g' Makefile
}

src_install() {
	dobin lal
	dodoc README COPYING
	doman docs/lal.1
}

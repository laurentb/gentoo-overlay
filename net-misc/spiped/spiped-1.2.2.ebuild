# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit base

DESCRIPTION="Utility for creating symmetrically encrypted and authenticated
pipes between socket addresses."
HOMEPAGE="http://www.tarsnap.com/spiped.html"
SRC_URI="http://www.tarsnap.com/${PN}/${P}.tgz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/openssl"
RDEPEND="${RDEPEND}"

src_prepare() {
	sed -i '/strip.\+_inst/d' */Makefile
	mv spipe/README spipe.txt
	mv spiped/README spiped.txt
}

src_compile() {
	base_src_compile BINDIR="${D}/usr/bin"
}

src_install() {
	base_src_install BINDIR="${D}/usr/bin"
}

DOCS=(BUILDING CHANGELOG COPYRIGHT README STYLE spipe.txt spiped.txt)

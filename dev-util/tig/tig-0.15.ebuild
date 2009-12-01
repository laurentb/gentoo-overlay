# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

inherit bash-completion autotools

DESCRIPTION="Tig: text mode interface for git"
HOMEPAGE="http://jonas.nitro.dk/tig/"
SRC_URI="http://jonas.nitro.dk/tig/releases/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}
	dev-util/git"
DEPEND="${DEPEND}
	app-text/xmlto
	app-text/asciidoc"

src_compile() {
	default

	emake doc-man || die "emake doc-man failed"
}

src_install() {
	emake install install-doc-man DESTDIR="${D}" || die "emake install failed"

	dodoc manual.txt
	dohtml manual.html
	dobashcompletion contrib/tig-completion.bash
}

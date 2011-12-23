# Copyright 2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

EGIT_REPO_URI="git://github.com/klange/${PN}.git"
inherit git-2

DESCRIPTION="Nyancat rendered with various bits of ANSI"
HOMEPAGE="https://github.com/klange/nyancat http://miku.acm.uiuc.edu/"
SRC_URI=""

LICENSE="UoI-NCSA"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	dodoc README.md
	exeinto /usr/bin
	doexe src/${PN}
}

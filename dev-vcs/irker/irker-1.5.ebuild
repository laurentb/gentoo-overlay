# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit base

DESCRIPTION="Specialized IRC notification daemon"
HOMEPAGE="http://www.catb.org/esr/irker/"
SRC_URI="http://www.catb.org/~esr/irker/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="greenlets"

DEPEND="app-text/xmlto"
RDEPEND=">=dev-lang/python-2.6.0
>=dev-python/irc-3.0.0
greenlets? ( dev-python/eventlet )"

src_prepare() {
	sed -i 's/xmlto/xmlto --skip-validation/' Makefile
}

src_install() {
	base_src_install

	exeinto /usr/libexec
	doexe irkerhook.py
}

DOCS=(README NEWS BUGS COPYING hacking.txt install.txt security.txt)

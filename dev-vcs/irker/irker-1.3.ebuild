# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Specialized IRC notification daemon"
HOMEPAGE="http://www.catb.org/esr/irker/"
SRC_URI="http://www.catb.org/~esr/irker/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-text/xmlto"
RDEPEND=">=dev-python/irc-3.0.0"

src_prepare () {
	sed -i "s/VERS=.\+/VERS=${PV}/" Makefile
}

src_install() {
	emake ROOT="${D}" install
}

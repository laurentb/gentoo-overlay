# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit base user systemd python

DESCRIPTION="Specialized IRC notification daemon"
HOMEPAGE="http://www.catb.org/esr/irker/"
SRC_URI="http://www.catb.org/~esr/irker/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-text/xmlto
app-text/docbook-xml-dtd:4.1.2"
RDEPEND=">=dev-lang/python-2.6.0
>=dev-python/irc-3.2.1"

src_prepare() {
	base_src_prepare

	python_convert_shebangs 2 irk irkerd irkerhook.py
}

pkg_setup() {
	python_pkg_setup

	enewgroup irker
	enewuser irker -1 -1 -1 irker
}

src_install() {
	base_src_install SYSTEMDSYSTEMUNITDIR=$(systemd_get_unitdir)

	exeinto /usr/bin
	doexe irk

	exeinto /usr/libexec
	newexe irkerhook.py irkerhook

	newinitd "${FILESDIR}"/irkerd-init.d irker
}

DOCS=(README NEWS COPYING hacking.txt install.txt security.txt filter-example.py
filter-test.py)

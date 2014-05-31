# Copyright 2012-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit python-single-r1 systemd

DESCRIPTION="Specialized IRC notification daemon"
HOMEPAGE="http://www.catb.org/esr/irker/"
SRC_URI="http://www.catb.org/~esr/irker/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-text/docbook-xml-dtd:4.1.2
	app-text/xmlto"
RDEPEND="${PYTHON_DEPS}
virtual/python-argparse[${PYTHON_USEDEP}]"

src_prepare() {
	# Rely on systemd eclass for systemd service install
	sed -i -e "/^SYSTEMDSYSTEMUNITDIR/d" Makefile

	# Prefix support
	sed -i -e "/^ExecStart=/ s:=/:=${EROOT}:" irkerd.service
}

src_install() {
	emake DESTDIR="${ED}" install

	python_scriptinto /usr/bin
	python_doscript irk
	python_doscript irkerd

	python_scriptinto /usr/libexec
	python_newscript irkerhook.py irkerhook

	newinitd "${FILESDIR}"/irkerd-init.d irker
	newconfd "${FILESDIR}"/irkerd-conf.d irker

	systemd_dounit irkerd.service

	dodoc NEWS README hacking.txt security.txt
	dohtml irkerd.html irkerhook.html

	docinto examples
	dodoc filter-example.py filter-test.py
}

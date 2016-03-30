# Copyright 2012-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5} )


inherit python-single-r1

DESCRIPTION="Lift documents in nroff markups to XML-DocBook"
HOMEPAGE="http://www.catb.org/esr/doclifter/"
SRC_URI="http://www.catb.org/~esr/doclifter/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-text/docbook-xml-dtd:4.1.2
	app-text/xmlto"
RDEPEND="${PYTHON_DEPS}"

src_install() {
	python_scriptinto /usr/bin
	python_doscript doclifter manlifter

	doman doclifter.1 manlifter.1
	dodoc README COPYING TODO PATCHES doclifter.xml manlifter.xml
}

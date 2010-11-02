# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="3"
PYTHON_DEPEND="2:2.4"

inherit distutils

DESCRIPTION="Turn HTML into equivalent Markdown-structured text."
HOMEPAGE="http://www.aaronsw.com/2002/html2text/"
SRC_URI="http://www.aaronsw.com/2002/html2text/${P}.py"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack() {
	mkdir -pv "${S}"
	cp -v ${DISTDIR}/${A} "${S}"/html2text.py
	cp "${FILESDIR}/setup.py" "${S}"/

	sed -i "s/PACKAGEVERSION/${PV}/" "${S}/setup.py"
}

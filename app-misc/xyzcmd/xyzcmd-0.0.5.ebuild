# Copyright 2011-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="XYZCommander is a pure console visual file manager"
HOMEPAGE="http://xyzcmd.syhpoon.name/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.bz2"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	sed -i "s#share/doc/${PN}/#share/doc/${PF}/#" setup.py
	sed -i "s#share/doc/${PN}\"#share/doc/${PF}\"#" setup.py
}

DEPEND=""
RDEPEND="dev-python/urwid"

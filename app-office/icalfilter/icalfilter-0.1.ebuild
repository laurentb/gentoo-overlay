# Copyright 2011-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Swiss-army knife for iCalendar files; provides grep and sed-like features."
HOMEPAGE="http://dev.filyb.info/icalfilter/"
SRC_URI="http://code.filyb.info/${PN}/tags/${P}/dist/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	sed -i "s#'TODO'##" setup.py
	sed -i "s#share/${PN}/doc#share/doc/${PF}#" setup.py
}

DEPEND=""
RDEPEND="dev-python/python-dateutil
	dev-python/vobject
	virtual/python-argparse"

DOCS="INSTALL.rst LICENSE AUTHORS CHANGELOG README.rst"

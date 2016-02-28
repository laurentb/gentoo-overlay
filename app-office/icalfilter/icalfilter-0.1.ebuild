# Copyright 2011-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Swiss-army knife for iCalendar files; provides grep and sed-like features."
HOMEPAGE="http://dev.filyb.info/icalfilter/"
SRC_URI="http://code.filyb.info/${PN}/tags/${P}/dist/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	default

	sed -i "s#'TODO'##" setup.py
	sed -i "s#share/${PN}/doc#share/doc/${PF}#" setup.py
}

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/vobject[${PYTHON_USEDEP}]"

DOCS=( INSTALL.rst LICENSE AUTHORS CHANGELOG README.rst )

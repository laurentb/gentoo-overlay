# Copyright 2014-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Fixes some problems with Unicode text after the fact"
HOMEPAGE="https://pypi.python.org/pypi/ftfy
https://github.com/LuminosoInsight/python-ftfy"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/html5lib[${PYTHON_USEDEP}]
	dev-python/wcwidth[${PYTHON_USEDEP}]"

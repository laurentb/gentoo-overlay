# Copyright 2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="Python flexible slugify function"
HOMEPAGE="https://pypi.python.org/pypi/awesome-slugify"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
	dev-python/regex[${PYTHON_USEDEP}]
	>=dev-python/unidecode-0.04[${PYTHON_USEDEP}]
	<=dev-python/unidecode-0.05[${PYTHON_USEDEP}]"

# Copyright 2012-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_5,2_6,2_7,3_1,3_2} )

inherit distutils-r1

DESCRIPTION="py.test xdist plugin for distributed testing"
HOMEPAGE="https://pypi.python.org/pypi/pytest-xdist
https://bitbucket.org/hpk42/pytest-xdist"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/execnet[${PYTHON_USEDEP}]"

DOCS=( CHANGELOG LICENSE README.txt )

# Copyright 2012-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="py.test xdist plugin for distributed testing and loop-on-failing"
HOMEPAGE="https://pypi.python.org/pypi/pytest-xdist
https://bitbucket.org/hpk42/pytest-xdist"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=dev-python/pytest-2.4.2[${PYTHON_USEDEP}]
	>=dev-python/execnet-1.1[${PYTHON_USEDEP}]"

DOCS=( CHANGELOG LICENSE README.txt )

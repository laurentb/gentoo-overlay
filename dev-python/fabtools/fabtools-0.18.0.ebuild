# Copyright 2012-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Tools for writing awesome Fabric files"
HOMEPAGE="https://github.com/ronnix/fabtools
https://pypi.python.org/pypi/fabtools"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=dev-python/fabric-1.7.0[${PYTHON_USEDEP}]"

DOCS=( README.rst LICENSE docs/. )

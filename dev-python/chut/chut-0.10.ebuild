# Copyright 2012-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Small tool to interact with shell pipes"
HOMEPAGE="https://pypi.python.org/pypi/chut
https://github.com/gawel/chut"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/six[${PYTHON_USEDEP}]
dev-python/docopts[${PYTHON_USEDEP}]
dev-python/ConfigObject[${PYTHON_USEDEP}]"

DOCS=( README.rst )

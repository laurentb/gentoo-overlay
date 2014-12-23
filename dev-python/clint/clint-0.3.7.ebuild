# Copyright 2012-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit eutils distutils-r1

DESCRIPTION="Python Command-line Application Tools"
HOMEPAGE="https://github.com/kennethreitz/clint
https://pypi.python.org/pypi/clint"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/args[${PYTHON_USEDEP}]"

DOCS=( HISTORY.rst README.rst LICENSE AUTHORS NOTICE )

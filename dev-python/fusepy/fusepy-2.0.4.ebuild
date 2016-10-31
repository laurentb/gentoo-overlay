# Copyright 2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="A Python module that provides a simple interface to FUSE"
HOMEPAGE="https://pypi.python.org/pypi/fusepy
https://github.com/terencehonles/fusepy"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
sys-fs/fuse"
RDEPEND="!!dev-python/fuse-python"

DOCS=( README.rst )

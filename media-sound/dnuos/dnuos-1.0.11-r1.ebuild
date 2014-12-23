# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="A console program that creates lists of music collections, based
on directory structure."
HOMEPAGE="http://bitheap.org/dnuos/"
SRC_URI="http://bitheap.org/dnuos/files/${P}.tar.gz
mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

DOCS=( README.txt COPYING.txt LISEZMOI.txt )

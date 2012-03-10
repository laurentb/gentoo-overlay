# Copyright 2010-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="A console program that creates lists of music collections, based
on directory structure."
HOMEPAGE="http://bitheap.org/dnuos/"
SRC_URI="http://bitheap.org/dnuos/files/${P}.tar.gz
mirror://pypi/${PN:0:1}/{$PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS="README.txt COPYING.txt LISEZMOI.txt"

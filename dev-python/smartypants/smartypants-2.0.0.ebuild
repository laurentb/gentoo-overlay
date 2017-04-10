# Copyright 2012-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="SmartyPants: a smart-quotes plugin."
HOMEPAGE="https://bitbucket.org/livibetter/smartypants.py
https://pypi.python.org/pypi/smartypants"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="BSD"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=( README.rst COPYING CHANGES.rst )

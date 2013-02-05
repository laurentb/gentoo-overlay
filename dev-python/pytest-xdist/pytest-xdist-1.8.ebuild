# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.5 3:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="py.test xdist plugin for distributed testing"
HOMEPAGE="http://pypi.python.org/pypi/pytest-xdist
https://bitbucket.org/hpk42/pytest-xdist"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x64"
IUSE=""

DEPEND=""
RDEPEND=">=dev-python/pytest-2.2.1
	dev-python/execnet"

PYTHON_MODNAME="xdist"

DOCS="CHANGELOG LICENSE README.txt"

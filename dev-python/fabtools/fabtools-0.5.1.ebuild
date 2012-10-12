# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Tools for writing awesome Fabric files"
HOMEPAGE="https://github.com/ronnix/fabtools
http://pypi.python.org/pypi/fabtools"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-python/fabric-1.2.0"

DOCS="README.rst LICENSE docs/*"

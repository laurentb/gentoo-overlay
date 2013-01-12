# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.6 3:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Small tool to interact with shell pipes"
HOMEPAGE="http://pypi.python.org/pypi/chut
https://github.com/gawel/chut"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/six
dev-python/docopts
dev-python/ConfigObject"

DOCS="README.rst"

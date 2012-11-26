# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.6 3:3.2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.5 3.1"

inherit distutils

DESCRIPTION="Python bindings for your taskwarrior database"
HOMEPAGE="http://pypi.python.org/pypi/taskw
https://github.com/ralphbean/taskw"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="app-misc/task
dev-python/six"

DOCS="README.rst LICENSE.txt"

# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

# I know. But it works.
MY_PV=${PV/./x}
MY_PV=${MY_PV/./b}
MY_PV=${MY_PV/x/.}
MY_P="${PN}-${MY_PV}"
S="${WORKDIR}/${MY_P}"

inherit distutils

DESCRIPTION="Core files for interactive git filter branch."
HOMEPAGE="https://github.com/mike-perdide/gfbi_core
http://pypi.python.org/pypi/gfbi_core"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-python/git-python-0.3.1"

DOCS="*.txt README.rst CHANGELOG"

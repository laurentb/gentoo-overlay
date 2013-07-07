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

DESCRIPTION="Python Qt4 frontend for git filter-branch and git cherry-pick."
HOMEPAGE="https://github.com/mike-perdide/gitbuster
http://pypi.python.org/pypi/gitbuster"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/PyQt4
>=dev-python/gfbi_core-0.5.6
virtual/python-argparse"

DOCS="*.txt README.rst CHANGELOG"

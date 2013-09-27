# Copyright 2012-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

# I know. But it works.
MY_PV=${PV/./x}
MY_PV=${MY_PV/./b}
MY_PV=${MY_PV/x/.}
MY_P="${PN}-${MY_PV}"
S="${WORKDIR}/${MY_P}"

inherit distutils-r1

DESCRIPTION="Python Qt4 frontend for git filter-branch and git cherry-pick."
HOMEPAGE="https://github.com/mike-perdide/gitbuster
https://pypi.python.org/pypi/gitbuster"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/PyQt4[$PYTHON_USEDEP]
>=dev-python/gfbi_core-0.5.6[$PYTHON_USEDEP]
virtual/python-argparse[$PYTHON_USEDEP]"

DOCS=( AUTHORS.txt CHANGELOG LICENSE.txt README.rst )

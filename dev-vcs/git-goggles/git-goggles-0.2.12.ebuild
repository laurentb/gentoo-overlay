# Copyright 2011-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="A git utility to manage your source code as it evolves through its development lifecycle"
HOMEPAGE="https://github.com/nowells/git-goggles
http://pypi.python.org/pypi/git-goggles"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/termcolor[${PYTHON_USEDEP}]
dev-vcs/git"

DOCS=( AUTHORS INSTALL LICENSE README.rst docs/index.rst docs/overview.rst )

python_install() {
	distutils-r1_python_install --install-scripts="/usr/libexec/git-core"
}

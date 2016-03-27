# Copyright 2011-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="A git utility to manage your source code as it evolves through its development lifecycle"
HOMEPAGE="https://github.com/nowells/git-goggles
https://pypi.python.org/pypi/git-goggles"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/termcolor[${PYTHON_USEDEP}]
dev-vcs/git"

DOCS=( AUTHORS INSTALL LICENSE README.rst docs/index.rst docs/overview.rst )

python_install_all() {
	distutils-r1_python_install_all --install-scripts="/usr/libexec/git-core"
}

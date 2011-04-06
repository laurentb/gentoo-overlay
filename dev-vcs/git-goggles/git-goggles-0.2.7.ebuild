# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3
PYTHON_DEPEND="2:2.4"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="A git management utilitiy that allows you to manage your source code as it evolves through its development lifecycle"
HOMEPAGE="https://github.com/nowells/git-goggles
http://pypi.python.org/pypi/git-goggles"
SRC_URI="http://pypi.python.org/packages/source/g/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/termcolor"

DOCS="AUTHORS INSTALL LICENSE README.rst docs/*"

src_install() {
	distutils_src_install --install-scripts="/usr/libexec/git-core"
}

# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils bash-completion-r1

DESCRIPTION="A git CLI tool to manage branches easily."
HOMEPAGE="https://github.com/kennethreitz/legit
http://pypi.python.org/pypi/legit"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="zsh-completion"

DEPEND=""
RDEPEND=">=dev-python/git-python-0.3.0
>=dev-python/clint-0.2.4
>=dev-python/smmap-0.8.2"

DOCS="README.rst LICENSE"

distutils_src_install_post_hook() {
	newbashcomp extra/bash-completion/${PN} ${PN}

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins extra/zsh-completion/_${PN}
	fi
}

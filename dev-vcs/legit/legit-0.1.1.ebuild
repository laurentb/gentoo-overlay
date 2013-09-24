# Copyright 2012-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1 bash-completion-r1

DESCRIPTION="A git CLI tool to manage branches easily."
HOMEPAGE="https://github.com/kennethreitz/legit
https://pypi.python.org/pypi/legit"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="zsh-completion"

DEPEND=""
RDEPEND=">=dev-python/git-python-0.3.0[$PYTHON_USEDEP]
>=dev-python/clint-0.2.4[$PYTHON_USEDEP]
>=dev-python/smmap-0.8.2[$PYTHON_USEDEP]"

DOCS=( README.rst LICENSE )

src_install() {
	distutils-r1_src_install

	newbashcomp extra/bash-completion/${PN} ${PN}

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins extra/zsh-completion/_${PN}
	fi
}

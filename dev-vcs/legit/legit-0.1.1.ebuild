# Copyright 2012-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 bash-completion-r1

DESCRIPTION="A git CLI tool to manage branches easily."
HOMEPAGE="https://github.com/kennethreitz/legit
https://pypi.python.org/pypi/legit"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="zsh-completion"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
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

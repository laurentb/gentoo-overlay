# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.6 3:3.1"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.5"

inherit distutils

DESCRIPTION="IRC (Internet Relay Chat) protocol client library for Python"
HOMEPAGE="http://bitbucket.org/jaraco/irc
http://pypi.python.org/pypi/irc"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND=""
RDEPEND=""

distutils_src_compile_pre_hook() {
	sed -e "/hgtools/d" -i *.py
	sed -e "/pytest-runner/d" -i *.py

	sed -e "s/use_hg_version=True/version=\"${PV}\"/" -i setup.py
}

distutils_src_install_post_hook() {
	if use doc; then
		insinto "/usr/share/doc/${PF}/scripts"
		doins scripts/*
	fi
}

DOCS="README.rst CHANGES.rst COPYING LICENSE"

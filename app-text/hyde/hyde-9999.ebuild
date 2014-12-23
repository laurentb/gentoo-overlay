# Copyright 2012-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

if [ "$PV" == "9999" ]; then
	EGIT_REPO_URI="git://github.com/${PN}/${PN}.git
	https://github.com/${PN}/${PN}.git"
	inherit git-2
fi

DESCRIPTION="Static website generator written in Python"
HOMEPAGE="http://hyde.github.io/ https://github.com/hyde/hyde
https://pypi.python.org/pypi/hyde"
if [ "$PV" != "9999" ]; then
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
else
	SRC_URI=""
	KEYWORDS=""
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=dev-python/fswrap-0.1.1[${PYTHON_USEDEP}]
	>=dev-python/commando-0.3.4[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.10[${PYTHON_USEDEP}]
	>=dev-python/markdown-2.3.1[${PYTHON_USEDEP}]
	>=dev-python/markupsafe-0.18[${PYTHON_USEDEP}]
	>=dev-python/pygments-1.6[${PYTHON_USEDEP}]
	>=dev-python/typogrify-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.7.1[${PYTHON_USEDEP}]"
# smartypants: https://github.com/hyde/hyde/issues/229

src_prepare() {
	# incorrect, this is for typogrify only
	sed -i '/smartypants/d' setup.py requirements.txt
	# crap
	sed -i '/distribute_setup/d' setup.py
	# stupid
	sed -i 's/==/>=/' requirements.txt
	sed -i "s/'\([a-z0-9]\+\)==/'\1>=/" setup.py
}

DOCS=( LICENSE README.rst AUTHORS.rst CHANGELOG.rst )

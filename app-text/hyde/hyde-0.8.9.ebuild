# Copyright 2012-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Static website generator written in Python"
HOMEPAGE="http://hyde.github.io/ https://github.com/hyde/hyde
https://pypi.python.org/pypi/hyde"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=dev-python/fswrap-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/commando-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.11[${PYTHON_USEDEP}]
	>=dev-python/markdown-2.6.2[${PYTHON_USEDEP}]
	>=dev-python/markupsafe-0.23[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.0.2[${PYTHON_USEDEP}]
	>=dev-python/typogrify-2.0.7[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.7.3[${PYTHON_USEDEP}]"

src_prepare() {
	# incorrect, this is for typogrify only
	sed -i '/smartypants/d' setup.py requirements.txt
	# stupid
	sed -i 's/==/>=/' requirements.txt
}

DOCS=( LICENSE README.rst CHANGELOG.rst )

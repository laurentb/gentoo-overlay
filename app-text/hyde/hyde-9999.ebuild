# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit base distutils
if [ "$PV" == "9999" ]; then
	EGIT_REPO_URI="git://github.com/${PN}/${PN}.git
	https://github.com/${PN}/${PN}.git"
	inherit git-2
fi

DESCRIPTION="Static website generator written in Python"
HOMEPAGE="http://hyde.github.com/ https://github.com/hyde/hyde
http://pypi.python.org/pypi/hyde"
if [ "$PV" != "9999" ]; then
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	DOCS=""
else
	SRC_URI=""
	KEYWORDS=""
	DOCS="LICENSE AUTHORS.rst CHANGELOG.rst TODO.rst README.rst"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=">=dev-python/commando-0.1.1a
	virtual/python-argparse
	>=dev-python/jinja-2.5.5
	>=dev-python/markdown-2.0.3
	>=dev-python/pyyaml-3.09
	dev-python/pygments
	dev-python/typogrify-hyde"

src_prepare() {
	sed -i "s/'argparse',//" setup.py
	rm -rf "${PN}.egg-info"
}

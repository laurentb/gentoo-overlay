# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit base distutils
GH_USER="nicolargo"
if [ "$PV" == "9999" ]; then
	EGIT_REPO_URI="git://github.com/${GH_USER}/${PN}.git
	https://github.com/${GH_USER}/${PN}.git"
	inherit git-2
fi

DESCRIPTION="CLI curses-based monitoring tool"
HOMEPAGE="https://github.com/nicolargo/glances
http://blog.nicolargo.com/tag/glances"
if [ "$PV" != "9999" ]; then
	SRC_URI="http://github.com/downloads/${GH_USER}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	DOCS=""
else
	SRC_URI=""
	KEYWORDS=""
	DOCS=""
fi

LICENSE="LGPL-3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=">=dev-python/pystatgrab-0.5"

src_configure() {
	# avoid installing in /site-packages/src/
	# there's probably a better fix
	mv src glances
	sed -i "s/'src'/'glances'/" setup.py

	# create the console script. we need setuptools for that.
	sed -i 's/distutils\.core/setuptools/' setup.py
	sed -i 's/^)$/,entry_points={"console_scripts": ["glances = glances.glances:main"]})/' setup.py

	# it's a symlink, and portage tries to install it anyway
	rm README.md
}

distutils_src_install_post_hook() {
	doman man/glances.1
}

DOCS="AUTHORS COPYING ChangeLog NEWS README README-fr TODO"

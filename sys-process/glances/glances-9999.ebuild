# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit base distutils
GH_USER="nicolargo"
if [ "$PV" == "9999" ]; then
	EGIT_BRANCH="experimental"
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
RDEPEND=">=dev-python/psutil-0.4.1"

src_prepare() {
	sed -i "s#share/doc/${PN}#share/doc/${PF}#" setup.py
}

DOCS="AUTHORS COPYING ChangeLog NEWS README README-fr"

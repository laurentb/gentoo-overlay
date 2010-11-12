# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3

inherit distutils
[ "$PV" == "9999" ] && inherit git
[ "$PV" == "9998" ] && inherit git
PYTHON_DEPEND="2:2.5"

DESCRIPTION="Weboob (Web Out Of Browsers) provides several applications to interact with a lot of websites."
HOMEPAGE="http://weboob.org/"
SRC_URI=""
EGIT_BRANCH="master"
[ "$PV" == "9999" ] && EGIT_REPO_URI="git://git.symlink.me/pub/romain/weboob.git"
[ "$PV" == "9998" ] && EGIT_REPO_URI="git://git.symlink.me/pub/romain/weboob-stable.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="X"

DEPEND="dev-python/prettytable
	dev-python/html2text
	dev-python/mechanize
	dev-python/python-dateutil
	dev-python/html5lib
	dev-python/lxml
	dev-python/pyyaml
	dev-python/imaging
	dev-python/gdata
	dev-python/feedparser
	X? ( dev-python/PyQt4[X] dev-python/pyxdg )"
RDEPEND="${DEPEND}"

set_global_options() {
	local qtopt="--no-qt" && xdgopt="--no-xdg"
	use X && qtopt="--qt" && xdgopt="--xdg"
	DISTUTILS_GLOBAL_OPTIONS=($qtopt $xdgopt)
}

src_compile() {
	set_global_options
	distutils_src_compile
}

src_install() {
	set_global_options
	distutils_src_install
}

